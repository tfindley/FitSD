# CertHub — Backup & Recovery Procedure

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub.

| | |
|---|---|
| **Service** | CertHub (Tier 1 — RTO 4 working hours / RPO 24 h) |
| **Owner** | Priya Chandra · **Deputy:** Jordan Blake |
| **Date** | 2026-11-19 |
| **Test-restore cadence** | At acceptance, then 6-monthly (Tier 1, SAC baseline). Next due **2027-05**. |
| **Companions** | [HLD](S4-HLD.md) §4–5 · [Runbook](S4-runbook.md) §5.5 · Restore Test Log (Confluence PLAT → Governance) |

## 1. What is backed up

| What | How | Schedule | Where | Retention |
|---|---|---|---|---|
| Postgres (`certhub-pg`: step-ca datastore + inventory + audit log) | CNPG barman-cloud — base backup + continuous WAL (**authoritative** for the DB, DEC9) | Base nightly 02:00 UTC; WAL continuous | `s3://fernbrook-backup-euw1/cnpg/certhub-pg/` — separate AWS account (`fernbrook-backup`), separate region (eu-west-1; prod is eu-west-2), per SEC-03 | 35 nightly + 12 monthly |
| Namespace objects + PVs (portal config, step-ca `ca.json` rendered state, secrets) | Velero schedule `certhub-nightly` | 02:30 UTC | `s3://fernbrook-backup-euw1/velero/plat-prod-1/` | 35 nightly + 12 monthly |
| Everything declarative | Git — `fernbrook/platform-certhub` (Flux source of truth) | On commit | GitHub (org backup regime) | — |

**Deliberately NOT in any backup:**

| What | Why | Recovery stance |
|---|---|---|
| **Intermediate key (Issuing I1)** | AWS KMS, **non-exportable** — it cannot be backed up, by design (DEC3). | KMS multi-region replica key in eu-west-1 (`alias/certhub-issuing-i1`, replicated). Loss of the key material entirely (both regions) → issue a **new** intermediate from the root (§3.3). |
| **Root key (Root R1)** | Offline by ratified Gate 2 design exception — protected by being *off* the network, not by Velero. | Two sealed encrypted USB tokens under dual control: **TE-0041** (office safe), **TE-0042** (off-site safe deposit). Passphrase split: half Marcus Webb, half Elena Vasquez. Custody + re-access verified at the ceremony (CER-2026-001, 2026-09-18). |
| Leaf private keys | Generated in consuming namespaces; never transit CertHub (DEC4). | Teams re-issue — that *is* the recovery. Internal leafs regenerate inside 24 h. |

**Backup monitoring:** `CertHubBackupFailed` fires Sev3 on a missed CNPG base backup or Velero failure (`velero backup get` shows Partial/Failed). Checked at SOP-6 monthly review.

## 2. Recovery principles

