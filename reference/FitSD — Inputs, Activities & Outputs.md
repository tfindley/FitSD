---
title: "FitSD — Inputs, Activities & Outputs"
framework: FitSD
document: Inputs, Activities & Outputs
tier: 0
version: 0.3
type: reference (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-07-04
tags: [fitsd, reference, inputs, outputs, ipo, capabilities]
---

# FitSD — Inputs, Activities & Outputs

> **TL;DR** — The whole framework on one page: what each capability takes in, what it does, and what it produces. A synthesis, not new rules. The binding "shall" statements live in *FitSD — Requirements*; the records named here are defined in *FitSD — Information Stores*; the one full process is *FSD-PRO*.

## The framework in one line

Demand comes in from across the business. **Govern** holds the frame around everything. **Solution Development** is the front door: it turns demand into a live service through two gates and a Service Acceptance check. Once live, **Change & Release**, **Run & Restore** and **Secure & Assure** operate the service, with **Supplier & Supply Chain** watching what it stands on. At end of life the service is renewed, replaced (back through the front door as fresh demand), or retired.

Two pictures already draw this: the capability model in *Charter* §4, and the demand-in/outputs-out context view in *FitSD — Diagrams* §5. This page adds the piece those don't: the per-capability breakdown below.

## Per-capability inputs, activities and outputs

One owned process (Solution Development) and five that state a requirement and point at what you already run. That asymmetry is the design, and it shows here: the SD row is full; the rest are lean. Records named in the last column are all defined, with owners, in *FitSD — Information Stores*.

| Capability | Inputs | Key activities | Outputs | Records it touches |
|---|---|---|---|---|
| **Govern** (FSD-GV) | Scope decisions; every capability's records; the review cadence; owner changes and leavers | Set scope and owners; document control; PDCA review (per-service state included); keep the registers current; ratify the SAC baseline (FSD-GV-7); re-establish continuity on owner change (FSD-GV-8); see service levels stated and reported (FSD-GV-9) | A defined scope; named owners; the ratified SAC baseline; published service levels and reporting; a working document set; improvements from review | Service register; document register; demand / pipeline register; SAC baseline |
| **Solution Development** (FSD-SD) | The six demand families (strategy, customer, compliance, risk, operational, finance/people); the SAC baseline; new-technology triggers | Idea Brief → Gate 1 (worth doing?) → optional PoC → Gate 2 (ready to build?) → Service Acceptance (proven done?); track decision conditions to closure (FSD-SD-7) | Gate decisions; the business case; a designed, operable solution; a live service with a named owner; the operational artefacts (SOPs, monitoring, incident profile, support model) | Demand / pipeline register; gate records; Service Acceptance records; RAIDD log |
| **Change & Release** (FSD-CH) | Approved builds from Gate 2; change requests to live services | Assess risk and impact; authorise by risk; deploy in a repeatable, reversible way; review significant changes after the fact | Controlled changes; releases | Change records |
| **Run & Restore** (FSD-RR) | Live services and their handover (monitoring, incident profile, support model); service-affecting events; end-of-life triggers | Handle incidents and major incidents; problem/root-cause; monitor availability and capacity; patch; decide renew / replace / retire | A restored service; root-cause fixes; patched systems; a retirement decision and clean decommission; *replace routes back as new demand* | Incident records + per-service profiles; problem records; retirement records |
| **Secure & Assure** (FSD-SA) | Risks; joiner/mover/leaver access requests; the backup scheme; policy exceptions; regulatory duties; the secure-by-design hooks at Gate 2 | Treat or accept risk; run least-privilege access with reviews; back up and test the restore; handle exceptions; align to regulation | Risk-register entries; an access model; tested restores; time-bound exceptions; evidence of control | Risk register; exceptions register; backup & restore-test records |
| **Supplier & Supply Chain** (FSD-SC) *(conditional)* | A new supplier or dependency (via the SD new-technology trigger and Gate 1 vendor due diligence); renewal and EOL dates | Record dependencies; assess before adoption; set expectations in agreements; review periodically with an exit path | Supplier-register entries; agreements; renew/exit decisions (feeds the FSD-RR-7 *renew* arm) | Supplier / dependency register |

## How to read this

This page is an index, not a rulebook. Every activity above traces to a capability card or to *FSD-PRO*; every "shall" it implies is stated in *FitSD — Requirements*; every record is owned and described in *FitSD — Information Stores*. If this page and one of those ever disagree, those are right and this is stale — fix it here.

## See also

- `FitSD — Requirements` — the binding "shall" statements behind every activity
- `reference/FitSD — Information Stores` — the records column, defined with owners and lifecycle
- `FitSD — Diagrams` §4–5 — the service lifecycle and the demand-in/outputs-out context view
- `capabilities/solution-development/FSD-PRO` — the one capability built out in full
- `capabilities/` — the capability cards (objective, requirements, how to satisfy) for every capability but Solution Development
