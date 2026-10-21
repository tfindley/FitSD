---
title: "FitSD — Validation & Test Guidance"
framework: FitSD
document: Validation & Test Guidance
tier: 0
version: 0.4
type: reference (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-10-21
tags: [fitsd, reference, validation, test, service-acceptance, sac, non-normative]
---

# FitSD — Validation & Test Guidance

> **TL;DR** — How to prove a solution does what it was agreed to do, proportionate to what it is. Companion to the **Validation & test** criterion: write testable criteria on the Gate 2 user stories, pick a rung on the ladder below to match the service's risk, and have someone other than the builder attest the pass. Non-normative — the binding "shall" is FSD-SD-5; the criterion itself is defined in *FitSD — Service Acceptance Criteria*.

## Why this criterion exists

Everything else in the Definition of Done proves a service can be **run**: documented, recoverable, secure, monitored, supportable. None of it proves the service **works**. Gate 2 captures what the thing is supposed to do — requirements as user stories, MoSCoW-rated — and without this criterion nothing ever looks at them again. A service can pass acceptance in full while quietly not doing the job it was funded to do.

This is not a test-management process. FitSD builds one full process, and that is the front door. What follows is a set of questions and a ladder, in the same spirit as the SAC baseline: you fill them with answers that fit your risk appetite.

## Write the criterion when you write the story

Validation starts at Gate 2, not at acceptance. A story with no stated criterion is a story nobody can sign off, because "done" is whatever the builder says it is on the day.

The plain form is **Given / When / Then**: *given* a situation, *when* something happens, *then* this should result. Keep it concrete enough that two people would agree whether it passed.

> *Given* a user with no active licence, *when* they request a certificate, *then* the request is refused and the refusal is logged with the reason.

Three habits make these hold up:

- **Observable, not internal.** "Then the cache is invalidated" is a design detail. "Then the next request returns the new value" is a criterion.
- **One assertion per story.** If the *then* has an "and" in it, you have probably written two.
- **Negative cases earn their place.** What should happen when the input is wrong, the dependency is down, or the user isn't entitled. These are the ones that bite in production.

Not every story needs the full form. A Could-rated nicety can say "demonstrated in the walkthrough" and move on. Musts should not.

## The proportionality ladder

Pick the lowest rung that an honest person would accept for the risk. Your baseline says which rung applies to which kind of service, so this is a decision made once rather than argued per project.

| Rung | What it is | Fits |
|---|---|---|
| **1. Demonstrated walkthrough** | Someone drives the service through each Must in front of a witness. Notes and a date are the record. | Low-risk internal tools; small changes; a team where the alternative is nothing |
| **2. Scripted pass** | A written list of steps and expected results, executed and recorded — who ran it, when, what happened. Repeatable by someone else. | Most services. The honest default for a small team |
| **3. Test pack** | Scripted coverage of every Must and accepted Should, with the negative cases, kept alongside the service and re-runnable at change. | Customer-facing services; anything where a regression is expensive |
| **4. Automated suite** | The pack runs in the pipeline; a failure blocks the release. | High change frequency; regulated or safety-adjacent work; anything deployed more often than a person would willingly re-test |

Climbing a rung costs real effort, and a rung too high gets skipped under pressure — which is worse than a rung honestly met. Rung 2 executed every time beats rung 4 aspired to.

## Who attests

A pass needs a name against it, and the name matters. The cheap, durable rule is the one FitSD already applies to acceptance: **the person who built it should not be the only person who signs that it works.** It is not distrust — it is that the builder's mental model is the thing under test, and they cannot see round it.

Your baseline settles who that second person is: a peer on the team, the requesting customer, the operator who will run it, or the Approver. For a service with a named requester, their sign-off is the strongest evidence available — they are the only person who can say the thing actually solves their problem.

**On a team of one** there is no second pair of eyes, and pretending otherwise helps nobody. The control that remains is the record: write the criteria down *before* you build, execute them afterwards, and record the result honestly, including what you couldn't prove. Borrow an outside reviewer where you can. Where you can't, the honest record is the bar — the same position the *Implementation Guide* takes on acceptance generally.

## Environment and data

A pass only means something if you say where it happened.

- **Which environment**, and how it differs from production. A pass in an environment with no load, no real integrations and an admin account proves less than it looks.
- **What data.** Synthetic data hides the shapes real data has. Where you must use copies of real data, say what was done about the parts that can't travel — the access and handling rules are a Security and Access question, not a testing convenience.
- **Where the environments themselves are recorded**: Gate 2 §4 already carries an *Environments* row. Validation evidence should point at it rather than describe it again.

## What counts as evidence

The acceptance record wants something a successor can read in two years. That means dated, linked, named — and complete.

- **Record failures beside the passes.** FSD-FRM-03 already asks for failed attempts and known thinness. A validation row showing a first run that failed, a fix, and a re-test that passed is *stronger* evidence than an unbroken green, because it proves the test can fail.
- **Say what you didn't prove.** A Must demonstrated in a staging environment with a stubbed dependency is a real pass with a real caveat. Write the caveat.
- **Point, don't paste.** Link the test pack or the run record; don't copy results into the form.

## Decay and regression

Validation evidence rots faster than most. It is a statement about a version of the service, and the service changes.

Proven at acceptance is not proven forever. The baseline may set when validation is repeated: on a material change, on a dependency upgrade, or on a cadence for services that change rarely but matter a lot. Re-validation at change belongs to **Change & Release** — FSD-CH-3's post-implementation review for significant changes is the natural home, and FSD-CH-4's "repeatable, and where feasible reversible" release is what makes re-running a pack cheap. Don't build a second mechanism for it here.

## What this criterion does not cover

One section, so the row doesn't become a dumping ground.

**Validation & test covers functional fitness** — does it do what was agreed. The non-functional bars have their own criteria and are proven there: performance and headroom under *Availability*, a test alert firing end to end under *Monitoring & alerting*, a restore actually performed under *Backup (tested)*, hardening and vulnerability posture under *Security*. If you find yourself writing "and we also load-tested it" in this row, the evidence belongs one row over.

**Usability** is deliberately out. Where a story's criterion is about whether someone can actually use the thing, write that as a Given/When/Then like any other requirement rather than reaching for a separate category.

## See also

- `reference/FitSD — Service Acceptance Criteria`: where the Validation & test criterion is defined and your baseline sets its bar
- `capabilities/solution-development/FSD-FRM-02` §2: the requirements table where criteria are written
- `capabilities/solution-development/FSD-FRM-03` §1: where the evidence lands
- `capabilities/solution-development/FSD-PRO` §7: Service Acceptance
- `FitSD — Definitions`: *Given / When / Then*, *MoSCoW*, *Validation & test*
- `capabilities/change-and-release/FSD-CH — Change & Release`: re-validation at change
