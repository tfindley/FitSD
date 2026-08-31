---
title: "FitSD — Roadmap"
framework: FitSD
document: Roadmap
tier: 0
type: explanatory (non-normative)
version: 0.3
status: living
owner: "Tristan Findley"
date: 2026-08-31
tags: [fitsd, roadmap, plan]
---

# FitSD — Roadmap

> **TL;DR** — The direction of travel: the why and the where, bigger-picture than the `BACKLOG` (the task list). Rough on purpose; a personal project moves when it moves.

## Now (v0.2) — shipped

- The **Framework** layer (Tiers 0–1): the charter and the requirements.
- The five original capabilities: Solution Development built in full (process + its gate and acceptance forms); capability cards for Govern, Change & Release, Run & Restore, Secure & Assure. (The conditional sixth, Supplier & Supply Chain, lands in v0.3 below.)
- The supporting layer: adoption & positioning (which now opens with the pitch and one-page executive summary), standards alignment, influences, quickstart, definitions, diagrams, and a licence.
- **v0.2 hardening:** lifecycle completion (end-of-life review & retirement, FSD-RR-7), the **information-stores** layer (every register/record made explicit and tech-agnostic), the demand pipeline + retained history in FSD-GV-4, continuity in the Definition of Done, and the new-technology intake trigger.

## In progress

- **v0.3: in progress (this branch).** The Idea Brief becomes a canonical form (FSD-FRM-00); the SAC are reframed as inheritable principles with a ratifiable standing baseline (*FitSD — Service Acceptance Criteria*, new requirement FSD-GV-7); a business *Implementation Guide* lands; and the Solution Development forms/process are simplified (SAC defined once, referenced by name; carry-forward across the four forms). The **supplier / supply-chain capability (FSD-SC)** also lands: requirements plus a card, the conditional sixth, closing the NIS2 21(2)(d) gap. The changes were raised by dogfooding, a real project run through the framework end to end. Structure only. SAC *sample values* still wait on the worked example below.

## Next — v0.4: publish the worked example

