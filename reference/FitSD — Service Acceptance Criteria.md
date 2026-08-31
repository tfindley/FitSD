---
title: "FitSD — Service Acceptance Criteria"
framework: FitSD
document: Service Acceptance Criteria
tier: 0
version: 0.3
type: reference (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-07-01
tags: [fitsd, reference, service-acceptance, sac, definition-of-done, non-normative]
---

# FitSD — Service Acceptance Criteria

> **TL;DR** — The Service Acceptance Criteria, defined once: the standing Definition of Done every solution meets. Fixed *categories*; each organisation sets and ratifies its *own* thresholds. Non-normative here — the binding "shall" lives in *FitSD — Requirements* (the standing-baseline requirement and FSD-SD-4/5). This document *defines* the criteria; `FSD-PRO §7` proves them; the forms design and evidence them (`FSD-FRM-02 §5`, `FSD-FRM-03 §1`).

## The SAC are principles, not one org's numbers

The SAC are best understood as **standing, inheritable non-functional principles**. The *categories* below are fixed. They are the shape of "operable" that FitSD holds every service to. The *thresholds* are not: every organisation's acceptable service-quality bar differs — its availability target, its backup-test cadence, its continuity rule, what it counts as a reportable incident, its cost and licensing posture.

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
| **Supportability / handover** | An operating and support model exists; knowledge transfer / cross-training is done so **continuity** is assured (the service isn't reliant on a single person) and any new or changed standing procedure the service forced (flagged at Gate 2 §4) has been written and adopted. | The support model — hours, response expectations by severity, who takes first contact, escalation path and cover, and how it's communicated to the service's customers; the continuity rule (no single-person dependency in the operating team *or* the support model, what evidences sufficient cross-training, and who attests it); and how operating-procedure changes are handled. |
| **Cost / licensing** | Licences are in place and ongoing run-cost is owned. | The licensing posture and who owns the run-cost. |

The set may grow as practice matures. A new criterion is a framework change, versioned like any other.

## Your SAC baseline

Set this once, ratify it, and inherit it into every solution. The prompts below are **questions, not answers**: FitSD ships no default numbers, on purpose. Fill them with values that fit *your* organisation and risk appetite. (Worked example values will follow the published end-to-end example; see *FitSD — Roadmap*.)

**Applicability.** The baseline may also set *applicability rules*: where a criterion legitimately doesn't apply (say, a stateless internal tool with nothing of its own to back up). At acceptance, such a criterion is recorded **N/A per baseline, with the reason**, a deliberate call against a standing rule, not a skip. If you find yourself writing N/A with no rule to point at, the fix is to change the baseline, not to bend the record.

**Decay.** Some rows stay proven; others rot. Proven once is not proven forever: the baseline may set a re-verification cadence per criterion — a restore re-test rhythm for Backup, a continuity re-check on a cadence or on any staffing change for Supportability. Ask of each row: does this evidence have a shelf life?

**Cite, don't copy.** Where a row's values already live in a standing policy (patch timescales in your patch standard, say), the row may name that policy as its authority rather than restating the numbers — one source of truth, no drift at the next policy revision.

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
| **Supportability / handover** | *Support model; the continuity rule (no single-person dependency); how operating-procedure changes the service requires are captured* | |
| **Cost / licensing** | *Licensing posture; who owns ongoing run-cost* | |

**Ratification.** A baseline is only standing once it's owned.

| Field | Entry |
|---|---|
| **Ratified by** | *(the accountable owner, e.g. Management System Owner)* |
| **Date** | |
| **Review cadence** | *(tie to your management-system review; FSD-GV-5)* |

## How the baseline flows

- **Idea Brief (FSD-FRM-00)** — referenced, not re-specified: the brief names the SAC baseline as the service-quality expectation and notes any project-specific emphasis, so quality shapes selection from the start.
- **Gate 2 (FSD-FRM-02 §5)** — *designed*: how each criterion will be met against the baseline.
- **Service Acceptance (FSD-FRM-03 §1)** — *proven*: evidence each criterion meets the baseline before the service goes live.

Standing up the baseline for the first time is an explicit step in *FitSD — Implementation Guide*.

## See also

- `FitSD — Requirements`: the binding "shall" (the standing-baseline requirement; FSD-SD-4/5)
- `capabilities/solution-development/FSD-PRO` §7: where the criteria are proven at Service Acceptance
- `FitSD — Implementation Guide`: how an organisation ratifies its baseline when standing FitSD up
- `reference/FitSD — Standards Alignment`: how the criteria map to ISO 27001 / NIS2 / FitSM
- `reference/FitSD — Information Stores`: the SAC baseline and the acceptance records as owned stores
