---
title: "FitSD — Definitions"
framework: FitSD
document: Definitions
tier: 0
type: reference (non-normative)
status: living
owner: "Tristan Findley"
date: 2026-06-23
tags: [fitsd, definitions, glossary]
---

# FitSD — Definitions

> A master glossary. Each FitSD document defines the terms it uses where it uses them. That's deliberate, so a document stands alone. This is the single place that gathers them all, plus the common industry terms and acronyms FitSD leans on. Cheap to keep, handy to have. Non-normative: nothing here adds a requirement.

## FitSD terms

**Capability.** One of the areas FitSD organises service management into: Govern, Solution Development (the front door), Change & release, Run & restore, Secure & assure — plus the conditional sixth, Supplier & supply chain (FSD-SC), for teams whose services rely on suppliers or third-party dependencies.

**Capability card.** A one-page orientation for a capability: its objective, the requirements it carries, what to satisfy them with, and how it connects to Solution Development. Built for the four capabilities FitSD doesn't author a full process for.

**Gate.** A decision point with explicit outcomes: go, hold, or stop. Work doesn't pass a gate until it's signed off.

**Gate 1 (Outline Proposal).** The first gate: *is this worth doing?* A light filter, before any design effort.

**Gate 2 (Solution Design).** The second gate: *is it ready to build?* The design, including how it will be run.

**Business case.** FitSD produces no separate business-case document. The **Gate 1 Outline Proposal *is* the business case**: the driver, the cost of doing nothing, the options, the effort and the decision, in the language leadership funds work in. The Idea Brief frames the need; Gate 1 makes the fundable case; Gate 2 firms up cost, effort and timeline. Kept at the right weight: a fundable proposal, not an enterprise appraisal (Principle 2: every artefact earns its place).

**Idea Brief.** The optional one-page intake (FSD-FRM-00) raised before Gate 1 to decide whether an idea is worth a proper look. Carries forward into Gate 1; it designs nothing.

**Implementation profile.** A team's local version of FitSD: their actual documents and tools, mapped to the requirements.

**Net-new.** Work that meets the intake test (a new service or capability, new infrastructure, material effort or ongoing cost). The line that separates Solution Development work from routine change.

**Primary driver.** Why a piece of work is proposed: value, compliance, or risk reduction. For compliance- and risk-driven work, the case rests on impact and the obligation, not on the value score.

**Proof of Concept (PoC).** A small, time-boxed experiment to settle genuine feasibility doubt. Identified at Gate 1; done before Gate 2 if needed.

**Requirement.** A testable "shall" statement that must be met to conform to FitSD (Tier 1).

**Service.** Something the team provides and then runs and supports, not something built once and forgotten.

**Service Acceptance.** The close-out at the end of delivery: proof, with evidence, that a service is ready before it goes live.

**Service Acceptance Criteria (SAC) / Definition of Done.** The standing set of conditions a service must meet to be accepted: documentation, tested backup, security, access, availability, monitoring & alerting, incident profile, supportability, cost/licensing. Fixed *categories*; each organisation sets and ratifies its own *thresholds* as a standing baseline (FSD-GV-7). Defined in *FitSD — Service Acceptance Criteria*.

**SAC baseline.** An organisation's own ratified thresholds for each Service Acceptance Criterion, set once and inherited by every solution (FSD-GV-7). See *FitSD — Service Acceptance Criteria*.

**Solution Owner.** The single person accountable for a proposed solution, who drives it through the gates and completes the records.

**Supplier register.** The record of suppliers and third-party dependencies that live services rely on, each with an owner, its agreement, and its support horizon (FSD-SC-1). See *FitSD — Information Stores*.

**Approver.** The role that signs off the gates and Service Acceptance, at a level matched to the risk.

**Incident profile.** What counts as an incident for a *specific* service — its triggers and severities — registered with the incident process. Defined at Service Acceptance.

**Tier (0–5).** FitSD's document layers: 0 charter & vocabulary, 1 requirements, 2 capabilities, 3 roles, 4 templates, 5 maturity self-check. Tiers 0–1 are the framework; 2–5 are how a team implements it.

**Demand register (pipeline).** The record of work in the front-door pipeline — proposed, parked, rejected and in-flight — giving the upcoming/in-flight view. Becomes the service register once work goes live. See *FitSD — Information Stores*.