1. **Nothing already issued depends on CertHub being up.** Restore calmly; the fuse is the shortest `certhub_cert_expiry_seconds`, not the outage clock.
2. Rebuild is **Git first** (Flux re-creates every workload), **data second** (CNPG restore), **verify by issuing** (a restore that can't issue a cert is not a recovery).
3. The KMS key makes CA recovery cheap: a restored step-ca pointed at the same KMS alias signs again immediately. No key material ever moves in a normal restore.

## 3. Procedures

### 3.1 Namespace or cluster loss (the standard restore — this is what we test)

*Use for: namespace deleted, cluster rebuild, region evacuation to `plat-dr-1`.*

1. Bootstrap Flux on the target cluster (standard Platform DR step); confirm Kustomization `certhub` reconciles: `flux -n certhub get kustomizations`. Workloads come up; step-ca waits on its DB.
2. Restore Postgres from barman-cloud (point-in-time to latest WAL):
   ```sh
   kubectl -n certhub apply -f recovery/certhub-pg-restore.yaml   # CNPG Cluster with
   # spec.bootstrap.recovery.source = certhub-pg, targetTime = <now or PIT>
   kubectl -n certhub get cluster certhub-pg-restored -w
   ```
   Then repoint the app Services per the commented block in the same file (or rename the cluster back once healthy).
3. Restore non-DB objects if the namespace was lost wholesale:
   ```sh
   velero restore create certhub-$(date +%Y%m%d) \
     --from-backup certhub-nightly-<latest> --include-namespaces certhub
   ```
   (Secrets not in Git — the Okta OIDC client secret, EAB keys — come from this. If Velero is also gone, re-mint them: Okta admin console + Sectigo portal; ~30 min.)
4. Verify KMS access: step-ca logs show a successful signer init; `step ca health` returns ok.
5. **Prove it by issuing:** run one canary order end to end —
   ```sh
   kubectl -n certhub create job --from=cronjob/certhub-canary restore-verify
   kubectl -n certhub logs job/restore-verify   # expect: order valid, cert issued
   ```
6. DNS: if the portal/CA moved clusters, update `ca.internal.fernbrook.io` / `certhub.internal.fernbrook.io` records (CH-01 change; pre-approved under DR invocation).
7. Log the event; if this was a real DR, book a fresh test restore within a month.

**RPO note:** DB loss loses at most 24 h of *inventory/audit writes* and pending ACME orders (WAL usually shrinks this to minutes). In-flight orders fail safe — cert-manager simply retries and gets new orders.

### 3.2 Postgres corruption only

CNPG replica promotion handles instance failure automatically. For actual data corruption: scale step-ca and portal to 0, restore per §3.1 step 2 with `targetTime` just before the corruption, scale back up, §3.1 step 5 to verify. Reconcile inventory afterwards by forcing a full scan (`kubectl -n certhub create job --from=cronjob/inventory-scan-endpoints ...` ×3 scanners) — the estate is the source of truth for discovered certs, so the scanner heals staleness.

### 3.3 Intermediate loss or compromise — new intermediate from the root (ceremony)

*Triggers: KMS key material lost in both regions (near-inconceivable), key policy irrecoverably wrecked, or suspected I1 compromise (Sev1 — runbook §5.6 first: freeze issuance).*

Elapsed target: ≤1 business day. Requires: both passphrase custodians (Marcus, Elena), one token (TE-0041 or TE-0042), the air-gapped ceremony laptop (IT store, asset FB-LT-0977), a fresh USB stick for transfer of **public** material only.

1. Convene per the ceremony script in **CER-2026-001** (witness, camera off, log every step with timestamps; a signed copy files to the same Confluence tree).
2. Create the replacement KMS key: `aws kms create-key --region eu-west-2 ...` → new alias `certhub-issuing-i2`; generate a CSR against it from a bastion: `step certificate create --csr --kms "awskms:alias/certhub-issuing-i2" "Fernbrook Issuing CA I2" i2.csr` — **the private key never leaves KMS**.
3. Carry `i2.csr` to the air-gapped laptop. Unseal the token (dual-control passphrase halves), sign: `step certificate sign --profile intermediate-ca --not-after 26280h i2.csr root.crt root.key` → `i2.crt`. Re-seal the token in a **new numbered tamper-evident bag**, record the number in the ceremony log, return to safe.
4. Carry `i2.crt` (public) back; update `ca.json` (Git PR: new KMS URI + cert), Flux rolls step-ca; verify `step ca health` and a canary issuance.
5. Distribute trust: update `fernbrook-ca-bundle` (trust-manager) to Root R1 + I2 (+ I1 during overlap unless compromised — if compromised, drop I1 and revoke it in the bundle immediately).
6. Mass reissue: internal 24 h leafs roll themselves within a day; force stragglers with `cmctl renew`. Public certs are unaffected (different chain).
7. Close out: ceremony record signed and filed; supplier/risk registers updated; if compromise-triggered, IM-02 major-incident review.

### 3.4 Total root loss (doomsday)

Both tokens destroyed/unreadable or root passphrase halves lost. The root signs *nothing* day to day, so nothing breaks immediately — I1 keeps working until 2029-09. Recovery = stand up a **new root** (full ceremony per CER-2026-001 script), new intermediate, distribute the new bundle alongside the old, then let the estate roll. Start within a month of discovering the loss; the deadline is soft but the work must not be deferred to the I1 expiry crunch. Annual custody check (each June review): both bags sighted, seals intact, custodians current — a leaver among the four custody-holders triggers re-seal/re-split within 10 working days (SEC-02 JML).

## 4. Test-restore evidence (SAC: dated, with evidence)

| Date | Test | Result | Evidence |
|---|---|---|---|
| 2026-11-04 | Full §3.1 restore into `plat-dev-1` ns `certhub-restore-test` from Velero PV snapshots | **FAILED** — restored step-ca datastore inconsistent (Velero snapshot of running Postgres; recent writes missing; ACME account keys desynced). Root cause → backup redesign **DEC9**: CNPG barman-cloud made authoritative for the DB. | Restore Test Log **RTL-2026-013**; job logs attached |
| 2026-11-10 | Full §3.1 re-run: Flux bootstrap + CNPG barman restore + Velero objects; canary issuance verified (internal + Let's Encrypt staging) | **PASSED** — elapsed **2 h 50 m** end to end (inside RTO 4 wh); data current to 02:00 base + WAL (RPO ~minutes, ≤24 h bar) | Restore Test Log **RTL-2026-014**; S3 evidence links + canary cert serial recorded in the log entry |
| 2026-09-18 | Root custody & re-access: token unsealed, root verified readable, re-sealed under dual control at ceremony close | PASSED | **CER-2026-001** §7 |

*The 11-04 failure is exactly why the baseline demands a **tested** restore — on paper the Velero scheme looked compliant. Next scheduled test: 2027-05 (calendar hold on the Platform rota; logged in the Restore Test Log as due).*