One release, one deliverable. The framework has already been proven on a real project run end to end (the dogfooding that drove the v0.3 changes), so the shape works in practice. What v0.4 delivers is a *publishable* example: a project FitSD can tell in full, run through Idea Brief, both gates and Service Acceptance (real private runs stay private: FitSD carries no organisation's fingerprints, and that includes its examples).

It's the single highest-value missing piece: the Adoption doc (§8) argues a messy, real worked example persuades better than any amount of spec, and it's the only honest source for SAC sample values (see `BACKLOG`). Nothing else rides in v0.4 — evidence before more structure.

## Then — the unbuilt tiers

Two **Implementation**-layer tiers are named in the Charter (§5) but not yet built. The guideposts below say *what each is, what "done" looks like, and the calls to make before drafting* — not the drafts themselves.

### Tier 5 — Maturity self-check

**What it is.** A Tier 5 document (`FitSD — Maturity Self-Check`) that lets a team score itself 0–5 on each capability, see the resulting profile at a glance, and read off the *one notch better* next step. The Adoption doc (§8) frames it as the no-bureaucracy answer to FitSM's Foundation/Advanced/Expert ladder: "a compass, not a certificate." It's the last missing rung of the adoption journey.

**Why it's close to buildable.** Most of the raw material already exists: the generic 0–5 scale is in *Charter* §7, and every capability card already carries a "Maturity, briefly" thumbnail (0–1 / 2–3 / 4–5). The build is mostly *consolidation plus mechanics* — expanding those thumbnails into anchored per-level descriptors and adding a way to score and read the result.

**What "done" looks like.**

- A per-capability rubric (GV, SD, CH, RR, SA, SC) with concrete, observable descriptors for each level 0–5, not vibes. Anchor each level to evidence a team could actually point at.
- A scoring method and a one-glance output (a heatmap table or a Mermaid radar) showing the capability profile.
- Interpretation guidance that carries the Charter's principle through: nobody's expected to hit 5 everywhere; "good enough for now" is a valid score *if it was a deliberate, recorded call.*
- A worked self-assessment (ideally scored from the real worked example, once it exists).

**Calls to make before drafting.**

- **Granularity:** score per capability (light) or per requirement (precise)? Lean per-capability, using the Tier 1 requirements as the evidence prompts behind each score.
- **Output format:** heatmap table vs radar chart: pick what renders cleanly on GitHub *and* in Obsidian.
- **Cadence:** tie the self-check to the FSD-GV-5 review cadence rather than inventing a new ritual.
- **Evidence prompts:** give each level a "you can show…" cue so scoring resists self-flattery.

**Effort & sequencing.** Small–medium; much of it is consolidation. Realistically a single focused pass once the granularity/format calls are made. Sequenced **after the worked example** (v0.4): the example supplies a real sample score, and evidence outranks new structure until it's public.

### Tier 3 — Roles model

**What it is.** A Tier 3 document (`FitSD — Roles`) that makes the role model canonical: each role's purpose and responsibilities, the *authority* it carries (who may approve what, at what level of risk), and how the roles collapse onto a handful of people, without ever doubling up accountability. Principle 3 already states the spirit: "one person, many hats… but every service has exactly one accountable owner."

**Why it needs a guidepost first.** Unlike Tier 5, this one needs genuine design decisions, and there's an existing naming tension to resolve before drafting: *Charter* §6 names **Service Owner** and **Operator**; *FSD-PRO* §3 names **Solution Owner** and **Contributors**. Is the Solution Owner (drives the gates) the same accountability as the Service Owner (owns it once live), at two lifecycle stages? That has to be nailed down, not discovered mid-draft.

**What "done" looks like.**

- One reconciled role set, merging *Charter* §6 and *FSD-PRO* §3, each role with purpose, responsibilities, and the authority it holds.
- An explicit lifecycle hand-off: how the **Solution Owner** becomes (or hands to) the **Service Owner** at Service Acceptance. The register entry (FSD-GV-4) names the live Service Owner.
- A lightweight responsibility map (RACI or similar) across the capabilities' key activities — kept proportionate, not a matrix for its own sake.
- "One person, many hats" collapsing guidance with worked examples (e.g. who holds what on a 3-person team), plus the minimum that must *not* collapse (a builder shouldn't solely accept their own work: the light segregation-of-duties line that keeps NIS2 / ISO honest).

**Calls to make before drafting.**

- **Owner reconciliation:** Solution Owner → Service Owner as one accountability across stages (recommended), or two distinct roles with a hand-off?
- **Approver authority:** define risk/cost tiers for who must approve what, or keep the deliberately informal "single approver by default" of FSD-SD-6?
- **RACI granularity:** per capability vs per key activity: keep it light enough that a small team actually fills it in.
- **Minimum viable role set:** which roles are mandatory (Owner + Approver?) and which are optional or named-only on a tiny team.

**Effort & sequencing.** Medium: more design than Tier 5, and it touches existing docs (the Owner reconciliation ripples into FSD-PRO and the Charter). Light dependencies, but worth landing before or alongside Tier 5: the maturity self-check scores FSD-GV-6 (roles defined) and FSD-GV-2 (single owner), so a settled role model makes those scores meaningful.

### Also queued

- **SAC topic guidance / sample *values*.** The SAC are now defined once as inheritable principles with a blank baseline template (*FitSD — Service Acceptance Criteria*, v0.3). What remains deferred until the worked example lands is the *sample threshold values* and the per-criterion "how to write a good X criterion" notes — so the samples are real, not invented.

## Shape & scope — the sharp wedge

The direction on *what FitSD is, and isn't*: settled while scoping v0.3.

- **A sharp wedge, not a lean FitSM.** FitSD's value is the two things FitSM doesn't give you: a **front door** (intake + gates) and a **definition of done** (the SAC). Its leanness comes from how little it *builds*, one flagship process (FSD-PRO), not from a thin requirement set; the spine can require broad coverage precisely because it references out for everything but the front door. Keep it that way. The moment FitSD builds out a *second* full process, it's competing with FitSM on FitSM's turf and has lost its edge.
- **The SAC is a "service design baseline."** The standing SAC baseline (FSD-GV-7) is really a design-time standard every service is *designed to*: a Govern artefact, consumed by Solution Development. Worth naming that framing (in the Govern card and Definitions). Do **not** rename the framework to "Fit for Service Design". That over-claims ITIL's breadth and blunts the wedge. (Bundling design principles / documentation & tooling standards into the baseline is a possible later step; the light first move is just to name the concept.)
- **Honest gaps vs FitSM → thin requirements, not processes.** Two FitSM areas have no clean FitSD home today (*Standards Alignment* §2): **Service Level Management** and **Service Reporting**. Worth closing as thin `shall`s that reference out (see `BACKLOG`). Supplier landed as FSD-SC in v0.3.
- **Declared non-goals.** Full Configuration Management / CMDB, Customer Relationship Management, and capacity-as-a-discipline stay **out** — "use your existing practice." These are where "not too narrow" tips into ITIL weight.
- **The "Fit family."** FitSD is the first of a possible family of focused deep-dives over a broad-but-light frame, the pattern FitSM hints at. Deeper **Change & Release** and **Incident / Run & Restore** treatments are best written as **standalone candidate siblings** (e.g. *Fit for Change & Release*, *Fit for Incident Response*), wired into FitSD later through the existing FSD-CH / FSD-RR reference-out cards — *not* built into FitSD. If a second module becomes real, that's when to extract a shared core (see `BACKLOG`).

## Later — positioning and reach

Where FitSD earns a wider audience. One story in particular is worth telling.

**Controlling technology sprawl.** Startups and small teams accrue tools the way a loft accrues boxes. Every new thing solves a real problem the day it arrives, and then quietly becomes the permanent responsibility of the one or two people who put it in. Nobody owns it at the company level. Nobody wrote down what "supported" means. When those people move on, it turns into a haunted house: load-bearing software no one alive understands.

FitSD is, almost by accident, the cure. Its front door asks "is this worth taking on, and who owns it once it's live?" *before* the tool arrives. Its Definition of Done makes documentation, an owner and a support model conditions of going live, not afterthoughts. Its service register puts a name against every adopted technology. That's a sharp, relatable pitch (*stop your stack becoming a liability*) and a way to reach the startup audience who'd never open an ITSM standard but feel this pain every day.

Worth turning into a short article or positioning piece once the framework is public.

## Someday / maybe

- An open, GitHub-first release.
- A "FitSD in an afternoon" walkthrough, built on a worked example.
- Community contributions: more worked examples, more implementation profiles.
