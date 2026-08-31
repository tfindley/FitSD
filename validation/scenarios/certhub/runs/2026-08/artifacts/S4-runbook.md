# CertHub — Runbook

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub. Linked from the Platform Service Register entry.

| | |
|---|---|
| **Service** | CertHub (Tier 1) |
| **Primary** | Priya Chandra · **Deputy:** Jordan Blake |
| **Author** | Priya Chandra |
| **Accepted by operators** | Owen Gallagher, Rafi Osman — review session 2026-11-17 |
| **Date** | 2026-11-19 |
| **Review cycle** | Proposed annually (no standing cycle for service docs — see HLD header note) |
| **Companions** | [HLD](S4-HLD.md) · [Recovery procedure](S4-recovery-procedure.md) · [Monitoring & incident profile](S4-monitoring-incident-profile.md) · [User guide](S4-user-guide.md) · Rafi's triage guide (child page) |

> **The one thing to hold on to:** a CertHub outage blocks **new issuance and renewal only**. Nothing already issued stops working. Renewals start ≥30 days (public) / 8 h (internal) before expiry, so you have hours-to-days of slack on almost everything except an actual sub-7-day expiry alert — treat *those* as the emergency.

## 1. Quick facts

| | |
|---|---|
| Portal / API | `https://certhub.internal.fernbrook.io` (`/api/v1`, `/healthz`) |
| Internal ACME | `https://ca.internal.fernbrook.io/acme/internal/directory` (`/health`) |
| Namespace | `certhub` on `plat-prod-1` (dev twin: `plat-dev-1`) |
| GitOps | `fernbrook/platform-certhub` → Flux Kustomization `certhub` |
| Dashboards | Grafana **CertHub — Service health** (`/d/certhub-health`) and **CertHub — Certificate posture** (`/d/certhub-posture`) |
| Alert routing | Sev1/2 → Opsgenie Platform rota; Sev3/4 → `#platform-alerts` |
| Tickets | JSM queue **CertHub** (two request types — see triage guide) |
| Standard change | SC-CERT-01 covers machine-driven issuance/renewal; everything else CH-01 normal |

## 2. Components

| Workload | Kind | Purpose | Healthy looks like |
|---|---|---|---|
| `step-ca` | Deployment ×2 | Internal CA + ACME server (KMS-backed) | 2/2 Ready; `/health` 200 |
| `certhub-pg` | CNPG cluster ×2 | Postgres: step-ca datastore + inventory | `kubectl -n certhub get cluster certhub-pg` → `Cluster in healthy state` |
| `certhub-portal` | Deployment ×2 | Portal/API, Okta OIDC, audit | 2/2 Ready; `/healthz` 200 |
| `certhub-inventory` | Deployment | Inventory API + metrics exporter | Ready; `certhub_scanner_last_success_timestamp` fresh |
| `inventory-scan-*` | CronJobs ×3 | endpoints (6 h), CT (hourly), DNS (daily) | Last job Completed |
| `certhub-canary` | CronJob (15 min) | Synthetic ACME order end to end | `certhub_canary_success == 1` |

## 3. Health check (run this first, ~2 minutes)

```sh
kubectl --context plat-prod-1 -n certhub get pods
kubectl -n certhub get cluster certhub-pg           # CNPG status
curl -fsS https://certhub.internal.fernbrook.io/healthz
step ca health --ca-url https://ca.internal.fernbrook.io \
  --root /etc/fernbrook/roots.pem                    # from any Platform bastion
flux -n certhub get kustomizations                   # Applied revision = main@<sha>
```

Then Grafana `certhub-health`: canary green, issuance error rate <1%, scanner freshness <8 h, KMS error count 0.

## 4. Incident profile (as registered — canonical copy)

Registered with the service desk 2026-11-17 per IM-02; evidence in [Monitoring & incident profile](S4-monitoring-incident-profile.md) §4.

