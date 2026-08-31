# CertHub — Monitoring, Alerting & Incident Profile

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub. *This page is the evidence pack for the SAC Monitoring and Incident-profile rows, and the registration record for the incident profile (IM-02).*

| | |
|---|---|
| **Service** | CertHub (Tier 1) |
| **Owner** | Priya Chandra · **Deputy:** Jordan Blake |
| **Date** | 2026-11-19 |
| **Registered with service desk** | 2026-11-17 (Owen Gallagher — see §4) |

## 1. What is monitored

All metrics scrape into the existing Prometheus/Grafana stack; dashboards **CertHub — Service health** (`/d/certhub-health`) and **CertHub — Certificate posture** (`/d/certhub-posture`).

| Signal | Metric | Why |
|---|---|---|
| Certificate expiry — **every inventoried cert**, issued or discovered | `certhub_cert_expiry_seconds{cn,owner_team,source,auto_renew}` | The point of the service. This is how the SAC baseline's "expiry-style dates always monitored" row is met **estate-wide** (212 certs at acceptance). |
| End-to-end issuance | `certhub_canary_success` (15-min synthetic ACME order) | Availability is measured on what users need — a cert — not on pods being green. |
| CA health | step-ca `/health`, `certhub_kms_errors_total`, issuance error/latency | |
| Portal/API | blackbox probe `/healthz`, 5xx rate, OIDC failures | |
| Scanner freshness | `certhub_scanner_last_success_timestamp` per scanner | A stale scanner silently re-opens the INC-4211 blind spot. |
| Backups | CNPG base-backup age; Velero backup status | Tested-restore row depends on backups actually existing. |
| CA's own certs | I1/root notAfter exported like any other cert | The cobbler's children get shoes: the CA's own expiry is monitored with the longest fuse of all. |

## 2. Alert catalogue (thresholds and routing)

Routing per SAC baseline: **Sev1/2 → Opsgenie Platform rota; Sev3/4 → `#platform-alerts`** (+ JSM ticket where noted). All rules live in Git (`platform-certhub/monitoring/alerts.yaml`).

| Alert | Fires when | Sev | Route |
|---|---|---|---|
| `CertHubCertExpiry30d` | Any inventoried cert <30 d, `auto_renew="false"` or renewal not progressing | warn | `#platform-alerts` |
| `CertHubCertExpiry14d` | <14 d, no renewal in flight | Sev3 | `#platform-alerts` + auto JSM ticket to owning team |
| `CertHubCertExpiry7dNoRenewal` | <7 d, no renewal in flight — **whatever the cause** | **Sev2** | Opsgenie |
| `CertHubCAUnhealthy` | step-ca health failing 5 m, or canary failed ×2 consecutive | Sev2 (Sev1 if ≥2 teams blocked — human call per profile) | Opsgenie |
| `CertHubIssuanceFailures` | Issuance error rate >20% over 15 m | Sev2 | Opsgenie |
| `CertHubPortalDown` | Probe failing 5 m | Sev3 (issuance unaffected) | `#platform-alerts` |
| `CertHubScannerStale` | Any scanner >24 h since success | Sev3 | `#platform-alerts` |
| `CertHubBackupFailed` | CNPG base backup >26 h old, or Velero backup Failed/Partial | Sev3 | `#platform-alerts` |
| `CertHubKMSErrors` | KMS error rate non-zero 10 m | Sev2 | Opsgenie |
| `CertHubIntermediateExpiry180d` | I1 certificate <180 d | Sev3, never auto-resolves | `#platform-alerts` + standing JSM ticket (SOP-2 ceremony lead time) |

## 3. Test-alert evidence (SAC: observed end to end)

| Date | What | Result |
|---|---|---|
| 2026-11-11 | Forced near-expiry: injected a canary cert with 6-day lifetime and `auto_renew="false"` into inventory → `CertHubCertExpiry7dNoRenewal` fired → Alertmanager → **Opsgenie alert #48213** → paged the on-call phone → acknowledged by on-call (M. Webb) in 4 min → resolved by removing the canary; alert auto-closed. | **PASSED** — full path, screenshots + Opsgenie timeline attached to this page (child: *Test alert 2026-11-11*) |
| 2026-11-11 | Sev3 path: silenced scanner cron for 25 h in dev → `CertHubScannerStale` in `#platform-alerts` with runbook link resolving correctly. | PASSED |
| 2026-08-27 | (PoC rehearsal of the same path, dev — recorded for completeness) | PASSED |

## 4. Incident profile — as registered (IM-02)

*Severities mapped to Fernbrook's IM-02 scheme; the runbook (§4) carries the canonical copy operators use. Registration, mechanically, meant: (a) the trigger table below added to the JSM **CertHub** service entry so tier 1 classifies against it; (b) Rafi's triage guide published and linked from the request types; (c) the profile appended to IM-02's per-service annex; (d) Owen's sign-off recorded here. No standing form for this existed — this section is the registration record.*

| IM-02 Sev | CertHub triggers | Notes |
|---|---|---|
| **Sev1** — down/unusable for 2+ teams, or data-loss risk | Issuance API down with ≥2 teams' pipelines blocked; suspected compromise of any CA key | Key compromise invokes runbook §5.6 + IM-02 major-incident comms path immediately |
| **Sev2** — down/degraded for one team, no workaround | Issuance failing for one team, no workaround; **any inventoried cert <7 days from expiry with no renewal in flight** | The second trigger is deliberate: an impending expiry is an incident *before* it takes anything down — codifying the INC-4211 lesson |
| **Sev3** — degraded, workaround exists | Portal degraded (API workable); scanner stale >24 h; backup failure | |
| **Sev4** — minor/cosmetic | Dashboard/UI defects | |

**Reportable bar: Sev1–2** (SAC baseline). Response targets per baseline: Sev1 15 min (24×7 via rota — Tier 1), Sev2 4 working hours, Sev3 next business day.

| Registration sign-off | |
|---|---|
| Registered by | Priya Chandra, 2026-11-17 |
| Accepted for the incident process | Owen Gallagher (service delivery — IM-02 owner for Platform), 2026-11-17 |
| Tier-1 briefing | Rafi Osman — triage guide walk-through 2026-10-21; refreshed at the 2026-11-17 review |

## 5. Known monitoring gaps (honest list)

- 4 discovered certs remain **unowned** (of 31 unknown at first scan): alerts route to `#platform-alerts` with no owning team until the ownership drive closes (target 2026-12-04, Marcus — FRM-03 §2). On-call adopts any that go sub-14-day meanwhile (runbook §5.2 step 2c).
- Availability history is 5 weeks deep (go-live 2026-10-16). SLO compliance so far: Oct 99.9% (partial), Nov-to-date 100%; first full clean month completes 2026-11-30.
- Six pre-migration teams' legacy renewal automation is invisible to us *except* through the discovered-cert expiry metrics — which is precisely the safety net, but false confidence before 2026-12-18 would be misplaced.
