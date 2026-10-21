---
title: "FitSD — Service Acceptance Criteria"
framework: FitSD
document: Service Acceptance Criteria
tier: 0
version: 0.4
type: reference (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-10-21
tags: [fitsd, reference, service-acceptance, sac, definition-of-done, non-normative]
---

# FitSD — Service Acceptance Criteria

> **TL;DR** — The Service Acceptance Criteria, defined once: the standing Definition of Done every solution meets. Fixed *categories*; each organisation sets and ratifies its *own* thresholds. Non-normative here — the binding "shall" lives in *FitSD — Requirements* (the standing-baseline requirement and FSD-SD-4/5). This document *defines* the criteria; `FSD-PRO §7` proves them; the forms design and evidence them (`FSD-FRM-02 §5`, `FSD-FRM-03 §1`).

## The three layers

The SAC are not one thing. Keeping the layers apart is what stops the set drifting into a per-project checklist.

| Layer | Who owns it | What it holds |
|---|---|---|
| **SAC categories** | The framework, fixed | What every acceptance must address. The table below. |
| **SAC baseline** | Your organisation, ratified once (FSD-GV-7) | The default way each category is met here: your thresholds, your applicability rules, and how much proof each needs. |
| **Service SAC** | The solution, at Gate 2 | The baseline inherited, plus any approved alternatives and any criteria specific to this service. |

A reader coming from FitSM will know "service acceptance criteria" as the *third* layer — per service, set at design, covering functional and non-functional aspects (FitSM-0, PR1.3). That is the same object. FitSD's contribution is the layer above it: a standing baseline every service's criteria inherit, so each solution designs to a known bar instead of inventing one.

## The SAC are principles, not one org's numbers

The SAC are best understood as **standing, inheritable service-quality principles**. Most are non-functional; one, *Validation & test*, governs how fitness for purpose is proven — and even there the standing part is the **method of proof, never the test cases**, which stay with the solution at Gate 2. The *categories* below are fixed. They are the shape of "operable" that FitSD holds every service to. The *thresholds* are not: every organisation's acceptable service-quality bar differs — its availability target, its backup-test cadence, its continuity rule, what it counts as a reportable incident, its cost and licensing posture.

So an adopter shouldn't inherit *our* numbers. They inherit the *categories*, then set their own thresholds **once**, ratify them as the organisation's standing non-functional baseline, and **inherit that baseline into every solution**: designed to at Gate 2, proven at Service Acceptance. This is the shift-left of non-functional requirements: teams design *to* a known bar instead of discovering it at go-live.

Defining the set in one place is also what keeps it from drifting. The criteria are referenced **by name** wherever they appear; the set is versioned with the framework; no document states a count.

## The criteria

Each criterion is described here by *what it covers*, stage-neutral. It is **designed** at Gate 2 (how the baseline will be met) and **proven** at Service Acceptance (evidence the baseline is met). Those stage-specific bars live on the forms, not here.

| Criterion | What it covers | What your baseline sets |
|---|---|---|
| **Documentation** | The service can be understood and operated from written material: design (carrying the key decisions and their rationale from delivery), runbook, recovery procedure, operating procedures (SOPs), user/how-to. | Which documents are mandatory, where they live, and how often they're reviewed. |
| **Backup (tested)** | Data is recoverable, and recovery is demonstrated rather than assumed. | Backup scope, frequency, retention, location, and how often a restore is actually tested. |
| **Security** | The service is hardened, has a patch path, and its vulnerability posture is acceptable, with any departures recorded. | The hardening standard, patch timescales by severity, what "acceptable posture" means, and the key/secret-management standard services follow (ties to FSD-SA, incl. FSD-SA-6). |
| **Access** | Access follows least privilege, with joiners/movers/leavers handled and access reviewed. | The access model and the review cadence (ties to FSD-SA-2). |
| **Availability** | The service meets an agreed availability target, with capacity and disaster-recovery understood. | The availability target / SLO (by service tier, if you tier) and the DR position. |
| **Monitoring & alerting** | The service is observed, with thresholds and alert routing that work end to end. | What must be monitored, the thresholds, and where alerts route — checked against the support hours and response targets, so out-of-hours routing and due-by times agree. |
| **Incident profile** | What counts as an incident *for this service* is defined and registered with the incident process. | The severity scheme and the reportable-incident bar (satisfies FSD-RR-6). |
| **Validation & test** | The solution does what it was agreed to do: the Gate 2 requirements — the Musts, and the Shoulds that were accepted — are demonstrated against stated criteria, not assumed from "it deployed". | The level of validation evidence required, by service risk or tier; who attests it, and whether whoever built it may attest their own work; what environment and data a pass must be demonstrated on; and when validation must be repeated. See *FitSD — Validation & Test Guidance*. |
| **Supportability / handover** | An operating and support model exists; knowledge transfer / cross-training is done so **continuity** is assured (the service isn't reliant on a single person) and any new or changed standing procedure the service forced (flagged at Gate 2 §4) has been written and adopted. | The support model — hours, response expectations by severity, who takes first contact, escalation path and cover, and how it's communicated to the service's customers; the continuity rule (no single-person dependency in the operating team *or* the support model, what evidences sufficient cross-training, and who attests it); and how operating-procedure changes are handled. |
| **Cost / licensing** | Licences are in place and ongoing run-cost is owned. | The licensing posture and who owns the run-cost. |

The set may grow as practice matures. A new criterion is a framework change, versioned like any other.

## Your SAC baseline

Set this once, ratify it, and inherit it into every solution. The prompts below are **questions, not answers**: FitSD ships no default numbers, on purpose. Fill them with values that fit *your* organisation and risk appetite. (Worked example values will follow the published end-to-end example; see *FitSD — Roadmap*.)

**Applicability.** The baseline may also set *applicability rules*: where a criterion legitimately doesn't apply (say, a stateless internal tool with nothing of its own to back up). At acceptance, such a criterion is recorded **N/A per baseline, with the reason**, a deliberate call against a standing rule, not a skip. If you find yourself writing N/A with no rule to point at, the fix is to change the baseline, not to bend the record.

**Alternative means.** Between "met" and "not applicable" sits the case the two outcomes miss: the criterion *does* apply, but the standard way of meeting it doesn't fit. Then it is met by an **approved alternative** — another means that meets the criterion's intent, with the reason recorded and the Gate 2 Approver's approval behind it (FSD-FRM-02 §5), evidenced at acceptance like any other row. An alternative is a design decision, not an open action; where it is weaker than the baseline and meant to be temporary, record it as time-bound and it becomes an acceptance condition with an owner and a date (FSD-SD-7). The discipline is that every criterion is *addressed*: met, met another way, or ruled out. None is silently skipped.

**Foundational services.** The commonest alternative has a standing shape, so set it as a rule: **a service that provides a SAC control to other services proves that criterion independently of itself.** The backup platform can't demonstrate recoverability using itself — its catalogue, configuration and keys go to a separate target and are restore-tested from there. The monitoring platform needs an out-of-band heartbeat; who monitors the monitor is a question with an answer, not a joke. The identity provider's own access model has to cover break-glass. The incident tool can't be the tool that registers its own incident profile. The patching platform needs a patch path that doesn't route through itself. These services are not exempt from the criterion — they're the ones where proving it matters most.

**Decay.** Some rows stay proven; others rot. Proven once is not proven forever: the baseline may set a re-verification cadence per criterion — a restore re-test rhythm for Backup, a continuity re-check on a cadence or on any staffing change for Supportability, re-validation on material change for Validation & test. Ask of each row: does this evidence have a shelf life?

**Cite, don't copy.** Where a row's values already live in a standing policy (patch timescales in your patch standard, say), the row may name that policy as its authority rather than restating the numbers — one source of truth, no drift at the next policy revision.

**Running alongside another framework.** The same principle does the heavy lifting if you already run a service-management system. Several rows would otherwise set a value that your existing processes own, giving you two sources of truth for one number. Name the existing artefact as the row's authority instead, and let the SAC *verify* rather than *set*:

| Row | What it cites, rather than setting |
|---|---|
| **Availability** | The service's SLA or OLA owns the target; the continuity plan owns the DR position. The SAC checks the service meets them. Standalone, with no SLA, the baseline stays the source — FSD-GV-9 allows an explicit best-effort position. |
| **Incident profile** | The incident process owns the priority scheme and the major-incident criteria. The profile supplies the *service-specific triggers* mapped onto them; it does not define its own severities. The existing "accepted by the incident process's owner" evidence already points this way. |
| **Security / Access** | Your information-security policies and your access-control process. The SAC confirms this service implements them. |
| **Configuration** | Where you run a CMDB, acceptance confirms the service's configuration items and their relationships are registered. FitSD declares configuration management a non-goal standalone, so this is a row your baseline adds only if you have the practice to cite. |

*FitSD — Companion Profile — FitSM* works this through for a FitSM-based system, naming the requirement behind each.

*Owner = who maintains that row's standard (the person you argue with to change it). Evidence owners are named per service, on the Service Acceptance Record.*

| Criterion | Your standard (set once, ratified) | Owner |
|---|---|---|
| **Documentation** | *Which documents are mandatory; where they live* | |
| **Backup (tested)** | *Backup scope; frequency; retention; how often a restore is tested* | |
| **Security** | *Hardening standard; patch timescales by severity; acceptable vulnerability posture* | |
| **Access** | *Access model; least-privilege rules; how often access is reviewed* | |
| **Availability** | *Availability target / SLO (by tier, if you tier); DR position* | |
| **Monitoring & alerting** | *What must be monitored; thresholds; where alerts route* | |
| **Incident profile** | *Severity scheme; what counts as a reportable incident* | |
| **Validation & test** | *How much validation evidence a service of this risk needs; who attests a pass; whether the builder may attest their own work; what environment counts* | |
| **Supportability / handover** | *Support model; the continuity rule (no single-person dependency); how operating-procedure changes the service requires are captured* | |
| **Cost / licensing** | *Licensing posture; who owns ongoing run-cost* | |

**Ratification.** A baseline is only standing once it's owned.

| Field | Entry |
|---|---|
| **Ratified by** | *(the accountable owner, e.g. Management System Owner)* |
| **Date** | |
| **Review cadence** | *(tie to your management-system review; FSD-GV-5)* |

## How the baseline flows

The baseline is a **staged prerequisite**. You don't need one to raise an idea. You do need one to design against, and a ratified one to accept.

| Stage | What the baseline does | Needed? |
|---|---|---|
| **Idea Brief (FSD-FRM-00)**, Gate 1 | *Referenced*, not re-specified: the brief names it as the service-quality expectation and notes any project-specific emphasis, so quality shapes selection from the start. | **No.** None ratified yet? Say so, and name the bar you expect. Never a reason to hold a brief. |
| **Gate 2 (FSD-FRM-02 §5)** | *Designed to*: how each criterion will be met against the baseline. | **Yes.** Where none is ratified yet, draft the rows this solution needs (below). |
| **Service Acceptance (FSD-FRM-03 §1)** | *Proven*: evidence each criterion meets the baseline before the service goes live. | **Ratified**, to conform (FSD-GV-7). |

**No baseline yet?** Normal, if you're trying FitSD on one project before adopting it. At Gate 2 the Solution Owner drafts the rows this solution needs from the template above, fills them with values people chose rather than defaults, and marks them **draft — unratified** so the Approver decides with that in view. Nothing downstream treats a draft as standing. An acceptance proven against draft rows is a trial record, not a conformance claim. Ratify a baseline and those drafts become its first rows.

Standing up the baseline for the first time is an explicit step in *FitSD — Implementation Guide*.

## See also

- `FitSD — Requirements`: the binding "shall" (the standing-baseline requirement; FSD-SD-4/5)
- `capabilities/solution-development/FSD-PRO` §7: where the criteria are proven at Service Acceptance
- `reference/FitSD — Validation & Test Guidance`: how to build test procedures proportionate to risk (the Validation & test row's *how*)
- `FitSD — Implementation Guide`: how an organisation ratifies its baseline when standing FitSD up
- `reference/FitSD — Standards Alignment`: how the criteria map to ISO 27001 / NIS2 / FitSM
- `reference/FitSD — Information Stores`: the SAC baseline and the acceptance records as owned stores
