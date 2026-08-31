---
title: "FSD-SA — Secure & Assure"
framework: FitSD
document_id: FSD-SA
capability: Secure & Assure
type: capability card
tier: 2
version: 0.2
status: draft
owner: "Management System Owner"
satisfies: [FSD-SA-1, FSD-SA-2, FSD-SA-3, FSD-SA-4, FSD-SA-5]
date: 2026-06-23
tags: [fitsd, security, risk, assurance, capability-card]
---

# FSD-SA — Secure & Assure

*Capability card. Stay safe and compliant: less a process, more a posture that runs through everything.*

> **What a capability card is.** A one-page orientation, not a process: what the capability is for, the requirements it carries, what to satisfy them *with*, and how it wires into Solution Development. FitSD authors a full process only for Solution Development; the rest are requirements plus a pointer.

## Objective

Manage risk, control who gets to what, keep data recoverable, handle the exceptions honestly, and meet the legal duties that apply. Unlike the other capabilities, this one doesn't sit in a lane — it runs across all of them, which is exactly why FitSD designs it into the front door rather than bolting it on at the end.

## Scope

**In:** the risk register, access control and joiners/movers/leavers, backup and recovery, policy exceptions, and regulatory alignment (NIS2 and the like). **Out:** a full, certifiable ISMS. FitSD is the on-ramp to that, not a substitute for it.

## Requirements it carries (Tier 1)

- **FSD-SA-1**: risks identified, recorded in a register, and treated or formally accepted by an owner.
- **FSD-SA-2**: access follows least privilege, with JML handled and reviewed.
- **FSD-SA-3**: data backed up to a defined scheme, and recovery *tested*, not assumed.
- **FSD-SA-4**: departures from policy handled as recorded, time-bound, compensated exceptions.
- **FSD-SA-5**: alignment to applicable legal and regulatory duties, with evidence kept.

## How to satisfy them

Met by your information-security and risk practices. Map onto:

- **ISO/IEC 27001 Annex A** (the control set).
- **FitSM PR6 (Information Security Management).**
- **NIS2 Article 21** risk-management measures, if you're in scope.
- **Your own ISMS-lite**: a risk register and an access model go a long way.

## Where it meets Solution Development

This is FitSD's signature move: **secure by design.** The Service Acceptance criteria for **Security**, **Access** and **Backup (tested)** are SA's hooks into every new service: security isn't reviewed after the fact, it's a condition of going live. Exceptions raised during design land in the SA exception register (FSD-SA-4). And at the *other* end of the lifecycle, retirement (FSD-RR-7) calls back on SA: access revoked and data securely disposed of when a service is decommissioned. *(Supplier / supply-chain assurance is its own capability, **FSD-SC**, closing NIS2 21(2)(d); see its card.)*

## The "shift left" lens

There's no single novel for this one, but the instinct is pure DevOps: security debt is unplanned work that hasn't happened yet. Designing controls in at Gate 2, rather than discovering them in an audit or an incident, keeps that work off the Run & Restore queue. It's the same flow argument the other cards make, pointed at risk.

## Maturity, briefly

- **0–1**: security considered case by case; no register, access by accretion.
- **2–3**: a live risk register, a least-privilege access model, tested backups.
- **4–5**: security designed into new work by default; exceptions rare, time-bound and tracked.

(Full 0–5 scale in the Charter, §7.)

## See also

- `FSD-PRO`: Solution Development (the SAC carries Security, Access and Backup into every service)
- `FitSD — Requirements` → FSD-SA section
- `FitSD — Standards Alignment`: ISO 27001 Annex A, NIS2 Article 21, FitSM PR6
- `reference/FitSD — Influences`: the canon behind the flow argument
