---
title: "FSD-CH — Change & Release"
framework: FitSD
document_id: FSD-CH
capability: Change & Release
type: capability card
tier: 2
version: 0.3
status: draft
owner: "Management System Owner"
satisfies: [FSD-CH-1, FSD-CH-2, FSD-CH-3, FSD-CH-4]
date: 2026-08-31
tags: [fitsd, change, release, capability-card]
---

# FSD-CH — Change & Release

*Capability card. FitSD governs change; it doesn't reinvent it.*

> **What a capability card is.** A one-page orientation, not a process. It says what the capability is for, which requirements it carries, what to satisfy them *with* (because here FitSD points at existing practice rather than authoring its own) and how it wires into Solution Development. Solution Development is the only capability FitSD builds out in full. The rest, this one included, are requirements plus a pointer.

## Objective

Keep changes to live services moving: quickly, in small batches, without breaking things. Change is where most outages are born, and where most teams pick the wrong poison: over-control until everything grinds to a halt, or under-control until they live in firefight. The job is to find the weight of control that's just enough, and no more.

## Scope

**In:** any change to a live service — config, code, infrastructure, a release.

**Out:** net-new services and significant new capabilities. Those come through Solution Development first and only hand the *build* changes back here. The dividing line is the scope test in `FSD-PRO §1`.

## Requirements it carries (Tier 1)

- **FSD-CH-1**: changes assessed for risk and impact before they happen.
- **FSD-CH-2**: authorised by someone appropriate to the risk (standard / normal / major).
- **FSD-CH-3**: recorded, and the significant ones reviewed afterwards.
- **FSD-CH-4**: releases deployed in a controlled, repeatable and, where feasible, reversible way.

## How to satisfy them

FitSD ships no change process. Use one you already have, or adopt an external one:

- **FitSM PR12 (Change Management) + PR13 (Release & Deployment)**: the closest lightweight fit.
- **ITIL 4 Change Enablement, Deployment, and Release Management**: if you already live in the ITIL world.
- **Your own CAB / change process**: if it works, keep it. FitSD only asks that FSD-CH-1…4 are met and you can show it.

## Where it meets Solution Development

This is the hand-off. When Gate 2 approves a build, the work isn't built *inside* Solution Development: the build and deployment changes are raised and run here, through FSD-CH. Two threads tie them together:

- Every solution that goes live becomes a thing that then gets *changed*. The change record is the ongoing story after Service Acceptance.
- The Definition of Done already expects a deployment that's repeatable and reversible, the same instinct as FSD-CH-4. The two reinforce each other.

## The flow lens

Change is the beating heart of *The Phoenix Project* for a reason: it's where flow lives or dies. Three ideas are worth stealing, and none of them needs a heavy process.

- **Small batches.** Many small, low-risk changes beat the occasional terrifying big one. Bias toward frequent and boring.
- **Make it visible.** A change you can see is a change you can sequence. The same gate-record habit FitSD uses at intake works for changes in flight.
- **The right weight.** Too much approval kills throughput; too little brings the 2 a.m. call. "Standard," pre-approved changes exist precisely so the routine stuff doesn't queue behind a board.

There's a deeper link, too. FitSD's whole intake model is *Theory of Constraints* in disguise: the gates are a limit on work in progress, so the team's constraint isn't drowned. Change is the same idea one step downstream: protect flow by controlling batch size and risk, not by piling on sign-offs.

**The metric that matters: change-fail rate** — the share of changes that cause a degradation or need remediation. It's one of the four **DORA** measures, alongside lead time for change, deployment frequency, and time to restore service. Watch those four and you're measuring flow the way *The Goal*, *Velocity* and *Accelerate* argue you should: fast *and* stable, not one bought at the cost of the other.

## Maturity, briefly

- **0–1**: changes happen; nobody's quite sure who approved what.
- **2–3**: a defined, followed change path, with pre-approved standard changes for the routine stuff.
- **4–5**: change-fail rate and lead time are watched, and trending the right way.

(Full 0–5 scale in the Charter, §7.)

## See also

- `FSD-PRO`: Solution Development, where build changes originate
- `FitSD — Requirements` → FSD-CH section
- `FitSD — Standards Alignment`: FitSM PR12/PR13 and the ITIL mapping
- `reference/FitSD — Influences`: the DevOps / Lean canon behind the flow lens
