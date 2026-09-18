---
title: FSD-FRM-00 — Idea Brief
framework: FitSD
document_id: FSD-FRM-00
capability: Solution Development
tier: 4
type: form (reference template)
version: 0.4
status: draft
owner: Management System Owner
approver: Approver
governing_process: FSD-PRO
date: 2026-09-18
tags:
  - fitsd
  - solution-development
  - project-gates
  - form
  - idea-brief
  - intake
  - scqa
---

# FSD-FRM-00 — Idea Brief

> **The Idea Brief asks: is this worth a proper look?** One page: enough on paper to decide whether an idea earns a Gate 1 review. Fill it in and it reads in the order a reader needs: how things are, what's wrong with that, the questions that raises, and what you want instead. That's Barbara Minto's situation–complication–question–answer shape, in FitSD's own words, so the page also works read aloud as a two-minute pitch. **Don't design anything yet**; requirements, options and priorities come at the gates (Gate 1 makes the case, Gate 2 designs it). Once it's worth pursuing, this carries forward into Gate 1 (FSD-FRM-01) — and if you can already answer Gate 1's questions, go straight there; the brief is optional. Related demands may share one brief (the Gate 1 Approver decides whether they share a case). *(Form 00 — the optional pre-gate intake, before the numbered gates. Terms: see `FitSD — Definitions`.)* The live copy is held in the team's work-tracking system; this is the blank template.

## Header

| Field                              | Entry                                                        |
| ---------------------------------- | ------------------------------------------------------------ |
| **Working title**                  |                                                              |
| **Raised by**                      | *Who raised it: someone on the team, another team, or a third party / customer asking the team to take the work on* |
| **Date**                           |                                                              |
| **Demand source / primary driver** | *Where it came from and why: strategy, customer, compliance, risk, operational, finance/people; value / compliance / risk reduction* |

## 1. The brief

How things are, what's wrong with that, and what it costs to leave it. Keep it at thirty thousand feet. The detail comes at the gates.

| Field                            | Entry                                              |
| -------------------------------- | -------------------------------------------------- |
| **Current state**                | *How things are today, in a line. Just what's true; no verdict on it yet* |
| **Problem / gap**                | *What's the problem or gap this addresses, and why it can't be left as it is* |
| **Risks**                        | *What could go wrong if it's left alone, and anything obviously risky about doing it. A line or two. Gate 1 scores it and records it properly* |

## 2. Questions raised

Start with the question the brief exists to ask, and keep it open. *"How do we stop certificates expiring unseen?"* leaves room for options; *"should we buy tool X?"* has already picked one. Answer in outcomes. A named product is a Gate 1 option (FSD-FRM-01 §5), not an answer.

Add a row per question. The review will add its own and keep asking *why*, and those answers belong on the record rather than in someone's notes. Where the tool holding the live copy can't add rows, number the pairs in one field.

| Question                                | Answer                             |
| --------------------------------------- | ---------------------------------- |
| *The question this brief exists to ask* | *The outcome that would settle it* |
|                                         |                                    |

## 3. The outcome

What "done" would look like, and where its edges are. This is a first pass. Gate 1 sharpens it and Gate 2 fixes it.

| Field                            | Entry                                              |
| -------------------------------- | -------------------------------------------------- |
| **Outcome sought**               | *What would "done" look like — the outcome, not the design* |
| **In scope**                     |                                                    |
| **Out of scope**                 |                                                    |

**Service-quality expectations.** Name the standing **Service Acceptance baseline** as the quality bar this must eventually meet, and flag any project-specific emphasis, so quality shapes selection and design from the start, not just at acceptance. By reference only; don't re-specify it here. No baseline ratified yet? Say so and carry on. Name the bar you expect in the emphasis field; you need a ratified one by Gate 2, not to raise an idea.

| Field                              | Entry                                                        |
| ---------------------------------- | ------------------------------------------------------------ |
| **Applies the standing SAC baseline?** | Yes, see *FitSD — Service Acceptance Criteria* / None ratified yet |
| **Any project-specific emphasis**  | *e.g. this one leans hard on availability / continuity / a regulatory measure* |

## 4. Next step

| Field            | Entry                                        |
| ---------------- | -------------------------------------------- |
| **Recommendation** | Take to Gate 1 / Hold / Drop               |
| **Note**         | *One line on why*                            |
