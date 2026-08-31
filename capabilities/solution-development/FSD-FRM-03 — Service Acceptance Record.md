---
title: FSD-FRM-03 — Service Acceptance Record
framework: FitSD
document_id: FSD-FRM-03
capability: Solution Development
tier: 4
version: 0.3
status: draft
owner: Management System Owner
approver: Approver
governing_process: FSD-PRO
satisfies:
  - FSD-SD-4
  - FSD-SD-5
date: 2026-06-23
tags:
  - fitsd
  - solution-development
  - service-acceptance
  - form
---

# FSD-FRM-03 — Service Acceptance Record

> **Service Acceptance asks: is it proven done?** Walk each Service Acceptance Criterion and record the evidence. A solution is accepted into service only when each is met **and evidenced**, not merely configured. The approaches were designed at Gate 2 (FSD-FRM-02); here they are proven. The live copy is held in the team's work-tracking system; this is the blank template.

## Header

| Field                          | Entry |
| ------------------------------ | ----- |
| **Solution title**             |       |
| **Solution Owner**             |       |
| **Delivery project (ref)**     |       |
| **Linked Gate 2 (FSD-FRM-02)** |       |
| **Date**                       |       |

## 1. Acceptance criteria

For each criterion, record the evidence (a link, a date, a reference) and whether it meets your organisation's **standing SAC baseline**. The criteria are defined once in *FitSD — Service Acceptance Criteria*; below is what *proof* looks like at acceptance. Where the baseline's applicability rules say a criterion doesn't apply to this service, record **N/A per baseline** with the reason, a recorded call, not a skip.

| Criterion | Evidence / link | Met? (Y / N / N/A per baseline) |
|---|---|---|
| **Documentation:** HLD, runbook, recovery procedure, operating procedures (SOPs), user/how-to published | | |
| **Backup (tested):** backup in place **and test restore performed**, dated | | |
| **Security:** hardening applied, patch path set (FSD-RR), vuln posture acceptable, exceptions logged (FSD-SA) | | |
| **Access:** access model implemented; least privilege; JML handling confirmed | | |
| **Availability:** SLO met or accepted; capacity & scaling understood; DR position recorded | | |
| **Monitoring & alerting:** monitoring live; thresholds set; test alert observed end-to-end | | |
| **Incident profile:** service-level incident triggers & severities registered with the incident-management process | | |
| **Supportability / handover:** support model agreed; runbook & SOPs accepted by operators; knowledge transfer / cross-training done; team ready; **continuity** assured (not reliant on one person); any new/changed standing procedure the service forced (Gate 2 §4) written & adopted | | |
| **Cost / licensing:** licences in place; ongoing run-cost confirmed and owned | | |

## 2. Outstanding remediation

*List any criterion not yet met, the action required, and the owner/date. The record is re-presented when these are closed.*

| Criterion | Action required | Owner | Target date |
| --------- | --------------- | ----- | ----------- |
|           |                 |       |             |

## 3. Acceptance sign-off

| Field          | Entry                                        |
| -------------- | -------------------------------------------- |
| **Decision**   | Accepted into service / Remediation required |
| **Approver**   |                                              |
| **Conditions** |                                              |
| **Date**       |                                              |
