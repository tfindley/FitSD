# Platform & Infrastructure — FitSD Adoption Pack

**Fernbrook Software — internal.** Confluence space: `PLAT` → Governance.

| | |
|---|---|
| **Status** | Ratified |
| **Date of stand-up workshop** | 2026-06-05 (half day, Meeting Room 2) |
| **Present** | Marcus Webb (Platform team manager — Management System Owner), Dana Okafor (CTO — ratifies). Consulted during the afternoon: Owen Gallagher (service delivery — support model rows), Elena Vasquez (architecture/security rows), Priya Chandra (engineer view). |
| **Framework adopted** | FitSD v0.3 (CC BY 4.0, T. Findley) — Solution Development process and forms adopted as-is; other capabilities mapped to existing Fernbrook policy (§5) |
| **Document owner** | Marcus Webb |
| **Approver** | Dana Okafor |
| **Review cycle** | Annually at the June management-system review (§7), or on material change |

This page records the seven stand-up decisions from *FitSD — Implementation Guide*, in order. It is the top of our document register (§6) and the home of our ratified SAC baseline (§4).

---

## 1. Scope (FSD-GV-1)

> **All shared services run by the Platform & Infrastructure team for Fernbrook's product teams — currently CI/CD, the Kubernetes clusters, observability, DNS, and the artefact registry — plus any net-new shared service we take on. Out of scope: product-team application code, corporate IT (laptops, email, HR systems), and anything a product team runs for itself.**

## 2. Owners and Approver (FSD-GV-2, FSD-GV-6, FSD-SD-6)

| Role (FitSD) | Who | Notes |
|---|---|---|
| **Management System Owner** | Marcus Webb | Owns this pack, the document set and the review cycle |
| **Service Owner** | One named engineer per live service — recorded in the Platform Service Register (§6). Assignment completed 2026-06-12; Priya Chandra owns CI/CD and observability. | Accountability is per service and is not shared |
| **Approver** | Marcus Webb (default); Dana Okafor above the risk line (below) | Single accountable approver per gate/acceptance |
| **Operator** | Platform engineers; Rafi Osman (service desk, tier 1/2 front line) | |
| **Consulted SME** | Elena Vasquez (architecture, security); Owen Gallagher (service delivery, support model) | |

**Who approves what, by risk.** FitSD asks that the Approver acts "at a level appropriate to the risk" but leaves the levels to us, so we set the line as follows:

- **Marcus Webb** approves Gate 1, Gate 2 and Service Acceptance for work within the Platform budget and affecting Platform-run services only.
- **Dana Okafor** approves **Gate 2 in all cases** (Gate 2 commits real build effort and spend), and any gate or acceptance where **annual spend exceeds £10k**, a **new data classification** is handled, or the change has **company-wide user impact**.
- **Builder rule** (per the Implementation Guide, "one line uncrossed"): whoever built a solution is never its sole acceptance approver. Where Marcus is the Solution Owner or has done the build, Service Acceptance approval passes to **Dana**, informed by Owen as the operator-side reviewer.

## 3. The four forms and the net-new line (FSD-SD-1…4)

The four FitSD forms are adopted **unmodified** as Confluence templates in the `PLAT` space (template gallery → "Front door"), each raised from a Jira intake ticket (§6):

- **FSD-FRM-00 — Idea Brief** (optional one-pager, pre-Gate 1)
- **FSD-FRM-01 — Gate 1 Outline Proposal**
- **FSD-FRM-02 — Gate 2 Solution Design**
- **FSD-FRM-03 — Service Acceptance Record**

**Net-new effort line: 5 person-days.** FitSD suggests ~10 as a default; we have halved it because on a 5-person team a person-week is already a material commitment, and our consumers are eight product teams — anything that big deserves a Gate 1 conversation. The other FSD-PRO §1 triggers (new service, new infrastructure, new ongoing burden, and **any** new technology or third-party dependency regardless of size) apply as written.

## 4. Ratified SAC baseline (FSD-GV-7)

Our standing Service Acceptance thresholds. Every solution is designed to this bar at Gate 2 and proven against it at Service Acceptance (FSD-FRM-03). Where a row cites an existing Fernbrook policy, that policy is the source of truth and this row inherits it.

**Service tiers** (used by several rows): **Tier 1** — shared services product teams depend on to ship or run (CI/CD, Kubernetes, DNS, artefact registry, observability). **Tier 2** — internal conveniences and tools used mainly by the Platform team itself.

