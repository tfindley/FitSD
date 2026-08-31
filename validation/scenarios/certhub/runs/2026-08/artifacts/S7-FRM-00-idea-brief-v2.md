# FSD-FRM-00 — Idea Brief: CertHub 2.0 — CA backend succession

**Fernbrook Software — internal.** Confluence `PLAT` → Solution Development. Raised from intake ticket **PLAT-512** (front-door board: Idea). Template: FSD-FRM-00 (FitSD v0.3, adopted unmodified per Adoption Pack §3).

## Header

| Field | Entry |
| --- | --- |
| **Working title** | CertHub 2.0 — CA backend succession (plus accumulated demand: SSH certificates, second region) |
| **Raised by** | Jordan Blake, Platform & Infrastructure — Service Owner, CertHub (ownership transferred from Priya Chandra, w/c 2027-08-09) |
| **Date** | 2027-08-16 |
| **Demand source / primary driver** | Risk reduction / supplier end-of-life. smallstep announced (2027-08-11) that the open-source `step-ca` edition stops receiving security patches in 12 months. FSD-RR-7 review held 2027-08-16 (takeover assessment §7): decision **replace** recorded, renew retained as a Gate 1 option, retire rejected; risk **RSK-043** raised (RSK-031 crystallised). Secondary driver: accumulated customer demand — three product teams pressing for SSH certificate support; second-region deployment requested (see confidence note below). |

## 1. The brief

| Field | Entry |
| --- | --- |
| **Problem / gap** | CertHub's internal CA backend (`step-ca` OSS, the trust anchor for all service-to-service TLS across eight teams, ~340 orders/day) loses security patching in **2028-08**. An unpatched CA is not a tolerable posture under SEC-04 for any Tier 1 service, least of all this one — so the dependency must be succeeded, on our schedule or the vendor's. Separately, demand has outgrown the 2026 scope: teams want SSH certificate issuance (first surfaced Nov 2026, Sam Reyes's product-ownership memo; three teams now pressing) and a second-region deployment has been requested. Handling succession and accumulated demand as one deliberate decision avoids bolting features onto a backend we are about to change. |
| **Outcome sought** | Internal certificate issuance continues on a security-patched, supported CA backend with **no consumer-visible change** — the exit path designed in 2026 (Gate 1 §6a; HLD DEC2: standard X.509 + ACME throughout, so the CA is swappable without teams touching their `ClusterIssuer` configs) is honoured, and the swap is sequenced with the I1 intermediate re-sign already due 2028-09 so the estate rolls once, not twice. A deliberate decision — not necessarily a build — is made on SSH certificate support and on second-region deployment, evidenced against actual demand and the actual availability need. All complete with margin before the 2028-08 patch cliff. (Outcome only — the backend choice and any scope split are for Gate 1/Gate 2.) |
| **Roughly in scope** | Succession of the internal CA backend: renew (smallstep commercial edition, priced) vs replace (candidates re-evaluated as at 2027 — Vault PKI, OpenBao, other ACME-capable backends; the 2026 PoC scorecard is a year stale and the challengers have moved). Migration/reissue mechanics under the existing ACME surface and KMS-held intermediate; sequencing with the 2028-09 I1 re-sign ceremony. Evaluation of SSH certificate issuance as a new platform capability. Evaluation of second-region deployment against a stated availability requirement. Continuity of the estate-wide inventory and monitoring throughout. |
| **Roughly out of scope** | The portal, inventory and scanner (backend-agnostic by design — DEC4/DEC6 — and not forced by this EOL; portal maintainability is being handled as a takeover risk, RSK-044, not smuggled in here). The public-cert path (Let's Encrypt, Sectigo — unaffected by this EOL). General secrets management, code signing, certs on customer-managed domains (unchanged since Gate 1 2026 — they re-enter only as their own demand). |

## 2. Service-quality expectations

| Field | Entry |
| --- | --- |
| **Applies the standing SAC baseline?** | Yes — Adoption Pack §4, per *FitSD — Service Acceptance Criteria*. |
| **Any project-specific emphasis** | **Continuity** — this brief exists because a supplier exit became real, and it is written by a successor who inherited the service with no handover; the succession must be executed without re-concentrating knowledge in one head (the service currently has no deputy — being remedied under the takeover plan, RSK-041 — and the delivery plan must not assume one person). **Security** — any backend change re-opens the trust-chain and key-handling design (offline root, KMS intermediate — DEC3); Elena Vasquez should be consulted from Gate 1, not Gate 2. **Availability** — the second-region ask must be tested against the graceful-degradation property: an outage blocks new issuance only, and the proven RTO (2 h 50 m) sits inside every renewal window, so a second region may be answering a question nobody has actually asked; Gate 1 should demand the requirement in writing before any option is costed. |

## 3. Next step

| Field | Entry |
| --- | --- |
| **Recommendation** | Take to Gate 1 |
| **Note** | Hard external fuse: patches end 2028-08. Recommend Gate 1 by end September 2027 and a refreshed PoC (likely needed — the 2026 scorecard is stale) inside October, so Gate 2 can land with nine-plus months of runway; past ~2028-02 the case decays from "choose a successor" into "take whatever renewal terms the vendor offers". Gate 1 should also decide the scope question this form cannot: whether SSH certs and the second region ride this case or split into their own. |

---

## Confidence note (local addition — JB)

*The template has no field for this, but the Approver should know which entries stand on
records and which on hedges, given the author inherited this service nine weeks after
its builder left.*

**Filled confidently from the records:** the problem, the fuse and the interim safety
position (vendor announcement + SEC-04 + supplier entry SUP-041); the exit-path mechanics
and why succession is cheap (Gate 1 §6a, DEC2 — the strongest-evidenced claim in this
brief); the scope boundaries (carried from the 2026 Gate 1/HLD, unchanged); the
sequencing with the 2028-09 ceremony (SOP-2, recovery procedure §3.3); the SAC baseline
application and the availability/graceful-degradation facts (HLD §2/§7, RTL-2026-014).

**Hedged, and why:** **SSH-cert demand** — "three teams pressing" is real but reaches me
as pressure, not records; the only paper is Sam's Nov 2026 memo, and I cannot confirm the
enhancement backlog his terms proposed was ever stood up (FRM-03 §2 row 10 state unknown
to me). Gate 1 should demand the demand in writing. **Second region** — I have not found
who is asking or what requirement (latency? DR? a customer's auditors?) sits behind it;
hence the §2 challenge rather than a scope commitment. **Renew arm viability** — that
smallstep's commercial edition keeps patches flowing is an assumption from the
announcement's wording; verify with the vendor before the Gate 1 options table is
scored. **Current operational baseline** — migration state and unowned-cert count are
asserted from the last records I hold (Feb 2027); the takeover assessment (§4) is
chasing current truth, and Gate 1 should use whatever it finds.
