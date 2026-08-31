---
title: "FitSD — Influences"
framework: FitSD
document: Influences
tier: 0
type: explanatory (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-06-22
tags: [fitsd, reference, influences, devops, lean]
---

# FitSD — Influences

> **What this is.** Where the thinking comes from. FitSD is a service-management framework, but its instincts about *flow* are borrowed from the Lean and DevOps canon. This note records those debts. None of it is normative: you don't have to read a single one of these books to use FitSD. But if you've read them, you'll recognise the shapes.

## The short version

FitSD answers *what to control*. These books answer *why flow matters*. Put together: control the work coming in (so the team isn't drowned), prove it's ready before it ships (so it doesn't come back as a fire), and measure the flow honestly (so "fast" and "safe" aren't traded off against each other).

## The debts

**The Goal — Eliyahu Goldratt.** The Theory of Constraints: a system moves at the speed of its bottleneck, so find it, protect it, and don't flood it. FitSD's intake gates are a work-in-progress limit by another name, a throttle that keeps the team's constraint from being buried. *(See also Velocity — Jacob, Bergland & Cox, which folds ToC together with Lean and Six Sigma.)*

**The Phoenix Project — Kim, Behr & Spafford.** The Three Ways:

- *Flow* (left to right): small batches, work made visible. → the gates, and the gate-record portfolio view.
- *Feedback* (right to left): fast telemetry, swarm the problem. → Service Acceptance, the incident profile, the "learnings become new demand" loop (`FSD-RR`).
- *Continual learning*: a culture of improvement and safe experiment. → the maturity self-check and the review cadence (`FSD-GV`).

Its other gift is the *four types of work*, and the warning that **unplanned work** is the silent killer. FitSD's front door is partly a machine for dragging unplanned work into the light, where it can be seen and sequenced.

**The Unicorn Project — Gene Kim.** The Five Ideals are values, not process, and they line up with FitSD's principles: *Locality & Simplicity* ≈ minimum viable governance; *Improvement of Daily Work* ≈ a framework that exists to remove friction; *Psychological Safety* ≈ blameless reviews; *Focus, Flow & Joy* ≈ protecting the team's flow at the front door.

**Accelerate / DORA — Forsgren, Humble & Kim.** The four key metrics (deployment frequency, lead time for change, change-fail rate, time to restore) are the flow measures FitSD points at, mostly in `FSD-CH` and `FSD-RR`. They're the antidote to choosing between fast and stable: the best teams are both.

## Idea → where it lands in FitSD

| Idea | Source | FitSD element |
|---|---|---|
| Theory of Constraints / WIP limit | The Goal, Velocity | Intake gates as a throttle on work-in-progress |
| Flow, small batches, visible work | Phoenix (1st Way) | Gates, gate-record portfolio view, `FSD-CH` |
| Fast feedback, telemetry | Phoenix (2nd Way) | Service Acceptance, incident profile, `FSD-RR` |
| Continual learning, blameless | Phoenix (3rd Way), Unicorn | Maturity self-check, review cadence, `FSD-GV` |
| Unplanned work made visible | Phoenix | The front door / intake |
| The four key metrics | Accelerate / DORA | Metrics in `FSD-CH` and `FSD-RR` |
| Improvement of daily work | Unicorn (3rd Ideal) | Principle 1, and `FSD-GV` |

## A caveat

These shaped the thinking; they didn't dictate it. FitSD stays a lightweight governance framework, not a DevOps transformation programme. The canon is borrowed for its instincts about flow, not adopted wholesale. If your team wants the full cultural change those books describe, FitSD won't get in the way, but it isn't trying to be that.