| Criterion | Fernbrook Platform standard (set once, ratified) | Owner |
|---|---|---|
| **Documentation** | Mandatory set per service: HLD, runbook (including the incident profile), recovery procedure, SOPs for routine operations, and a user/how-to page for product teams. All live in Confluence `PLAT` → Service Docs, linked from the service's register entry. No document, no acceptance. | Marcus Webb |
| **Backup (tested)** | All service-held state backed up nightly (Velero → S3, separate AWS account, separate region). Retention: 35 nightly + 12 monthly. A **dated test restore** at acceptance, then every **6 months** (Tier 1) / **annually** (Tier 2), logged in the Restore Test Log with evidence. | Service Owner (per service); log owned by Marcus Webb |
| **Security** | Hardened to **Fernbrook Information Security Baseline SEC-01** (CIS-aligned). Patch timescales per **SEC-04**: critical 7 calendar days (72 h if internet-facing or actively exploited), high 30 days, medium 90 days, low at next maintenance window. Acceptance bar: image/dependency scan in pipeline, **no known critical vulnerabilities outstanding**. Departures only as SEC-01 exceptions: time-bound (≤ 90 days) with a named compensating control. | Elena Vasquez |
| **Access** | SSO via Okta; access granted to **role groups**, never individuals; least privilege. Admin access restricted to the Platform team; break-glass credentials vaulted under dual control. JML: leaver access revoked within 1 working day (same day for privileged). Reviews: privileged **quarterly**, standard **6-monthly** (per SEC-02). | Marcus Webb |
| **Availability** | Tier 1: **99.5% monthly**, measured 24×7. Tier 2: **99.0%**, measured business hours. DR position: rebuild from code + restore from backup; Tier 1 RTO 4 working hours / RPO 24 h; Tier 2 RTO next business day / RPO 24 h. No active-active expectation at our size. | Marcus Webb |
| **Monitoring & alerting** | Every service exports health and golden signals to Prometheus/Grafana; expiry-style dates (certificates, licences, domains) always monitored. Alert routing: Sev1/2 → Opsgenie Platform rota; Sev3/4 → `#platform-alerts`. At acceptance a **test alert must be observed end to end**. | Service Owner (per service) |
| **Incident profile** | Severity scheme per **IM-02**: Sev1 — service down/unusable for 2+ product teams, or data-loss risk; Sev2 — down or degraded for one team, no workaround; Sev3 — degraded, workaround exists; Sev4 — minor/cosmetic. **Reportable bar: Sev1–2.** Each service defines its own triggers mapped to these severities in its runbook and registers them with the service desk at acceptance. | Owen Gallagher |
| **Supportability / handover** | Support model: service desk (Jira Service Management) 09:00–17:30 UK, Mon–Fri; Rafi Osman tier 1/2; Opsgenie on-call rota for Sev1 on Tier 1 services out of hours. Response: Sev1 15 min, Sev2 4 working hours, Sev3 next business day. **Continuity rule: every live service has a named primary and deputy, and the deputy has completed a dated runbook walk-through before acceptance.** A leaver triggers reassignment within 10 working days. Any new/changed standing procedure the service forces (Gate 2 §4) is written into the SOP set before acceptance. | Owen Gallagher |
| **Cost / licensing** | All licences and paid dependencies procured via **FIN-03** before go-live and recorded in the Supplier & Dependency Register with renewal date and owner. Run-cost lands on the Platform cost centre, owned by Marcus Webb, reviewed at annual budget. No personal accounts; no free tier goes load-bearing without a register entry. | Marcus Webb |

**Applicability rules** (a criterion is only ever N/A against one of these, recorded on FRM-03 with the reason):

