---
title: "FSD-RR — Run & Restore"
framework: FitSD
document_id: FSD-RR
capability: Run & Restore
type: capability card
tier: 2
version: 0.3
status: draft
owner: "Management System Owner"
satisfies: [FSD-RR-1, FSD-RR-2, FSD-RR-3, FSD-RR-4, FSD-RR-5, FSD-RR-6, FSD-RR-7]
date: 2026-08-31
tags: [fitsd, run, restore, incident, capability-card]
---

# FSD-RR — Run & Restore

*Capability card. Keep live services healthy, and get them back fast when they break.*

> **What a capability card is.** A one-page orientation, not a process: what the capability is for, the requirements it carries, what to satisfy them *with*, and how it wires into Solution Development. FitSD authors a full process only for Solution Development; the rest are requirements plus a pointer.

## Objective

Detect when something's wrong, fix it fast, and stop it happening twice. This is the day-to-day reality of running services: incidents, the occasional bad day that becomes a major incident, the recurring faults worth chasing to root cause, and the monitoring and patching that keep the lights on.

## Scope

**In:** incidents and major incidents, problems, monitoring and availability, capacity, patching, each service's incident profile, and **end-of-life review & retirement**. **Out:** building new services (Solution Development) and changing them (Change & Release).

## Requirements it carries (Tier 1)

- **FSD-RR-1**: service-affecting events detected, recorded, prioritised and resolved to targets.
- **FSD-RR-2**: major incidents have a defined escalation and communication path.
- **FSD-RR-3**: recurring or high-impact incidents investigated for root cause.
- **FSD-RR-4**: services monitored against expected availability; capacity managed ahead of need.
- **FSD-RR-5**: security patches assessed and applied to risk-based timescales.
- **FSD-RR-6**: each service declares its incident profile (what counts as an incident *for it*, with severities), registered with the incident process.
- **FSD-RR-7**: at end of life, a renew / replace / retire decision is recorded; retirement is carried out cleanly (data, access, SLAs, docs, register, knowledge).

## How to satisfy them

Most teams already run a central incident policy. Use it. Map onto:

- **FitSM PR9 (Incident & Service Request), PR10 (Problem), PR4 (Availability & Continuity), PR5 (Capacity).**
- **ITIL 4 Incident, Problem, and Monitoring & Event management.**
- **Your central incident-management policy** for the escalation and comms path.
- No central policy or severity scheme at all? Define Sev1–4 in your SAC baseline and treat it as the team's standing scheme — the per-service profiles then have something to register against.

FitSD's distinct contributions here are two. **FSD-RR-6** — the per-service incident profile: central policies define "an incident" in the abstract; almost nobody writes down what it means for *this* service (FitSD makes you, at Service Acceptance). And **FSD-RR-7** — controlled end-of-life: most teams have no clean way to retire a service, so they never quite do; FitSD makes the renew / replace / retire decision explicit and the decommission controlled.

## Where it meets Solution Development

The Service Acceptance criteria are the hand-over. **Monitoring & alerting**, the **incident profile**, and the **supportability / handover** all pass from a new service into Run & Restore the moment it's accepted. And the loop closes at end of life (FSD-RR-7): a service is reviewed and either **renewed** (keep running), **replaced** (the function's still needed, back through the front door as fresh demand) or **retired** (decommissioned cleanly). What you learn running a service (a nasty incident, a capacity ceiling) also comes back round as new demand.

## The feedback lens

This is the *Second Way* of *The Phoenix Project*: fast feedback, right to left. See problems as they happen, restore quickly, and feed what you learn back upstream. The metric is **time to restore service** (one of the DORA four), and the cultural habit is the **blameless postmortem**, which is really just problem management (FSD-RR-3) done without finger-pointing.

## Maturity, briefly

- **0–1**: incidents handled by whoever's nearest; little record, no root-cause habit.
- **2–3**: defined incident and problem paths, monitoring in place, patches kept up.
- **4–5**: MTTR watched and falling; recurring problems designed out, not just fixed.

(Full 0–5 scale in the Charter, §7.)

## See also

- `FSD-PRO`: Solution Development (hands over monitoring, incident profile and support model)
- `FitSD — Requirements` → FSD-RR section
- `FitSD — Standards Alignment`: FitSM PR9/PR10/PR4, ITIL mapping
- `reference/FitSD — Influences`: the canon behind the feedback lens
