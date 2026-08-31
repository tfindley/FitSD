---
title: FitSD — Requirements
framework: FitSD
document: Requirements
tier: 1
type: normative
version: 0.3
status: draft
owner: Tristan Findley
date: 2026-08-31
tags:
  - fitsd
  - framework
  - requirements
  - service-management
---

# FitSD — Requirements

> **TL;DR** — The testable "shall" statements you must meet to conform, grouped by capability. Each is a one-line outcome; the right-hand **Note** says what it means in practice. Meet them with your own documents and tools. FitSD ships a full process only for Solution Development.

> **Status: draft, founding layer.** This is Tier 1 of FitSD: the testable spine. Each requirement is a "shall" statement that an implementation must satisfy to conform, by whatever local documents and tools it chooses (see *Charter* §7). Requirements are grouped by capability. IDs are stable; wording will be refined.

## How to read this

Each requirement has an ID (`FSD-XX-n`), a statement, and where useful a short note on intent. Conformance is about the *requirement* being met and evidenced, not about adopting any particular template. Keep the set small: a requirement that does not change a decision does not belong here.

**Two routes to the *how*.** FitSD owns only the *requirements*: these thin, outcome-based "shall" statements. It deliberately does **not** build a process for every capability.

The *how* is satisfied one of two ways: (a) a **FitSD reference capability** (a Tier 2 process doc, shipped only for the flagship, Solution Development), or (b) a **reference to an existing process or standard** the team already runs (its own change- or incident-management policy, or ITIL / FitSM). Each capability names where its "how" lives. This is how FitSD can require change, incident, security and the rest **without rebuilding those disciplines**.

---

## FSD-GV — Govern

The management system itself.

**Reference (how satisfied):** met directly by your scope, document-control, roles and review practices. FitSD ships no separate process. Maps to FitSM GR1–GR9, ITIL SVS governance, ISO 27001 clauses 4–10.

| ID          | Requirement                                                                                                          | Note                                        |
| ----------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| **FSD-GV-1** | The scope of services under management **shall** be defined and recorded.                                            | What is in and out of the system.           |
| **FSD-GV-2** | Each service **shall** have a single named owner accountable for it.                                                 | Roles may be shared; accountability is not. |
| **FSD-GV-3** | Documents that govern services **shall** be version-controlled, each with an owner, an approver, and a review cycle. | Document control.                           |
| **FSD-GV-4** | A register of services, the demand pipeline, and key records **shall** be maintained and kept current, with completed and retired entries retained as the historical record.                                     | The system's index: the upcoming, in-flight and completed view. |
| **FSD-GV-5** | The management system **shall** be reviewed at a defined cadence and improved (Plan-Do-Check-Act).                   | Continual improvement.                      |
| **FSD-GV-6** | Roles **shall** be defined, including who may authorise what.                                                        | One person may hold several.                |
| **FSD-GV-7** | The organisation **shall** define and **ratify a standing Service Acceptance baseline** — its own thresholds for each Service Acceptance Criterion — and apply it to every solution's Service Acceptance. | The SAC categories are fixed (FSD-SD-5); the *thresholds* are the organisation's, set once and inherited by every solution rather than rediscovered each time. Defined in *reference/FitSD — Service Acceptance Criteria*; stood up via *FitSD — Implementation Guide*. |

## FSD-SD — Solution Development

The front door. How net-new work enters and reaches live service, and the control point for adopting new technology.

**Reference (how satisfied):** the one capability FitSD ships in full: `FSD-PRO` plus the Gate and Acceptance forms (Tier 2/4). This is the framework's flagship; everything else references out.