**Information store.** Any register or record set FitSD relies on, described by what it holds and who owns it, not by which tool holds it. Gathered in *FitSD — Information Stores*.

**End-of-life (EOL) review.** The decision taken when a service reaches end of life (EOL/EOS, obsolescence, or no longer needed): **renew** (keep running), **replace** (function still needed, back through the front door as new demand), or **retire** (decommission). See FSD-RR-7.

**Retirement (decommission).** The controlled close-out of a service no longer needed: data handled, access revoked, SLAs withdrawn, documentation archived, the register updated, and operating knowledge captured. See FSD-RR-7.

**Continuity (operational knowledge).** The assurance that a live service isn't reliant on a single person; its operating knowledge is captured and shared through knowledge transfer, cross-training and runbooks. Proven at Service Acceptance under supportability/handover.

## Common terms & acronyms

**BAU.** Business as usual: routine, day-to-day running and change.

**CAB.** Change Advisory Board, a group that reviews and authorises changes. FitSD doesn't mandate one; it's one way to meet the Change requirements.

**CAPEX / OPEX.** Capital expenditure (one-off purchase cost) and operating expenditure (ongoing run cost).

**DORA (four key metrics).** From the *Accelerate* research: deployment frequency, lead time for change, change-fail rate, and time to restore service. FitSD points at these as its flow measures.

**EOL / EOS.** End of life / end of support, when a product stops being maintained, a common trigger for new work.

**Given / When / Then.** A plain way to write a testable criterion: *given* a situation, *when* something happens, *then* this should result. Borrowed from behaviour-driven development.

**JML.** Joiners, movers, leavers: the lifecycle of granting, changing and removing a person's access.

**Kanban / WIP limit.** A way of managing flow by capping the amount of work in progress, so the team's constraint isn't swamped. FitSD's gates act as a WIP limit on intake.

**MFA.** Multi-factor authentication.

**MoSCoW.** A way to prioritise requirements: **Must** (non-negotiable), **Should** (important but not vital), **Could** (nice to have if there's room), **Won't** (not this time). Credited to Dai Clegg.

**MTTR.** Mean time to restore (or repair): how quickly service is brought back after an incident.

**MVP.** Minimum viable product, the smallest version that delivers real value.

**OIDC / SSO.** OpenID Connect / single sign-on: letting people authenticate once, through an identity provider.

**PDCA.** Plan-Do-Check-Act, the improvement cycle behind continual improvement (Deming/Shewhart).

**PoC.** See *Proof of Concept* above.

**RAID / RAIDD log.** A running list of Risks, Assumptions, Issues, Dependencies, and, in the longer form, Decisions. A standard project-tracking tool.

**RACI.** A responsibility matrix: who is Responsible, Accountable, Consulted, Informed for each activity.

**SLA / SLO.** Service-level agreement (a commitment to a customer) / service-level objective (an internal target).

**SOP.** Standard Operating Procedure: a documented, repeatable procedure for operating or maintaining a service. In FitSD a service's SOPs are its runbook and recovery procedure, required under the Documentation criterion and accepted by operators under Supportability/handover at Service Acceptance.

**T-shirt sizing.** Rough estimation in sizes — S, M, L — rather than precise numbers, used when detail isn't known yet.

**Theory of Constraints (ToC).** The idea that a system moves at the speed of its bottleneck, so find it, protect it, and don't overload it. From Goldratt's *The Goal*.

**Three Ways.** The principles of *The Phoenix Project*: flow, feedback, and continual learning.

**ZTNA.** Zero-trust network access: granting access per session and per service, rather than broad network access after a single login.

## Standards & frameworks referenced

**FitSM.** A free, lightweight ITSM standard. FitSD's closest cousin and the inspiration for its name.

**ISO/IEC 20000.** The international standard for IT service management systems.

**ISO/IEC 27001.** The international standard for information security management systems (ISMS).

**ITIL.** A widely used body of IT service-management practice (currently ITIL 4).

**ISMS.** Information security management system, the management framework ISO 27001 certifies.

**ITSM.** IT service management: running IT as a set of services.

**NIS2.** EU Directive (2022/2555) setting cybersecurity risk-management and reporting duties for in-scope organisations.

**USM / VeriSM.** A lean service-management *method* (USM) and a digital-era service-management approach (VeriSM); both compatible with, but organised differently from, FitSD.
