---
title: "FSD-GV — Govern"
framework: FitSD
document_id: FSD-GV
capability: Govern
type: capability card
tier: 2
version: 0.2
status: draft
owner: "Management System Owner"
satisfies: [FSD-GV-1, FSD-GV-2, FSD-GV-3, FSD-GV-4, FSD-GV-5, FSD-GV-6]
date: 2026-06-23
tags: [fitsd, govern, capability-card]
---

# FSD-GV — Govern

*Capability card. The connective tissue: scope, ownership, document control, and the habit of getting better.*

> **What a capability card is.** A one-page orientation, not a process: what the capability is for, the requirements it carries, what to satisfy them *with*, and how it wires into Solution Development. FitSD authors a full process only for Solution Development; the rest are requirements plus a pointer.

## Objective

Make sure there's actually a managed system here, not just a pile of activities. Govern is what turns "some people do some things" into "we know what services we run, who owns each one, where the documents live, and how we keep improving." Get this wrong and the other capabilities are disconnected motion.

## Scope

**In:** the management system itself — what's in scope, who owns what, how documents are controlled, the review cadence, the drive to improve.

**Out:** the actual service work. That belongs to the other capabilities; Govern just holds the frame around them.

## Requirements it carries (Tier 1)

- **FSD-GV-1**: the scope of services under management is defined and recorded.
- **FSD-GV-2**: every service has a single named, accountable owner.
- **FSD-GV-3**: governing documents are version-controlled, each with an owner, approver and review cycle.
- **FSD-GV-4**: a register of services, the demand pipeline, and key records is kept current, with completed and retired entries retained as history.
- **FSD-GV-5**: the management system is reviewed on a cadence and improved (PDCA).
- **FSD-GV-6**: roles are defined, including who may authorise what.

## How to satisfy them

There's no separate Govern process to install. These are met directly by how you handle scope, roles, documents and reviews. Map onto:

- **FitSM GR1–GR9** (the general management requirements).
- **ISO/IEC 27001 clauses 4–10** if you're heading toward certification.
- **Your own document-control and governance habits**, if they already hold.

## Where it meets Solution Development

Govern wraps the whole lifecycle. Three concrete touch-points: the **register** (FSD-GV-4) holds the demand pipeline (what's upcoming and in-flight), becomes the service register once a solution passes Service Acceptance, with a named owner (FSD-GV-2), and keeps retired entries as history. The **review cadence** (FSD-GV-5) catches services that have drifted from how they were accepted, and surfaces end-of-life candidates for the FSD-RR-7 renew / replace / retire decision. And the **information-stores view** (see *FitSD — Information Stores*) is Govern's map of every register and record, so data isn't kept without an owner.

## The improvement lens

Govern is home to the *Third Way* of *The Phoenix Project*: continual learning and experimentation. And to *The Unicorn Project*'s sharpest ideal — **Improvement of Daily Work is more important than daily work itself.** A small team's review cadence shouldn't be a box-tick; it's the one place reserved for fixing how the team works, not just what it ships. Keep it blameless and keep it cheap, or it won't survive contact with a busy week.

## Maturity, briefly

- **0–1**: things get done; scope, ownership and document versions are fuzzy.
- **2–3**: defined scope, owners and document control, with a review that actually happens.
- **4–5**: the review changes things; improvement is measured, not just minuted.

(Full 0–5 scale in the Charter, §7.)

## See also

- `FSD-PRO`: Solution Development (Govern frames its gates and feeds the service register)
- `FitSD — Requirements` → FSD-GV section
- `FitSD — Standards Alignment`: FitSM GR1–9, ISO 27001 clauses 4–10
- `reference/FitSD — Influences`: the canon behind the improvement lens
- `reference/FitSD — Information Stores`: the registers and records Govern keeps in order