| ID          | Requirement                                                                                                                                                                                                           | Note                                             |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| **FSD-SD-1** | Net-new services **shall** enter through a defined intake before build effort is committed.                                                                                                                           | A scope test separates this from routine change, including adopting a **new technology, tool or third-party dependency** the team must own, support or secure, regardless of cost or effort. |
| **FSD-SD-2** | A new service **shall** pass a value/feasibility decision before design begins.                                                                                                                                       | Gate 1: "worth doing?"                          |
| **FSD-SD-3** | A new service **shall** pass a design-readiness decision before delivery, covering how it will be operated.                                                                                                           | Gate 2: "ready to build?"                       |
| **FSD-SD-4** | Every new or materially changed service **shall** meet a defined Service Acceptance / Definition of Done before entering live service, **evidenced** rather than asserted.                                            | Readiness baked in.                              |
| **FSD-SD-5** | Service Acceptance **shall**, as a minimum, cover: documentation; tested backup and recoverability; security; access control; availability; monitoring and alerting; service-level incident triggers; supportability, handover and continuity (operating knowledge captured, not reliant on a single person); and cost/licensing. | The Definition of Done: categories defined in *reference/FitSD — Service Acceptance Criteria*, proven at FSD-PRO §7. The set may grow as practice matures; thresholds are the organisation's standing baseline (FSD-GV-7), including any recorded applicability rules. Incident triggers also satisfy FSD-RR-6. |
| **FSD-SD-6** | Each gate and acceptance decision **shall** have a single accountable approver and be recorded.                                                                                                                       | Lightweight, single-approver by default.         |

## FSD-CH — Change & release

Changing live services safely.

**Reference (how satisfied):** FitSD states the requirements only and does **not** build a change-management process. Satisfy them with your existing change/CAB process or an external standard: ITIL 4 *Change enablement*, FitSM PR12.

| ID          | Requirement                                                                                    | Note                         |
| ----------- | ---------------------------------------------------------------------------------------------- | ---------------------------- |
| **FSD-CH-1** | Changes to live services **shall** be assessed for risk and impact before implementation.      |                              |
| **FSD-CH-2** | Changes **shall** be authorised by an authority appropriate to their risk.                     | Standard/normal/major tiers. |
| **FSD-CH-3** | Changes **shall** be recorded, and significant changes reviewed after implementation.          |                              |
| **FSD-CH-4** | Releases **shall** be deployed in a controlled, repeatable, and where feasible reversible way. |                              |

## FSD-RR — Run & restore

Keeping services healthy.

**Reference (how satisfied):** FitSD does **not** build incident or problem management; most organisations run a **central incident-management policy**. Satisfy via that policy (or ITIL *Incident / Problem / Monitoring and event*, FitSM PR9/PR10/PR4). FitSD's distinct contribution is twofold: require each *service* to plug into it (FSD-RR-6), and require services to be retired cleanly at end of life (FSD-RR-7).

| ID          | Requirement                                                                                                 | Note                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- | -------------------- |
| **FSD-RR-1** | Service-affecting events **shall** be detected, recorded, prioritised and resolved against defined targets. | Via the incident-management process. |
| **FSD-RR-2** | Major incidents **shall** have a defined escalation and communication path.                                 | Usually the central incident-management policy. |
| **FSD-RR-3** | Recurring or high-impact incidents **shall** be investigated for root cause.                                | Problem management.  |
| **FSD-RR-4** | Services **shall** be monitored against expected availability, and capacity managed ahead of need.          |                      |
| **FSD-RR-5** | Security patches **shall** be assessed and applied within risk-based timescales.                            |                      |
| **FSD-RR-6** | Each service **shall** declare a **service-level incident profile** — what constitutes an incident *for that service*, with triggers and severities — registered with the incident-management process. | The gap most orgs have: central policy defines "an incident" generically; the per-service triggers are rarely written down. Defined at Service Acceptance (SAC), consumed by the central process. |
| **FSD-RR-7** | When a service reaches end of life (EOL/EOS, obsolescence, or no longer needed), a decision **shall** be recorded — **renew, replace, or retire** — and, if retired, decommissioning **shall** be controlled: data handled, access revoked, SLAs withdrawn, documentation archived, the register updated, and operating knowledge captured (so another person could run or wind it down). | Closes the lifecycle. *Replace* routes back to Solution Development as new demand; *renew* keeps it running (contract/licence via FSD-SC); access and data disposal tie to FSD-SA. |

