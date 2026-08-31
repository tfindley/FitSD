# FSD-FRM-01 — Gate 1 Outline Proposal: CertHub

**Fernbrook Software — internal.** Confluence `PLAT` → Solution Development. Intake ticket **PLAT-341** (front-door board: Gate 1). Template: FSD-FRM-01 (FitSD v0.3, adopted unmodified per Adoption Pack §3).

## Header

| Field | Entry |
| --- | --- |
| **Solution title** | CertHub — certificate management service |
| **Status** | Approved — proceed via PoC first (see §8) |
| **Solution Owner** | Priya Chandra (self-nominated at intake; for confirmation at sign-off) |
| **Contributors** | Owen Gallagher (support model, supplier register); Elena Vasquez (sanity check on candidate architectures and key-handling); Rafi Osman (current cert-related ticket volume) |
| **Linked Idea Brief (FSD-FRM-00)** | S1-FRM-00 (this space), raised 2026-08-10 from PLAT-341 |
| **Date** | 2026-08-17 |

## 1. Idea

*Carried forward from the Idea Brief, firmed up.*

| Field | Entry |
| --- | --- |
| **Overview** | An internal self-service certificate service: issues and auto-renews public TLS certs, runs an internal CA for service-to-service certs, and keeps an estate-wide certificate inventory with expiry monitoring and alerting. |
| **Customer** | All eight product teams (deploy pipelines and services) and the Platform team itself. Indirectly, Fernbrook's external customers — the trigger incident was on the revenue-bearing checkout API. |
| **Requirement / outcome** | Close the gap the INC-4211 PIR named: certificates today are issued eight different ways, tracked nowhere, and partly owned by leavers. Outcome: every cert known and owned; renewal automatic or alerted well before expiry; teams self-serve. This is the **start of a service that must scale** — Tier 1 under the SAC baseline (product teams depend on it to ship), not a one-off fix. |
| **Benefits** | No repeat of expiry-caused outages (INC-4211: 4 hours, enterprise escalation to the CTO). Removes renewal toil and spreadsheet-tracking across eight teams (est. 2–4 engineer-days/month, plus Rafi's cert-related tickets, ~5–8/month). Adopts the two orphaned wildcards before they expire. Gives service-to-service TLS a sanctioned path instead of per-team improvisation. Meets the SAC baseline monitoring row ("expiry-style dates always monitored") estate-wide. |

## 2. Value and driver

**Primary driver: Risk reduction.** The case rests on §4 and the cited records: PIR for **INC-4211** (top action: "centralise and automate certificate management") and Platform Risk Register entry **RSK-021** ("certificate expiry causes customer-facing outage; cert ownership lost on leaver departure" — raised 2026-08-17 with this submission, as no standing entry existed). Lenses scored below for prioritisation only.

| Lens | Score (1–3) | Evidence / note |
| --- | --- | --- |
| **Growth** | 1 | No direct new revenue. Marginal: removes a repeat-outage risk that nearly cost an enterprise account. |
| **Retention** | 3 | Protects the revenue-bearing services customers rely on — the trigger incident *was* a customer-facing checkout outage with an enterprise escalation. |
| **Efficiency** | 2 | Est. 2–4 engineer-days/month of renewal toil and tracking across teams; ~5–8 service-desk tickets/month; each new service standup stops reinventing cert issuance. |
| **Risk & compliance** | 3 | Closes the PIR top action and RSK-021. Ends leaver-owned certs (an SEC-02 access-hygiene breach in effect) and unmonitored expiries. |

## 3. Effort (T-shirt estimate)

*Sizes noted with rough £/day anchors because Fernbrook's approval routing (Adoption Pack §2) turns on a £10k annual-spend line — desktop estimates only, firmed at Gate 2.*

| Category | Size (S/M/L) | Note |
| --- | --- | --- |
| **People** | M | Est. 15–25 person-days end to end for the preferred option — build *and* the rest: migration of orphaned wildcards, monitoring, docs set, SOPs, deputy walk-through, acceptance evidence. Well over our 5-day net-new line (hence this gate). |
| **CAPEX** | S | No hardware; runs on the existing Kubernetes clusters. One-off setup effort is in the people row. |
| **OPEX** | S | Preferred option: OSS, £0 licence; paid public-CA account for OV/EV needs est. £1–3k/yr (FIN-03 at Gate 2). Ongoing ops land on the Platform rota. *Note: the buy option (Option 4) is M–L, est. £10–25k/yr — it crosses the £10k line and would route to the CTO.* |

## 4. Impact and timing

| Field | Entry |
| --- | --- |
| **Impact of doing nothing** | A repeat of INC-4211 is close to certain: renewals stay manual in at least three teams, and the orphaned `*.fernbrook-analytics.com` wildcard **expires 2026-11-30** with no owner to renew it. Each recurrence ≈ 4 hours of customer-facing outage plus escalation. Meanwhile teams keep building divergent per-team automation — exactly the sprawl the front door exists to stop — making any later central service a harder migration. |
| **Why now?** | The PIR action is open with CTO visibility; the orphaned wildcard gives a hard deadline (2026-11-30); and two product teams have told us they're about to build their own renewal automation this quarter — we can do it once, centrally, or migrate them off home-builds later. |
| **When does this expire?** | Revisit by **2026-10-31**. Past that we cannot deliver ahead of the wildcard expiry (it gets a manual renewal as a stopgap) and teams will have self-solved; the case decays from "build once" into "migrate eight". |

## 5. Delivery options

| Option | Pros | Cons | Dependencies | Preferred? |
| --- | --- | --- | --- | --- |
| **#1 Build on smallstep `step-ca`** (internal CA + ACME) with public certs via Let's Encrypt/paid CA, inventory + expiry alerting on the existing Prometheus/Grafana stack, thin self-service portal/API | Purpose-built CA, light to run, ACME-native so one issuance protocol inside and out; fits our k8s estate; Apache-2.0, £0 licence | New tech to the team; smaller community than Vault; portal/API is custom build we then own; vendor (smallstep inc.) commercial health needs a look (§6) | Let's Encrypt + a paid CA account; DNS (DNS-01 challenges); k8s; Prometheus/Grafana/Opsgenie | **Yes — subject to PoC (§7)** |
| **#2 HashiCorp Vault, PKI engine** (+ same public-cert path) | Very mature, large community, strong docs; could later serve secrets management generally | Heaviest ops burden of the options (HA, unseal, upgrades) for a team of 5; licence position needs legal review (BUSL community edition, IBM-owned; OpenBao fork immature); running Vault *only* for PKI is a big hammer, and "we'll use it for secrets too" is scope creep this gate hasn't asked for | Vault licence decision; Let's Encrypt + paid CA account; DNS; k8s | No — carried into the PoC as the challenger |
| **#3 Federate: publish a cert standard + shared tooling, each team runs its own automation** | No new central service to run; cheapest for Platform; teams keep autonomy | Doesn't produce an estate-wide inventory or catch the orphans (the actual failure mode of INC-4211); relies on eight teams each doing it right forever; ownership stays fragmented — treats the symptom, not the PIR action | Eight teams' cooperation and ongoing discipline | No |
| **#4 Buy a commercial certificate-lifecycle SaaS** (shortlist via FIN-03 if chosen) | Fastest to inventory/scanning value; vendor support; discovery of unknown certs typically built in | Est. £10–25k/yr (crosses the £10k approval line); private-key/inventory data with a third party (SEC-01 assessment); internal service-to-service CA support varies by product; integration into eight pipelines is still our work; exit is hardest of the options | Vendor selection (FIN-03); budget owner; SEC-01 data assessment | No — revisit if the PoC fails both build candidates |

## 6. New technology / vendor

*Due diligence per FSD-SC-2. The form's table assumes a single adoption; the preferred option brings in **three** new dependencies, so the table is repeated per dependency (deviation noted in findings). All would land in the Supplier & Dependency Register at acceptance.*

**6a. smallstep `step-ca` (internal CA software)**

| Field | Entry |
| --- | --- |
| **New tech / tool?** | Yes — open-source certificate authority + ACME server, self-hosted on our k8s. |
| **Vendor & licensing** | Apache 2.0 OSS; no commercial agreement needed. Behind it sits smallstep inc. (VC-backed) — no dealings to date; commercial health and pace of maintenance to be checked in the PoC scorecard. |
| **Upgrade path** | Regular releases; we'd pin versions and patch via the normal SEC-04 timescales through the GitOps pipeline. EOL horizon: none published — mitigated by exit path below. |
| **Support & ownership** | Community support only (paid support exists if ever needed). Owned by Platform; Service Owner + deputy per the SAC continuity rule. |
| **Exit / alternatives** | Standard X.509 + ACME throughout: consumers wouldn't change if we swapped the CA (reissue certs from a replacement — Vault PKI, OpenBao, or a SaaS). Alternatives considered: Options #2/#4. |

**6b. Let's Encrypt (public ACME CA — free tier becoming load-bearing, so recorded deliberately)**

| Field | Entry |
| --- | --- |
| **New tech / tool?** | Partially — already used ad hoc by some teams; this makes it a *deliberate, owned* dependency for most public certs. |
| **Vendor & licensing** | Operated by ISRG (non-profit); free; no contract or SLA — that's the trade we're making, recorded here rather than by accident. |
| **Upgrade path** | ACME is an IETF standard (RFC 8555); 90-day certs force the automation this proposal exists to build. |
| **Support & ownership** | No vendor support; rate limits and incidents are ours to design around. Owner: Platform (CertHub Service Owner). |
| **Exit / alternatives** | Any ACME-speaking CA (ZeroSSL, paid CAs) — a config change, not a rebuild. |

**6c. Paid public-CA account (for OV/EV and anything Let's Encrypt can't serve)**

| Field | Entry |
| --- | --- |
| **New tech / tool?** | Yes — one commercial CA account replacing today's scattered per-team purchases. |
| **Vendor & licensing** | Vendor selected at Gate 2 via FIN-03; est. £1–3k/yr consolidated (today's per-team spend is untracked — consolidation likely saves money). |
| **Upgrade path** | n/a (service, not software); renewal date owned via the Supplier & Dependency Register. |
| **Support & ownership** | Vendor support per contract; account owned by Platform, billing to the Platform cost centre (Marcus Webb, per SAC cost row). |
| **Exit / alternatives** | Certs are portable; switch CA at renewal. Multiple established vendors. |

## 7. Proof of Concept

| Field | Entry |
| --- | --- |
| **PoC needed?** | **Yes** — the step-ca vs Vault PKI choice is genuine, and neither has been proven against our real integration surfaces. |
| **Objective** | Settle the internal-CA choice and prove the end-to-end loop: (1) a pilot service on the dev cluster obtains and auto-renews an internal cert from each candidate CA; (2) a public cert is issued and renewed via ACME DNS-01 against our DNS service (Let's Encrypt staging); (3) a forced near-expiry fires an alert through Prometheus → Opsgenie. |
| **Success criteria** | Both loops run hands-off for the pilot service; the test alert is observed end to end; the two candidates are scored on a short card (ops burden, docs quality, k8s/pipeline fit incl. cert-manager compatibility, failure modes) with a clear recommendation for Gate 2. |
| **Method & cost** | Dev cluster + Let's Encrypt staging + OSS only; £0 spend. |
| **Resources & duration** | 1 engineer (Priya Chandra), **5 person-days, time-boxed**, within two calendar weeks of approval. |
| **Result / conclusion** | PoC ran 2026-08-24 to 2026-08-28, inside the 5-day box, £0 spend. Both candidates completed all three loops and the forced near-expiry alert was observed end to end (Prometheus → Opsgenie). **Recommendation: Option #1, step-ca.** It speaks ACME natively, so the *same* cert-manager ClusterIssuer pattern served internal and public certs alike — one integration for all eight pipelines, with DNS-01 working cleanly against a delegated `_acme-challenge` zone; Vault PKI needed its own issuer type plus per-namespace auth plumbing, and came back **sealed** after a pod restart, halting issuance until manually unsealed — a standing ops burden a 5-person team shouldn't carry for PKI alone. Legal read on Vault's BUSL licence (condition 5): workable but re-review at each version adoption — moot on this recommendation. Full scoring: *CertHub PoC scorecard* (step-ca 19/24, Vault 13/24), filed as a child page of this record and linked from PLAT-341 — no standard home exists for PoC evidence, so a child of the gate record is our local convention. — PC |

## 8. Sign-off

| Field | Entry |
| --- | --- |
| **Decision** | **Proceed via PoC first** (FSD-PRO §5). PoC exactly as scoped at §7; return with the completed scorecard for Gate 2. No design effort beyond the PoC until then. |
| **Approver** | Marcus Webb, Platform team manager — per Adoption Pack §2: Platform-run service, preferred option within Platform budget (est. £1–3k/yr OPEX, under the £10k line). On the key-material flag raised in the Idea Brief: ruled a Gate 2 matter — the PoC touches no production key material (dev cluster, Let's Encrypt staging only), and Gate 2 routes to Dana Okafor in all cases under Adoption Pack §2, so the data-classification question lands with the right approver at the right gate. |
| **Conditions / reason** | **Conditions:** (1) PoC is a hard time-box — 5 person-days within two calendar weeks of this date, £0 spend, dev cluster and Let's Encrypt staging only; if the box runs out, stop and present the scorecard as it stands. (2) Priya Chandra confirmed as Solution Owner. (3) Independent of this proposal, raise a CH-01 change now to take ownership of and manually renew `*.fernbrook-analytics.com` (and verify `*.internal.fernbrook.io`) well ahead of 2026-11-30 — an orphaned wildcard is a risk to contain today, not this project's delivery deadline. (4) I will ask the two product teams planning their own renewal automation to hold for the Gate 2 decision (target: end of September) and offer them pilot-consumer seats — MW to action. (5) For Gate 2: firm the 15–25 person-day estimate (the estate-wide inventory of certs CertHub did *not* issue looks light in Option 1's build); name the deputy up front per the SAC continuity row — this service does not get rebuilt around one head; complete the legal read on the Vault licence position before the scorecard recommends either candidate; Elena Vasquez to advise on key-material data classification in the design. **Reason:** the case is properly risk-driven and rests on cited records (INC-4211 PIR, RSK-021), the options are honest — federate fails the actual failure mode of the trigger incident, buy crosses the £10k line for value we can likely build — but the internal-CA choice is genuinely unproven against our stack. Feasibility before design. |
| **Date** | 2026-08-19 |