| Sev | Trigger for CertHub | Response |
|---|---|---|
| **Sev1** | Issuance API down with ≥2 teams' pipelines blocked; **or** suspected compromise of any CA key (→ §5.6, revocation SOP-3 immediately) | Opsgenie, 15 min, major-incident path per IM-02 |
| **Sev2** | Issuance failing for one team, no workaround; **or** any inventoried cert <7 days from expiry with no renewal in flight, whatever the cause | Opsgenie, 4 working hours |
| **Sev3** | Portal degraded but API workable; scanner stale >24 h | Next business day, `#platform-alerts` |
| **Sev4** | Cosmetic / dashboard issues | Backlog |

Reportable bar Sev1–2 per the SAC baseline.

## 5. Failure modes — step by step

### 5.1 ACME issuance failing for a team's deploy

*Symptoms: pipeline stuck on Certificate not Ready; JSM "Certificate issue or failure" ticket; portal shows order in `pending`/`errored`.*

1. Identify the stuck object in the **team's** cluster (get context/namespace from the ticket or portal order view):
   ```sh
   kubectl --context <team-ctx> -n <ns> get certificate,certificaterequest,order,challenge
   kubectl --context <team-ctx> -n <ns> describe challenge <name>
   ```
2. **Which issuer?**
   - `certhub-internal` → check step-ca: `kubectl -n certhub logs deploy/step-ca --since=15m | grep -i error`. KMS throttling/IAM errors show here (`certhub_kms_errors_total` on the health dashboard). If step-ca is unhealthy → §5.5.
   - `letsencrypt-prod` / `sectigo-ov` → almost always DNS-01. Check the challenge record landed:
     ```sh
     dig +short TXT _acme-challenge.<domain> @8.8.8.8
     aws route53 list-resource-record-sets --hosted-zone-id <zone> \
       --query "ResourceRecordSets[?Type=='TXT']" --profile certhub-dns01
     ```
     Propagation delay <5 min is normal. NXDOMAIN on the delegation itself = someone changed the parent zone NS records → escalate to whoever ran the last DNS change (check Jira `CHANGE`), fix the `_acme-challenge` NS delegation back per HLD §6.
   - Let's Encrypt rate limit (`urn:ietf:params:acme:error:rateLimited` in the order): staggered onboarding should prevent this; workaround is the `sectigo-ov` issuer for the affected domain (R5 mitigation), then wait out the window (usually 1 week for duplicate-cert limit, 1 h for failed validations).
3. `403 namespace not onboarded` from step-ca → the team skipped onboarding; point them at SOP-1 / User guide §3. Not an incident.
4. One team blocked, no workaround → **Sev2**; ≥2 teams → **Sev1**.
5. Genuine deploy emergency while broken: SOP-4 break-glass manual issuance.

### 5.2 Expiry alert / renewal failure

*Alerts: `CertHubCertExpiry30d` (warn) → `CertHubCertExpiry14d` (Sev3 ticket) → `CertHubCertExpiry7dNoRenewal` (**Sev2**).*

