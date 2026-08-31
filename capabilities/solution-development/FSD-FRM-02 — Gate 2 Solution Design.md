---
title: FSD-FRM-02 — Gate 2 Solution Design
framework: FitSD
document_id: FSD-FRM-02
capability: Solution Development
tier: 4
type: form (reference template)
version: 0.3
status: draft
owner: Management System Owner
approver: Approver
governing_process: FSD-PRO
date: 2026-06-23
tags:
  - fitsd
  - solution-development
  - project-gates
  - form
  - gate-2
---

# FSD-FRM-02 — Gate 2 Solution Design

> **Gate 2 asks: is it ready to build?** Refine the approved Gate 1 idea into a buildable, operable design. The design must state *how* each Service Acceptance Criterion (§5) will be met — those are proven later on FSD-FRM-03. *(Terms: see `FitSD — Definitions`.)* The live copy is held in the team's work-tracking system; this is the blank template.

## Header

| Field                            | Entry                        |
| -------------------------------- | ---------------------------- |
| **Solution title**               |                              |
| **Status**                       | Draft / Submitted / Approved |
| **Solution Owner**               |                              |
| **Contributors**                 |                              |
| **Linked Gate 1 (FSD-FRM-01)** |                              |
| **Date**                         |                              |

## 1. Carry-forward from Gate 1

*Summarise the approved Gate 1 (outcome sought, value, and effort), updated as more is now known.*

| Field                       | Entry |
| --------------------------- | ----- |
| **Outcome / requirement**   |       |
| **Selected option**         | *Which Gate 1 delivery option was chosen, and the evaluation / research reference (file evaluation evidence — a PoC scorecard, say — with the gate record)* |
| **Gate 1 conditions**       | *Each condition from the Gate 1 sign-off, and how this design discharges it* |
| **Value (recap)**           |       |
| **Effort (recap, refined)** |       |

## 2. Requirements

*Functional and technical requirements as user stories, MoSCoW-rated (Must / Should / Could / Won't).*

| #   | User story                  | MoSCoW |
| --- | --------------------------- | ------ |
| 1   | *As a … I want … so that …* |        |
| 2   |                             |        |
| 3   |                             |        |

## 3. Architecture

*Sketch the architecture and where it fits in the wider estate. Include a diagram, and show where security sits in it. Note any departures from the team's design principles or security baseline (name which — if you have no written design principles, your security policies and SAC baseline stand in).*

> *Insert / link architecture diagram here.*

| Field                      | Entry |
| -------------------------- | ----- |
| **Description**            |       |
| **Security in the design** |       |
| **Design exceptions**      |       |

## 4. Operational impact — cross-process

*Where this service touches your **other** operating processes and systems. The SAC-aligned operational design (monitoring, backup, access, availability, support, cost) lives in §5. Don't duplicate it here.*

| Integration point                        | Impact / approach |
| ---------------------------------------- | ----------------- |
| **Billing / chargeback** (if applicable) | *Integration with the billing/finance system (run-cost itself is a SAC item — §5)* |
| **Service desk / ITSM**                  |                   |
| **Environments** (dev / ongoing)         |                   |
| **Process impact**                       | *Does this force changes to your change, incident or other operating processes? Note which capability: FSD-CH / FSD-RR / FSD-SA. Any new or changed standing procedure noted here is proven written and adopted at Service Acceptance (Supportability/handover, §5).* |

## 5. Service Acceptance Criteria — design approach

State *how* each criterion will be met **against your organisation's standing SAC baseline** (the categories are defined in *FitSD — Service Acceptance Criteria*; your thresholds are the baseline you inherit). Each is proven later on FSD-FRM-03.

| Criterion | Design approach |
|---|---|
| **Documentation** | *Which docs (HLD, runbook, recovery, operating procedures/SOPs, user) and where they will live* |
| **Backup (tested)** | *What is backed up, frequency, retention, location, and how a test restore will be proven* |
| **Security** | *Hardening, patch path (FSD-RR), vulnerability posture, any exceptions (FSD-SA)* |
| **Access** | *Access model: roles, least privilege, grant/revoke, admin control, JML handling* |
| **Availability** | *Expected availability / SLO, capacity & scaling, DR considerations* |
| **Monitoring & alerting** | *What is monitored, thresholds, where alerts route* |
| **Incident profile** | *What counts as an incident for this service (triggers and severities) to register with the incident-management process* |
| **Supportability / handover** | *Operating & support model, runbook & SOPs, knowledge transfer / cross-training needed; how continuity is assured so the service isn't reliant on one person; any new/changed standing procedure this service will require (from §4 process impact)* |
| **Cost / licensing** | *Expected run-cost and licences* |

## 6. RAIDD

*One row per item; repeat types as needed. For a **Decision**, the description carries the rationale, who decided, and when — at acceptance, open risks transfer to the risk register and decisions (with their rationale) into the service's standing documentation, so they outlive the delivery.*

| Type           | Description | Owner | Status / mitigation |
| -------------- | ----------- | ----- | ------------------- |
| **Risk**       |             |       |                     |
| **Assumption** |             |       |                     |
| **Issue**      |             |       |                     |
| **Dependency** |             |       |                     |
| **Decision**   |             |       |                     |

## 7. Refined effort, cost and timeline

*Keep proportionate: person-days by role/workstream and a short milestone list, not a full FTE/capacity model (only reach for that under genuine resource contention).*

### 7.1 Effort and cost

| Category   | Estimate                            | Working / evidence        |
| ---------- | ----------------------------------- | ------------------------- |
| **People** | *person-days, by role / workstream* |                           |
| **CAPEX**  |                                     | *purchase / one-off*      |
| **OPEX**   |                                     | *ongoing run / licensing* |
| **Ongoing operating effort** | *est. person-days/month once live: patching, support, upkeep* | *refined and confirmed at acceptance* |

### 7.2 Milestones

| Milestone | Target date | Owner |
| --------- | ----------- | ----- |
|           |             |       |
|           |             |       |

## 8. Sign-off

Sign-off authorises progression to delivery; build and deployment changes are then raised through Change & Release (FSD-CH). The approval states what it commits — build effort, the accepted ongoing run-cost — and any conditions carry an owner and a target date.

| Field          | Entry                          |
| -------------- | ------------------------------ |
| **Decision**   | Approved for delivery / Rework |
| **Approver**   |                                |
| **Conditions** |                                |
| **Ratified with this decision** *(optional)* | *Exceptions, data classifications, deviations the design asks the Approver to own* |
| **Date**       |                                |
