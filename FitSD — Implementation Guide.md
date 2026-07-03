---
title: "FitSD — Implementation Guide"
framework: FitSD
document: Implementation Guide
layer: Implementation
tier: "2–5 (cross-cutting)"
version: 0.3
type: implementation guide (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-07-01
tags: [fitsd, implementation, adoption, guide, standup, non-normative]
---

# FitSD — Implementation Guide

> **What this is.** The missing "how do we stand this up *here*?" layer. *FitSD — Adoption & Positioning* is the *why and who*; the *Quickstart* runs *one project* through the front door; this is how you turn that into the way your team takes on work — the standing management system. Non-normative: it adds no requirement. It walks the Tier 1 requirements and shows what "adopted" looks like in practice.

## When to use this

Use the **Quickstart** first — run one real piece of work through the gates and see whether FitSD helps. Come here when it did, and you want to make it the default (the "Adopt" rung of *Adoption & Positioning* §8). Standing FitSD up is a half-day of decisions, not a project. You are choosing where each requirement is met, not building new machinery — most of it points at processes you already run.

## The stand-up checklist

Work down the list once. Each step names the requirement it satisfies, so you can show conformance later.

### 1. Define your scope — *FSD-GV-1*
Write down which services are under management — what's in, what's out. A line, not a document. This is the boundary everything else sits inside.

### 2. Name the owners and the Approver — *FSD-GV-2, FSD-GV-6, FSD-SD-6*
Every service gets **one** accountable owner (roles may be shared; accountability isn't). Name who signs off gates and acceptance — the **Approver**. On a small team these collapse onto a couple of people; see *Roles on a small team* below.

### 3. Adopt the four forms — *FSD-SD-1…4*
Take the blank templates from `capabilities/solution-development/`: **Idea Brief** (FSD-FRM-00), **Gate 1** (FSD-FRM-01), **Gate 2** (FSD-FRM-02), and the **Service Acceptance Record** (FSD-FRM-03). Put copies where your team works. Set your **net-new effort line** at the same time — the estimated-effort threshold above which work counts as net-new and comes through the gates (`FSD-PRO §1`; about 10 person-days is a sensible default). From now on, net-new work comes through this door.

### 4. Ratify your SAC baseline — *FSD-GV-7*
This is the step teams skip and regret. The Service Acceptance Criteria are fixed *categories* but **your** *thresholds* — your availability target, your backup-test cadence, your continuity rule, what you count as a reportable incident. Open *FitSD — Service Acceptance Criteria*, fill the baseline template with your own values, and have the accountable owner **ratify** it. Now every solution inherits one known bar instead of rediscovering it at go-live.

### 5. Point Change, Incident and Security at what you already run — *the implementation profile*
FitSD ships a full process only for Solution Development. For **Change & Release (FSD-CH)**, **Run & Restore (FSD-RR)**, **Secure & Assure (FSD-SA)** and — where it applies — **Supplier & Supply Chain (FSD-SC)** it states the requirement and expects you to meet it with the policy you already have. Record *which* of your policies/tools meets each — that mapping is your **implementation profile** (below).

### 6. Stand up the registers — *FSD-GV-4*
Make sure the information stores exist in whatever tool you use (wiki, work-tracker, spreadsheet): the **demand / pipeline register**, the **service register**, and the **risk register** at minimum — plus the **supplier register** if FSD-SC applies to you. See *FitSD — Information Stores* for the full set — you don't need new tools, just named homes with owners.

### 7. Set the review cadence — *FSD-GV-5*
Pick when you'll review the system (and re-ratify the SAC baseline) — annually, or on material change. Tie it to a review you already hold rather than inventing a ritual.

## Your implementation profile

This is FitSD's answer to "are we actually conforming?" — a plain mapping of each requirement to the local thing that satisfies it. It is the **implementation profile** the Charter already names (*Charter* §8), *not* a Statement of Applicability — FitSD deliberately doesn't carry the certification apparatus (see *Standards Alignment*). Keep it light; a populated example will follow the published worked example.

| Capability | Requirements | Satisfied by (your local doc / tool / policy) | Owner |
|---|---|---|---|
| **Govern** | FSD-GV-1…7 | *e.g. your scope statement, doc register, this guide, the ratified SAC baseline* | |
| **Solution Development** | FSD-SD-1…6 | *FitSD's own process + the four forms (adopted as-is or adapted)* | |
| **Change & Release** | FSD-CH-1…4 | *your existing change/CAB process or ITIL / FitSM PR12* | |
| **Run & Restore** | FSD-RR-1…7 | *your incident-management policy; monitoring; patch process* | |
| **Secure & Assure** | FSD-SA-1…5 | *your infosec/risk practices; access reviews; backup scheme* | |
| **Supplier & Supply Chain** *(if applicable)* | FSD-SC-1…4 | *your procurement / supplier practice; the supplier register* | |

Go per-requirement (one row each) only if you want finer evidence — for most teams per-capability is enough to show the requirement is met and by what.

## Roles on a small team

FitSD names *functions*, not headcount (*Charter* §6). On a small team they collapse: one person is often **Management System Owner** *and* **Service Owner** *and* **Approver** across different services, with **Operators** and **Consulted SMEs** as needed. That's fine — that's the point of "one person, many hats."

Keep **one line uncrossed**: whoever built a thing shouldn't be its *sole* acceptance approver. It's the lightest segregation-of-duties that keeps NIS2/ISO honest — a second pair of eyes on "is this really done?" (The full role model — and reconciling the Solution Owner who drives the gates with the Service Owner who owns it live — is a planned Tier 3 document; see the *Roadmap*.)

**On a team of one** there is no second pair of eyes, and pretending otherwise helps nobody. The control that remains is the record itself: walk the acceptance criteria honestly, attach the evidence, date it, sign it — writing "not met" where it isn't met is what stands in for the reviewer. Borrow an outside pair of eyes where you can (a peer in another team, a trusted colleague); where you can't, the honest record is the bar.

## Where to go next

- **Mature.** The maturity self-check (Tier 5, planned) will score you 0–5 per capability and show the next notch. Until then, *Charter* §7 has the scale.
- **The worked example.** A real project run end to end — the honest source of SAC sample values and a filled implementation profile — is high on the *Roadmap*. This guide's blank templates get their worked counterparts when it lands.

## See also

- `FitSD — Adoption & Positioning` — the why and who (read alongside this)
- `FitSD — Quickstart` — run one project first
- `FitSD — Service Acceptance Criteria` — set and ratify your SAC baseline (step 4)
- `FitSD — Requirements` — the testable spine this walks
- `FitSD — Information Stores` — the registers step 6 stands up
