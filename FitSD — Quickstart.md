---
title: "FitSD — Quickstart"
framework: FitSD
document: Quickstart
tier: 0
type: explanatory (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-06-23
tags: [fitsd, quickstart, getting-started]
---

# FitSD — Quickstart

> The fastest path from "what's this?" to "we're using it." Written for one person on a small team who wants a win this week — not a rollout plan.

You don't adopt FitSD by reading it. You adopt it by running one real piece of work through the front door and seeing whether it helps. Here's the whole thing in five moves.

The shape, in one line: FitSD uses **two gates**: *is this worth doing?* (Gate 1) and *is it ready to build?* (Gate 2), then a final **Service Acceptance** check that it's proven ready to run.

## Before you start (5 minutes)

- Pick **one** real piece of upcoming work: something **net-new** (a new service, tool, or capability, not a routine change to something you already run). A tool to stand up, a service to replace, a capability to add.
- Grab the forms from `capabilities/solution-development/`: the Idea Brief (FSD-FRM-00), Gate 1 (Outline Proposal), Gate 2 (Solution Design), and the Service Acceptance Record.

## 1. Write the Idea Brief — half a day, tops

One page (there's a template, FSD-FRM-00). What's the problem, what would "done" look like, what's roughly in and out of scope. Don't design anything yet; you're just getting enough on paper to decide whether it's worth a proper look. (A public worked example, run end to end, is in the works.)

## 2. Take it to Gate 1 — one short conversation

Fill the Gate 1 form: the driver, a rough value/risk read, T-shirt effort, the options you can see, and the decision you're asking for. Put it in front of whoever says yes or no. They proceed, park, or reject. That decision, made on a page instead of in a corridor, is the first thing FitSD buys you.

## 3. Design it at Gate 2 — once Gate 1 says go

Now you design. Requirements, an architecture sketch with security in it, and the bit teams skip: how each acceptance criterion in your SAC baseline will actually be met — documentation, tested backup, access, monitoring, support, cost. If you can't yet say how you'll back it up or who'll support it, you've found the problem now instead of in six months.

## 4. Build it — through your normal change process

FitSD hands the build back to however you already ship. It doesn't replace your change process; it just made sure you knew what you were building, and why.

## 5. Accept it into service — the close-out that matters

Before you call it live, walk the Service Acceptance Record. Each criterion: met, with evidence? A *tested* restore, not a configured one. An alert that actually fired. A runbook someone other than you could follow. When it passes, it's a product with an owner — not a thing you'll quietly carry alone forever.

## That's the loop

You've run one service through the front door. If it helped (the Gate 1 conversation went better, or the acceptance check caught something), do it again with the next piece of work. That's adoption: one project at a time, never a big bang.

**Next:** the maturity self-check (once built) will tell you where you stand and what one notch better looks like. Until then, the capability cards in `capabilities/` show what else FitSD covers and what to point at for each.