## FSD-SA — Secure & assure

Staying safe and compliant.

**Reference (how satisfied):** met by your information-security and risk practices. FitSD ships no separate process here. Maps to ISO 27001 Annex A, FitSM PR6, ITIL *Information security / Risk management*. (Supplier / supply-chain duties live next door in **FSD-SC**.)

| ID          | Requirement                                                                                                                  | Note                      |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| **FSD-SA-1** | Risks to services **shall** be identified, recorded in a register, and treated or formally accepted by an accountable owner. |                           |
| **FSD-SA-2** | Access **shall** follow least privilege, with joiners/movers/leavers handled and access reviewed periodically.               |                           |
| **FSD-SA-3** | Data **shall** be backed up to a defined scheme, and recoverability tested, not assumed.                                    | Ties to FSD-SD-5.          |
| **FSD-SA-4** | Departures from policy **shall** be handled as recorded, time-bound, compensated exceptions.                                 |                           |
| **FSD-SA-5** | Service management **shall** align to applicable legal and regulatory obligations, with evidence of control retained.        | e.g. NIS2-style measures. |

## FSD-SC — Supplier & supply chain

Who the services stand on. **Conditional:** these requirements apply where services rely on suppliers or third-party dependencies the team is accountable for: cloud, SaaS, support contracts, critical products. In practice that's most teams; one with genuinely none records that fact and moves on.

**Reference (how satisfied):** met by your procurement and supplier-management practice. FitSD ships no separate process. Maps to ISO 27001 A.5.19–A.5.22, FitSM PR8, NIS2 Article 21(2)(d). The intake-side control already exists: the FSD-SD-1 new-technology trigger and Gate 1's vendor due diligence (FSD-FRM-01 §6).

| ID          | Requirement                                                                                                                  | Note                      |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| **FSD-SC-1** | Suppliers and third-party dependencies that live services rely on **shall** be recorded, each with an accountable owner.    | The supplier register. See *FitSD — Information Stores*. |
| **FSD-SC-2** | A new supplier or third-party dependency **shall** be assessed for risk and suitability before it is adopted.               | Satisfied at intake: the FSD-SD-1 new-technology trigger and Gate 1 vendor due diligence. |
| **FSD-SC-3** | Where a supplier handles the team's data or supports a live service, security and service expectations **shall** be set in the agreement and evidence retained. | Contracts, DPAs, support terms, proportionate to what the supplier touches. |
| **FSD-SC-4** | Supplier dependencies **shall** be reviewed periodically — support horizons (EOL/EOS), renewals, performance — with an exit or replacement path understood for any a service cannot run without. | Feeds the end-of-life decision (FSD-RR-7 *renew*): the Gate 1 "how would we get off it?" question, kept alive. |

---

## Reference documents (non-normative)

FitSD ships reference documents for its flagship **Solution Development** capability, which implementers may adopt and adapt:

- **Idea Brief** form: the pre-Gate-1 intake (FSD-FRM-00).
- **Solution Development Process**: the two-gate process plus Service Acceptance close-out (satisfies FSD-SD-1…6).
- **Gate 1 — Outline Proposal** form.
- **Gate 2 — Solution Design** form.
- **Service Acceptance Record**: the Definition of Done (satisfies FSD-SD-4/5).
- **Service Acceptance Criteria** (`reference/`): where the SAC categories are defined and an organisation ratifies its standing baseline (supports FSD-GV-7).

These are illustrative reference material, not part of the normative requirements above. An implementation conforms by meeting the requirements, however it chooses to document them.

---

*Coverage note: FSD-GV and FSD-SD are the founding spine. FSD-CH / FSD-RR / FSD-SA / FSD-SC are stated here so the requirement set is complete; their Tier 2 treatment is a capability card plus the process you already run. Deliberately. FitSD builds no second full process (see the Roadmap, "Shape & scope").*
