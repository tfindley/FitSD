---
title: FSD-FRM-03 — Service Acceptance Record
framework: FitSD
document_id: FSD-FRM-03
capability: Solution Development
tier: 4
type: form (reference template)
version: 0.4
status: draft
owner: Management System Owner
approver: Approver
governing_process: FSD-PRO
satisfies:
  - FSD-SD-4
  - FSD-SD-5
date: 2026-10-21
tags:
  - fitsd
  - solution-development
  - service-acceptance
  - form
---

# FSD-FRM-03 — Service Acceptance Record

> **Service Acceptance asks: is it proven done?** Walk each Service Acceptance Criterion and record the evidence. A solution is accepted into service only when each is met **and evidenced**, not merely configured. The approaches were designed at Gate 2 (FSD-FRM-02); here they are proven. Record failed attempts and known thinness alongside the pass — a successor reads this table before anything else. *(Terms: see `FitSD — Definitions`.)* The live copy is held in the team's work-tracking system; this is the blank template.

## Header

| Field                          | Entry |
| ------------------------------ | ----- |
| **Solution title**             |       |
| **Solution Owner**             |       |
| **Delivery project (ref)**     |       |
| **Linked Gate 2 (FSD-FRM-02)** |       |
| **Framework record(s)**        | *(optional — if you run another framework, the matching record there: the release / deployment record, the catalogue or CMDB entry. See your companion profile)* |
| **Date**                       |       |

## 1. Acceptance criteria

For each criterion, record the **route** it was addressed by, the evidence (a link, a date, a reference), and whether it meets your organisation's **standing SAC baseline**. The criteria are defined once in *FitSD — Service Acceptance Criteria*; below is what *proof* looks like at acceptance. Every criterion is addressed by one of three routes — nothing is left blank:

- **Baseline** — met the standard way.
- **Alternative** — the criterion applies, the standard means didn't fit, and another means meets its intent. Cite the Gate 2 approval that authorised it (FSD-FRM-02 §5). Evidence it like any other row.
- **N/A per baseline** — cite the standing applicability rule and the reason. A recorded call, not a skip; N/A with no rule to point at means the baseline needs changing, not the record bending.

Conformance needs a ratified baseline (FSD-GV-7). If the evidence here is weighed against Gate 2's *draft — unratified* rows instead, this is a trial record: say so.

| Criterion | Route (baseline / alternative + Gate 2 ref / N/A per baseline + rule) | Evidence / link | Met? (Y / N) |
|---|---|---|---|
| **Documentation:** HLD (carrying the design decisions and rationale), runbook, recovery procedure, operating procedures (SOPs), user/how-to published | | | |
| **Backup (tested):** backup in place **and test restore performed**, dated | | | |
| **Security:** hardening applied, patch path set (FSD-RR), vuln posture acceptable, exceptions logged (FSD-SA) | | | |
| **Access:** access model implemented; least privilege; JML handling confirmed | | | |
| **Availability:** SLO met or accepted; capacity & scaling understood; DR position recorded | | | |
| **Monitoring & alerting:** monitoring live; thresholds set; test alert observed end-to-end | | | |
| **Incident profile:** service-level incident triggers & severities registered with the incident-management process (registration evidenced: accepted by whom, when) | | | |
| **Validation & test:** each Must and accepted Should from Gate 2 §2 demonstrated against its stated criterion, dated, results recorded — failures shown beside the passes; attested by whoever the baseline names | | | |
| **Supportability / handover:** support model agreed; runbook & SOPs accepted by the named operators — first line included — in a dated record; knowledge transfer / cross-training done; team ready; **continuity** assured (not reliant on one person); any new/changed standing procedure the service forced (Gate 2 §4) written & adopted | | | |
| **Cost / licensing:** licences in place; ongoing run-cost (cash **and** operating effort) confirmed and owned | | | |

## 2. Conditions from Gate 2 — position at acceptance

*Each condition the Gate 2 sign-off attached, and how it stands now.*

| Gate 2 condition | Position at acceptance |
| ---------------- | ---------------------- |
|                  |                        |

## 3. Outstanding remediation and open actions

*List any criterion not yet met (the record is re-presented when these are closed), and any open actions that don't block acceptance — acceptance conditions land here too, each with an owner and target date, tracked until closed.*

| Criterion / action | Blocks acceptance? (Y/N) | Action required | Owner | Target date |
| ------------------ | ------------------------ | --------------- | ----- | ----------- |
|                    |                          |                 |       |             |

## 4. Acceptance sign-off

Acceptance names the live Service Owner on the service register (FSD-GV-2). Conditions carried with acceptance each have an owner and a target date (§3) and stay on the review agenda until closed.

| Field          | Entry                                        |
| -------------- | -------------------------------------------- |
| **Decision**   | Accepted into service / Remediation required |
| **Service register entry** | *Service, live Service Owner (and deputy, if your continuity rule names one), status* |
| **Approver**   |                                              |
| **Conditions** |                                              |
| **Date**       |                                              |
