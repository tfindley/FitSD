---
title: FSD-FRM-01 — Gate 1 Outline Proposal
framework: FitSD
document_id: FSD-FRM-01
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
  - gate-1
---

# FSD-FRM-01 — Gate 1 Outline Proposal

> **Gate 1 asks: is this worth doing?** Complete this record to bring an idea to the Approver for a decision. Keep it light — this is a filter, not a design. Sections 6–7 are conditional; most proposals skip them. **This record is the business case for the work**: the fundable proposal you take upward, at the right weight. *(Terms — CAPEX/OPEX, T-shirt sizing, MoSCoW: see `FitSD — Definitions`.)* The live copy is held in the team's work-tracking system; this is the blank template. Once approved, the content carries forward into Gate 2 (FSD-FRM-02).

## Header

| Field              | Entry                             |
| ------------------ | --------------------------------- |
| **Solution title** |                                   |
| **Status**         | Draft / Submitted / Decided (per §8) |
| **Solution Owner** | *(accountable for this solution; confirmed by the Approver at sign-off)* |
| **Contributors**   |                                   |
| **Linked Idea Brief (FSD-FRM-00)** | *(if one was raised)* |
| **Date**           |                                   |

## 1. Idea

*Carry forward from the Idea Brief (FSD-FRM-00) where one was raised, confirmed and firmed up as more is now known. If the work entered here directly, complete it fresh.*

| Field                     | Entry                                                                                                                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Overview**              | *What is the idea, in a sentence or two?*                                                                                                                  |
| **Customer**              | *Internal team or named customer(s)*                                                                                                                       |
| **Requirement / outcome** | *The gap we are plugging and the outcome sought. High-level scope. State whether this is a one-off requirement or the start of a service that must scale.* |
| **Benefits**              | *Internal and/or external*                                                                                                                                 |

## 2. Value and driver

**Primary driver:** _Value / Compliance / Risk reduction_. State which. For compliance- or risk-driven work the case rests on §4 (impact of doing nothing) and the cited obligation or risk record, **not** the value scores; low scores do not weaken a mandated case. (No standing record to cite? Raise one now and cite it — the proposal is often how the risk gets registered.) Score the lenses anyway, for prioritisation.

Score each lens **1–3** (1 = low, 3 = high). A priority signal, not a pass/fail.

| Lens                             | Score (1–3) | Evidence / note                                        |
| -------------------------------- | ----------- | ------------------------------------------------------ |
| **Growth:** new revenue, users or capability |  |  |
| **Retention:** keeps current users, or protects a service they rely on |  |  |
| **Efficiency:** saves time, cost or toil |  |  |
| **Risk & compliance:** reduces a risk or meets an obligation |  | *e.g. closes an exception, meets a regulatory measure* |

## 3. Effort (T-shirt estimate)

Size each as **S / M / L** with a short note. Remember to consider all aspects (monitoring, security, billing, support, and documentation), not just the build.

| Category   | Size (S/M/L) | Note                                      |
| ---------- | ------------ | ----------------------------------------- |
| **People** |              |                                           |
| **CAPEX**  |              | *Purchase / one-off costs*                |
| **OPEX**   |              | *Ongoing run / licensing / support costs* |

## 4. Impact and timing

| Field                       | Entry                                                                                                |
| --------------------------- | ---------------------------------------------------------------------------------------------------- |
| **Impact of doing nothing** |                                                                                                      |
| **Why now?**                | *The compelling event: a customer opportunity, a technology change, something on the critical path* |
| **When does this expire?**  | *A date or trigger to revisit the case. No clear date? Set a reminder for a quarter or two out.*                  |

## 5. Delivery options

| Option | Pros | Cons | Dependencies | Preferred? |
| ------ | ---- | ---- | ------------ | ---------- |
| #1     |      |      |              |            |
| #2     |      |      |              |            |

## 6. New technology / vendor *(complete if this brings in a new technology, tool, product or third-party dependency)*

Due diligence so a new dependency comes in through the front door, not the back. Fill this whenever the work adopts a new tool, product or supplier, **regardless of cost or effort** — and repeat the table for **each** new technology, tool or dependency the preferred option adopts. The quiet ones (a free tier going load-bearing) are the ones that matter most.

| Field                   | Entry                                                                            |
| ----------------------- | -------------------------------------------------------------------------------- |
| **New tech / tool?**    | Yes / No — what is being adopted                                                  |
| **Vendor & licensing**  | *Licence model and cost; the supplier, and how they've been to deal with so far* |
| **Upgrade path**        | *How and how often it's updated; its support / end-of-life horizon*              |
| **Support & ownership** | *Who owns and supports it once live*                                             |
| **Exit / alternatives** | *How we'd get off it if needed; alternatives considered*                         |

## 7. Proof of Concept *(optional — only if feasibility is still in doubt)*

| Field                    | Entry                                    |
| ------------------------ | ---------------------------------------- |
| **PoC needed?**          | Yes / No                                 |
| **Objective**            | *What question does the PoC answer?*     |
| **Success criteria**     | *How we judge it proved*                 |
| **Method & cost**        | *Where you'll run it, and what it costs* |
| **Resources & duration** |                                          |
| **Result / conclusion**  | *Completed after the PoC, before Gate 2* |

## 8. Sign-off

Sign-off confirms the Solution Owner and authorises progression to Gate 2 (or to a PoC first) — it commits design/PoC effort only; build and run costs are committed at Gate 2. Note any conditions (each with an owner and a target date).

| Field                   | Entry                                                     |
| ----------------------- | --------------------------------------------------------- |
| **Decision**            | Proceed to Gate 2 / Proceed via PoC first / Park / Reject |
| **Approver**            |                                                           |
| **Conditions / reason** |                                                           |
| **Notes** *(optional)*  | *Routing rationale, Solution Owner confirmation, actions taken with the decision* |
| **Date**                |                                                           |