1. **Backup (tested)** — N/A where a service holds no state of its own and its full configuration is in Git (the repository's backup regime then stands as the evidence).
2. **Availability** — services consumed only by the Platform team itself default to Tier 2 unless the Approver rules otherwise.
3. **Cost / licensing** — for pure OSS with no commercial agreement, "licences in place" is evidenced by the licence type recorded in the Supplier & Dependency Register; the register entry itself is never waived.

**Ratification**

| Field | Entry |
|---|---|
| **Ratified by** | Dana Okafor, CTO (proposed by Marcus Webb, Management System Owner) |
| **Date** | 2026-06-05 |
| **Review cadence** | Annually at the June management-system review (§7), or on material change to policy, regulation or the service portfolio |

## 5. Implementation profile (FSD-CH / RR / SA / SC pointed at what we already run)

| Capability | Requirements | Satisfied by | Owner |
|---|---|---|---|
| **Govern** | FSD-GV-1…7 | This pack (§1, §2, §7); the PLAT document register (§6); the ratified SAC baseline (§4) | Marcus Webb |
| **Solution Development** | FSD-SD-1…6 | FitSD FSD-PRO v0.3 + forms FRM-00…03, adopted unmodified; Jira `PLAT` intake (§6) | Marcus Webb |
| **Change & Release** | FSD-CH-1…4 | **Fernbrook Change Standard CH-01**: weekly CAB (Wed 10:00), pre-approved standard changes, GitOps pipeline for cluster/config changes; change records in Jira `CHANGE` | Marcus Webb |
| **Run & Restore** | FSD-RR-1…7 | **Fernbrook Incident Management Policy IM-02** (Sev1–4, Opsgenie rota, major-incident comms path); Prometheus/Grafana/Alertmanager stack; **Patch & Vulnerability Standard SEC-04**; end-of-life decisions recorded in the service register (new habit from FitSD) | Owen Gallagher (IM-02); Marcus Webb (RR-4/5/7) |
| **Secure & Assure** | FSD-SA-1…5 | **Fernbrook Information Security Baseline SEC-01** (CIS-aligned, incl. exceptions log); **Access Control Standard SEC-02** (Okta SSO, JML, access reviews); **Backup Standard SEC-03** (Velero/S3 scheme); Platform risk register (§6) | Elena Vasquez (SEC-01); Marcus Webb (risk register) |
| **Supplier & Supply Chain** *(applies — we run on AWS, GitHub, Okta, Atlassian, Grafana Cloud and sundry OSS)* | FSD-SC-1…4 | **Procurement & Vendor Assessment Checklist FIN-03** at intake (via Gate 1 §6 vendor due diligence); Supplier & Dependency Register (§6) reviewed at the June review | Owen Gallagher |

Gaps noted at the workshop: IM-02 predates per-service incident profiles (FSD-RR-6) — closed by §4's incident-profile row; nothing at Fernbrook previously required a *tested* restore (FSD-SA-3) — closed by §4's backup row; no end-of-life discipline existed (FSD-RR-7) — the service register gains a renew/replace/retire column.

## 6. Registers (FSD-GV-4)

Named homes, per *FitSD — Information Stores*. Tools: Confluence (`PLAT` space) + Jira.

| Store | Home | Owner |
|---|---|---|
| Demand / pipeline register | Jira project `PLAT`, "Front door" board (Idea → Gate 1 → PoC → Gate 2 → Delivery → Acceptance; Parked / Rejected kept, with reasons) | Marcus Webb |
| Gate & acceptance records | Confluence `PLAT` → Solution Development, one page per record (from the §3 templates), linked from the Jira ticket | Solution Owner per item |
| Service register / catalogue | Confluence: **Platform Service Register** (service, owner, deputy, tier, status incl. retired, EOL decision) | Marcus Webb |
| SAC baseline (standing) | §4 of this page | Marcus Webb |
| Document register | Confluence: **PLAT Governing Documents** (owner, approver, review date per doc; this pack is row 1) | Marcus Webb |
| Risk register | Confluence: **Platform Risk Register** (risk, owner, treat/accept, review date) | Marcus Webb |
| Supplier / dependency register | Confluence: **Supplier & Dependency Register** (supplier/dependency, owner, agreement, renewal, support horizon, exit note) | Owen Gallagher |
| Exceptions register | SEC-01 exceptions log (existing, company-wide); Platform entries tagged `platform` | Elena Vasquez |
| Change records | Jira `CHANGE` per CH-01 | Marcus Webb |
| Incident records + per-service profiles | Jira Service Management per IM-02; profiles live in each runbook and are registered with the service desk | Owen Gallagher |
| Problem records | Jira `PROB` per IM-02 | Owen Gallagher |
| Backup & restore-test records | Confluence: **Restore Test Log** (dated tests, evidence links to S3) | Marcus Webb |
| RAIDD log | Section of each Gate 2 record, maintained through delivery | Solution Owner per item |
| Retirement records | Retirement page per retired service, linked from the service register | Marcus Webb |

Stood up by 2026-06-12; existing services back-filled into the service and supplier registers by 2026-06-30 (action: Priya, Marcus).

## 7. Review cadence (FSD-GV-5)

- **Annually, each June**, folded into the Platform team's existing Q2 planning day (next: June 2027): review the management system, the implementation profile mappings, and the registers; **re-ratify the SAC baseline** (Dana). Minutes filed under Governance.
- **Monthly**, at the existing ops review: the front-door pipeline (what's parked, what's stuck at a gate) and anything the registers have flagged (renewals, restore tests due, access reviews).
- **On material change** — reorganisation, new regulation, a major incident that implicates the baseline — the affected part is reviewed out of cycle.

---

*Adopted 2026-06-05. First solution through the front door will be whatever next trips a §3 trigger.*
