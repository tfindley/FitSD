---
title: "FSD-SC — Supplier & Supply Chain"
framework: FitSD
document_id: FSD-SC
capability: Supplier & Supply Chain
type: capability card
tier: 2
version: 0.3
status: draft
owner: "Management System Owner"
satisfies: [FSD-SC-1, FSD-SC-2, FSD-SC-3, FSD-SC-4]
date: 2026-07-04
tags: [fitsd, supplier, supply-chain, capability-card]
---

# FSD-SC — Supplier & Supply Chain

*Capability card. Your services stand on other people's software, hardware and contracts — know whose, on what terms, and how you'd get off them.*

> **What a capability card is.** A one-page orientation, not a process — what the capability is for, the requirements it carries, what to satisfy them *with*, and how it wires into Solution Development. FitSD authors a full process only for Solution Development; the rest are requirements plus a pointer.

> **The conditional capability.** Unlike the other five, FSD-SC applies only where services rely on suppliers or third-party dependencies the team is accountable for. In practice that's most teams — count the cloud, the SaaS and the support contracts — but if you genuinely have none, record that fact and move on.

## Objective

Know who you depend on, on what terms, and what happens when they fail, expire or get acquired. Small teams rarely fall to the exotic supply-chain attack; they fall to the mundane version — the licence that lapsed, the product that went end-of-life unnoticed, the "free tier" that quietly became load-bearing with no contract, no owner and no way out. The job is to keep every dependency deliberate: brought in through the front door, owned while it's live, and leavable.

## Scope

**In:** the supplier / dependency register, pre-adoption assessment, security and service expectations in agreements, the periodic review (support horizons, renewals, performance), and the exit path for critical dependencies.

**Out:** the intake mechanics themselves — Solution Development owns the gates; FSD-SC supplies the questions asked there. Day-to-day purchasing and finance operations also stay yours.

## Requirements it carries (Tier 1)

- **FSD-SC-1** — suppliers and third-party dependencies recorded, each with an accountable owner.
- **FSD-SC-2** — new suppliers and dependencies assessed for risk and suitability before adoption.
- **FSD-SC-3** — security and service expectations set in agreements where a supplier handles data or supports a live service.
- **FSD-SC-4** — dependencies reviewed periodically (EOL/EOS, renewals, performance), with an exit or replacement path understood for the critical ones.

## How to satisfy them

Met by your procurement and supplier-management practice — FitSD ships no separate process. Map onto:

- **ISO/IEC 27001 A.5.19–A.5.22** — supplier relationships, agreements, ICT supply chain, monitoring and review.
- **FitSM PR8 (Supplier Relationship Management).**
- **NIS2 Article 21(2)(d)** supply-chain security, if you're in scope.
- **Your own procurement habits** — a register with owners and renewal dates goes most of the way.

## Where it meets Solution Development

The front door *is* the supply-chain control. The FSD-SD-1 new-technology trigger drags every new tool, product or third-party dependency into intake **regardless of cost or effort**, and Gate 1's vendor due-diligence section (FSD-FRM-01 §6) asks the FSD-SC-2 questions — vendor, licensing, upgrade path, ownership, exit — before anything is adopted. At acceptance, the **Cost / licensing** criterion confirms licences and run-cost are owned, and the dependency lands in the supplier register (FSD-SC-1). At the far end of the lifecycle, the **renew** arm of FSD-RR-7 is a supplier decision — contract, licence, support horizon — fed by the FSD-SC-4 review.

## The dependency lens

Every adopted tool is a small standing liability: it must be patched, renewed, secured and one day replaced. That's the tech-sprawl story — the loft that fills with boxes, each one somebody's bright idea, none with an owner (see the *Roadmap*). FSD-SC is the standing half of the cure the front door starts: intake stops dependencies *arriving* unowned; the register and the periodic review stop them *staying* unowned as people move on.

## Maturity, briefly

- **0–1** — nobody can list what the services depend on; renewals and EOLs arrive as surprises.
- **2–3** — a register with owners; new dependencies assessed at intake; renewal dates watched.
- **4–5** — support horizons reviewed on a cadence; exit paths known for the critical dependencies; no unowned dependency in the estate.

(Full 0–5 scale in the Charter, §7.)

## See also

- `FSD-PRO` — Solution Development §1 (the new-technology trigger); `FSD-FRM-01` §6 (vendor due diligence)
- `FitSD — Requirements` → FSD-SC section
- `FitSD — Standards Alignment` — ISO 27001 A.5.19–A.5.22, FitSM PR8, NIS2 21(2)(d)
- `reference/FitSD — Information Stores` — the supplier register
- `capabilities/run-and-restore/FSD-RR — Run & Restore` — the renew decision at end of life (FSD-RR-7)