1. Open the alert — labels carry `cn`, `owner_team`, `source`, `auto_renew`. Look it up in the portal (**Inventory → search CN or fingerprint**).
2. Route by `source`:
   - **`issued` (CertHub-managed):** renewal is broken, find out why. `kubectl --context <team-ctx> -n <ns> describe certificate <name>`; then §5.1 triage. Force it once fixed: `cmctl renew <name> -n <ns> --context <team-ctx>`.
   - **`discovered`, owned:** the owning team renews by their legacy method (they're pre-migration). Raise/nudge the JSM ticket with the owning team; the alert exists precisely so this can't be missed. Offer early migration.
   - **`discovered`, unowned:** this is the INC-4211 failure mode surfacing — **on-call adopts it**. Identify what serves it (`inventory-scan-endpoints` records IP/SNI), renew manually (SOP-4 or the relevant CA account), then get an owner assigned via Marcus. Do not close the alert unowned.
3. <7 days and you cannot renew (validation broken, CA account issue): escalate Sev2 → Sev1 judgement to Marcus; consider the paid-CA fallback issuer; worst case a manual cert from the Sectigo portal (dual control on the account, credentials in the Platform vault).
4. Post-fix: confirm `certhub_cert_expiry_seconds` for that fingerprint moved out past 30 days.

### 5.3 Portal / API down

*Alert: `CertHubPortalDown`. Issuance and renewal are unaffected (cert-manager talks ACME directly) — say so in the incident channel early; it caps this at Sev3 unless issuance is also failing.*

1. `kubectl -n certhub get pods -l app=certhub-portal` · `kubectl -n certhub logs deploy/certhub-portal --since=10m`
2. Common causes seen in build: Okta OIDC misconfig after a change (JWKS errors in the log — check the last Flux-applied commit: `flux -n certhub get kustomizations`; revert the commit, Flux reconciles), or `certhub-pg` unhealthy (§5.5 step 2).
3. Restart is safe and stateless: `kubectl -n certhub rollout restart deploy/certhub-portal`.
4. Okta itself down (status.okta.com): portal auth fails estate-wide, nothing we can fix — note on the incident, API tokens for CI keep working.

### 5.4 Scanner false positives

*Symptoms: inventory shows unknown/duplicate certs that turn out to be expected — SNI variants, appliance self-signed certs, dev throwaways. Alert `CertHubScannerStale` is the inverse problem (scans not running) — for that, check the CronJob's last job logs and re-run: `kubectl -n certhub create job --from=cronjob/inventory-scan-endpoints manual-$(date +%s)`.*

1. Confirm it is genuinely expected — check with the owning team; a "false positive" that's actually an unknown cert is the whole point of the scanner. When in doubt it stays in inventory.
2. Suppress via Git, never DB edits (DEC11): add the SPKI fingerprint + reason + owner to `inventory/expected-certs.yaml` in `fernbrook/platform-certhub`, PR reviewed by the other of primary/deputy, Flux rolls it out.
3. Full procedure: SOP-5.

### 5.5 step-ca / CA down

*Alert: `CertHubCAUnhealthy` or canary red. Internal issuance/renewal pauses; 24 h leafs give ~8 h of slack before anything expires — check `certhub_cert_expiry_seconds{source="issued"} < 8*3600` to see the actual fuse.*

1. Pods: `kubectl -n certhub get pods -l app=step-ca`; logs for KMS/IAM errors (`AccessDenied`, throttling), DB connection failures.
2. Postgres: `kubectl -n certhub get cluster certhub-pg`; if degraded, CNPG usually self-heals a replica — a failed primary promotes in <1 min. Full DB loss → [Recovery procedure](S4-recovery-procedure.md) §3.2.
3. KMS unreachable/denied: check AWS health + the `certhub-issuing-i1` key policy against the last change in `CHANGE`. step-ca cannot sign without KMS — this is the one dependency with no local fallback (by design, DEC3).
4. ≥2 teams blocked → Sev1.

### 5.6 Certificate revocation / suspected compromise

*A suspected **CA key** compromise is Sev1 and invokes SOP-3 + IM-02 major-incident path immediately. A single leaf compromise is routine.*

- **Leaf:** `step ca revoke <serial> --reason keyCompromise --ca-url https://ca.internal.fernbrook.io --root /etc/fernbrook/roots.pem` (admin provisioner; credentials via `certhub-admin`). Then force reissue: `cmctl renew <cert> -n <ns>`. Internal leafs age out in ≤24 h anyway (DEC12).
- **Public cert:** revoke via the issuing CA (Let's Encrypt: `certbot revoke` with the account key from the Platform vault; Sectigo: vendor portal, dual control) and reissue via cert-manager.
- **Intermediate (I1) suspected compromised:** Sev1. Page Elena Vasquez (security SME) + Marcus. Freeze issuance (`kubectl -n certhub scale deploy/step-ca --replicas=0`), then Recovery §3.3: new intermediate from the offline root, redistribute `fernbrook-ca-bundle`, mass-reissue (internal estate self-heals in ≤24 h once the new I1 is live). Rehearsed 2026-11-13 (live canary revocation; ceremony + mass-reissue tabletop — see FRM-03).

## 6. Routine operations (SOPs)

*Per the SAC baseline these are the service's standing procedures; adopted at the 2026-11-17 operator review.*

- **SOP-1 — Domain / namespace onboarding.** Triggered by the JSM request type. Verify the requester's team owns the domain/namespace (service register + Okta group), approve in the portal (**Admin → Onboarding**), which templates the Route 53 `_acme-challenge` delegation if a new zone (that part is a CH-01 normal change), and grants the team group. ~15 min plus DNS change lead time.
- **SOP-2 — Intermediate certificate renewal (year 2: 2028-09).** Re-sign I1 from the offline root: this is a ceremony — follow Recovery §3.3 with both custodians. Book a month ahead. **Alert `CertHubIntermediateExpiry180d` is the tripwire — do not snooze it.**
- **SOP-3 — Revocation.** §5.6. For compromise: revoke, rotate, *then* investigate; audit log (portal → Audit) answers who issued what.
- **SOP-4 — Break-glass manual issuance.** When CertHub is down and a deploy genuinely cannot wait: from a Platform bastion, `step ca certificate <cn> cert.crt cert.key --provisioner break-glass --ca-url ...` — the `break-glass` provisioner password is in the Platform vault under dual control (SEC-02). Every use is Sev2-logged retrospectively and the cert is re-issued properly within 5 working days. If step-ca itself is the outage, use the Sectigo portal for public certs.
- **SOP-5 — Scanner false-positive handling.** §5.4: verify → suppress via `expected-certs.yaml` PR → peer review → Flux. Suppressions are reviewed at the monthly posture review.
- **SOP-6 — Monthly posture review.** First ops review of the month: unowned certs (target zero), suppression list, migration state (until 2026-12-18), Let's Encrypt/Sectigo account health, KMS error trend.

## 7. Escalation

| Level | Who | When |
|---|---|---|
| Tier 1/2 | Rafi Osman (triage guide) | Portal error states, onboarding queries |
| On-call | Opsgenie Platform rota | Sev1/2 |
| Service | Priya Chandra → Jordan Blake | Anything beyond runbook steps |
| Security | Elena Vasquez | Any suspected key compromise, SEC-01 questions |
| Management | Marcus Webb | Sev1, unowned-cert adoption, anything cross-team |
| Vendors | smallstep (community — GitHub issues); Sectigo support (contract, SUP-044); Let's Encrypt (status page only — no SLA, deliberate, Gate 1 §6b) | |

## 8. Walk-through and acceptance log

| Date | What | Who |
|---|---|---|
| 2026-10-21 | Portal error-surface walk-through (triage guide drafted) | Rafi Osman with Priya |
| 2026-11-05 | Full runbook walk-through (interim deputy, dated per SAC continuity rule) | Marcus Webb with Priya |
| 2026-11-12 | Full runbook walk-through (deputy of record) — incl. health checks, §5.1/5.2 hands-on in dev, SOP-4 dry run | Jordan Blake with Priya |
| 2026-11-13 | Revocation rehearsal (§5.6): live canary revoke + reissue; intermediate-compromise tabletop | Priya, Jordan, Elena |
| 2026-11-17 | Operator review & acceptance of runbook + SOPs | Owen Gallagher, Rafi Osman |
| Q1 2027 (planned) | Intermediate-renewal ceremony shadow drill (Jordan) — scheduled, not an acceptance blocker per baseline | Jordan with Priya/Elena |
