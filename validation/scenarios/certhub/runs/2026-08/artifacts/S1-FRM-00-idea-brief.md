# FSD-FRM-00 — Idea Brief: CertHub

**Fernbrook Software — internal.** Confluence `PLAT` → Solution Development. Raised from intake ticket **PLAT-341** (front-door board: Idea). Template: FSD-FRM-00 (FitSD v0.3, adopted unmodified per Adoption Pack §3).

## Header

| Field | Entry |
| --- | --- |
| **Working title** | CertHub — centralised certificate management |
| **Raised by** | Priya Chandra, Platform & Infrastructure (team member). Volunteered at the post-incident review for INC-4211. |
| **Date** | 2026-08-10 |
| **Demand source / primary driver** | Operational / risk reduction. Top action from the PIR for INC-4211 (checkout API TLS certificate expiry, Sat 18 Jul 2026, 02:10–06:14): *"centralise and automate certificate management."* Escalated to the CTO by an enterprise customer. |

## 1. The brief

| Field | Entry |
| --- | --- |
| **Problem / gap** | Certificate handling at Fernbrook is fragmented and unowned. Some product teams automate renewals per-team, others buy annual certs and track expiry in a spreadsheet; two wildcard certs (`*.internal.fernbrook.io`, `*.fernbrook-analytics.com`) are still "owned" by people who left in 2025. There is no company-wide inventory, no expiry monitoring, and no single place a team can go for a cert. Result: a 4-hour revenue-impacting outage on checkout, and near-certain repeats — the orphaned `*.fernbrook-analytics.com` wildcard expires 2026-11-30. |
| **Outcome sought** | Every certificate in the Fernbrook estate is known, owned, and either renewed automatically or alerted on well before expiry. Any product team can obtain a certificate for its services through self-service, without ticket ping-pong or tribal knowledge. An expiry-caused outage becomes something that cannot happen silently. (Outcome only — how we get there is for Gate 1/Gate 2.) |
| **Roughly in scope** | Public TLS certificates for Fernbrook-run services; internal service-to-service certificates; an estate-wide certificate inventory with expiry monitoring and alerting (including certs the new service did not issue); self-service access for the eight product teams; adoption/migration of the orphaned wildcards. |
| **Roughly out of scope** | Corporate IT certificates (email, VPN, device certs — corporate IT is outside the Platform FitSD scope, Adoption Pack §1); code signing; certificates customers manage on their own domains; general secrets management (certificates only). |

## 2. Service-quality expectations

| Field | Entry |
| --- | --- |
| **Applies the standing SAC baseline?** | Yes — Adoption Pack §4, per *FitSD — Service Acceptance Criteria*. |
| **Any project-specific emphasis** | **Availability**: product teams' deploy pipelines would depend on issuance — this reads as Tier 1 under the baseline's tier definitions (note: an outage blocks *new* issuance/renewal, not already-issued certs, so the failure mode is graceful). **Continuity**: this proposal exists because cert knowledge lived in individuals' heads; the service must not recreate that risk around whoever builds it. **Security/access**: the service would hold private key material — flagging for the Approver whether that trips the "new data classification" routing line in Adoption Pack §2. Also noting the baseline's monitoring row *already* mandates monitoring of expiry-style dates estate-wide; this service is largely how we would meet that row. |

## 3. Next step

| Field | Entry |
| --- | --- |
| **Recommendation** | Take to Gate 1 |
| **Note** | PIR top action with CTO visibility; trips every FSD-PRO §1 intake trigger; the case only grows as teams keep self-solving divergently. |
