---
title: "FitSD — Backlog"
framework: FitSD
document: Backlog
status: living
owner: "Tristan Findley"
date: 2026-06-23
tags: [fitsd, backlog]
---

# FitSD — Backlog

> **TL;DR** — Deferred ideas and improvements surfaced while building the framework, many from dogfooding it on a real project. Not yet scheduled; the bigger picture is the `Roadmap`.

## Framework tiers

- **Tier 3: Roles model.** Canonical role definitions, authority levels, and a light RACI across the capabilities; reconciles Solution Owner (FSD-PRO §3) with Service Owner (Charter §6). Guidepost in the `Roadmap`.
- **Tier 5: Maturity self-check.** The 0–5 capability self-assessment described in the Charter (§7). Most of the content already exists in the cards' "Maturity, briefly" thumbnails. Guidepost in the `Roadmap`.

## Principles

- **Openness / honest disclosure (candidate principle).** Consider whether FitSD should state a value of being open about how a service is built and run, its tooling, dependencies, and methods (including AI assistance), beyond the existing "documented & evidenced" bar. Surfaced while writing the site's AI-assisted disclosure: the page espouses openness, but FitSD's seven principles (Charter §3) don't name it. A deliberate call, not a quiet add — likely a normative change (see `Versioning Policy`).

## Solution Development

- **SAC sample *values* + topic guidance.** Per-criterion "how to write a good X criterion" notes and worked *threshold values*. The SAC *structure* shipped in v0.3 (defined once as inheritable principles + a blank baseline template); the sample values stay *deferred until a worked example has landed*, so they're real, not invented.
- **Operational-document content guidance.** A non-normative "what a runbook / HLD / recovery procedure minimally answers" appendix in the SAC reference — questions, not templates, matching the baseline's style; include "each procedure states who can execute it and where it hands off" and, for bespoke components, "where the source lives and how a successor makes a change". *(Simulation run, 2026-08: the standard mandates the documents exist, not what they contain — a stub titled "Runbook" passes the letter of acceptance.)*

## Adoption & reach

- **FAQ.** One page answering the questions an informed adopter actually asks: led by "**Why not just FitSM?**" (the answer exists but is scattered across the Roadmap's "sharp wedge" note and *Standards Alignment* §2), plus: is it certifiable, does it work for a team of one, what if we already run ITIL / a CAB.
- **SAC one-pager: the shareable atom.** Nobody adopts a framework from a README, but everyone copies a good checklist. A standalone "steal this Definition of Done" cut of the SAC as the marketing front door — it pulls people into the framework, not the other way round. Pairs with the tech-sprawl article (Roadmap, "Later").
- **CONTRIBUTING.md + issue templates.** `.github/` currently holds only the web workflows; a standard that asks for worked examples and implementation profiles back (Adoption §8, "Share") needs a contribution front door of its own.
- **Conformance checklist.** The Tier 1 shalls as a per-requirement tick-list with a "satisfied by" column, probably a website download generated from *Requirements*, not a new standard document (it would only restate the spine).

## Structure (deferred decisions)

- **Kebab-case filenames.** The em-dash names (`FitSD — Requirements.md`) hurt URLs, CLI use, cross-linking and contributor friction. Rename to plain kebab-case **during the web migration**, when links churn anyway. *(Decision 2026-07-03: deferred to the migration, not before.)*
- **Tier labels → document types (candidate).** The tier numbering strains at the edges: the Implementation Guide is "2–5 (cross-cutting)", FitSD itself authors docs labelled tier 2/4 inside the "per-team" layer, and the SAC reference is tier 0 yet non-normative. Consider standards-world labels instead: normative / guidance / reference implementation / meta. Churns every frontmatter; not before the worked example lands.

## Scope & the wider family

Direction set while scoping v0.3 (fuller narrative in the `Roadmap`, "Shape & scope"). Candidates and boundaries, not yet scheduled.

- **Declared non-goals.** Full Configuration Management / CMDB (FitSM PR11), Customer Relationship Management (PR7), and capacity-as-a-discipline stay out of scope — met by "use your existing practice." Now stated explicitly in *Standards Alignment* §2.
- **Shared core (only if the family grows).** FitSD currently double-hats as the umbrella frame (the capability groups + requirements spine + definitions, the `FSD-` prefix on everything) *and* the Solution Development deep-dive. If a second "Fit-" deep-dive (Change, Incident) becomes real, extract a shared core so siblings reference the frame rather than redefine it.

## Done (recent)

- ~~Owner transition / continuity re-verification (v0.3)~~ — **FSD-GV-8**: on a change of a live service's accountable owner, continuity is re-established and re-evidenced. The end-to-end simulation's headline finding (continuity was proven once, at acceptance, and decayed silently; the successor's "one change" verdict). *(2026-08-31)*
- ~~Service Level Management + Service Reporting (v0.3)~~ — **FSD-GV-9**: service levels (or explicit best-effort) agreed, recorded and *published* to each live service's customers, with performance reported at a cadence. Closes FitSM PR2 + PR3 in one thin `shall`; *Standards Alignment* §2 updated. *(2026-08-31)*
- ~~Conditions tracked to closure (v0.3)~~ — **FSD-SD-7**: gate/acceptance conditions carry an owner and target date, are tracked to closure, and breaches escalate to the approver who set them. The forms carry the fields; simulation evidence: of eleven acceptance conditions, three silently died. *(2026-08-31)*
- ~~Cryptography / key management (v0.3)~~ — **FSD-SA-6**: keys, secrets and certificates managed to a defined standard (generation, storage, rotation, revocation), evidence retained. Closes the self-identified NIS2 21(2)(h) gap; mapped to ISO 27001 A.8.24. *(2026-08-31)*
- ~~Per-service state in the GV-5 review~~ — note-level on FSD-GV-5 (register accuracy, open conditions, overdue evidence, EOL candidates; a missed review escalates) plus the Implementation Guide step-7 agenda. Deliberately not a tightened `shall`. *(2026-08-31)*
- ~~FSD-SC — Supplier / supply-chain capability (v0.3)~~ — requirements **FSD-SC-1…4** + capability card (`capabilities/supplier-supply-chain/`); the conditional sixth capability. Closes NIS2 21(2)(d); maps ISO 27001 A.5.19–A.5.22 / FitSM PR8; wired into the Gate 1 vendor due diligence and the FSD-RR-7 renew decision; supplier register added to *Information Stores*. *(2026-07-04)*
- ~~SAC as inheritable principles (v0.3)~~ — SAC reframed as standing, org-tunable categories with a ratifiable baseline (new `reference/FitSD — Service Acceptance Criteria`); new requirement **FSD-GV-7** (define & inherit the baseline); SAC now defined once and referenced by name across FSD-PRO/FRM-02/FRM-03 (drift cure). *(2026-07-01)*
- ~~Idea Brief becomes a canonical form (v0.3)~~ — **FSD-FRM-00**, a thin one-page intake; carries forward into Gate 1; closes the "no Idea Brief form" gap. *(2026-07-01)*
- ~~Business Implementation Guide (v0.3)~~ — new `FitSD — Implementation Guide` (stand-up checklist, implementation profile, minimal roles) — the "how do we stand this up here?" layer. *(2026-07-01)*
- ~~Gate 2 "selected option" field (v0.3)~~ — explicit "Selected option + evaluation reference" on FSD-FRM-02; plus §4/§5 Monitoring de-dup and FSD-PRO §4/§8 de-dup. *(2026-07-01)*
- ~~Lifecycle completion & information-stores layer (v0.2)~~ — FSD-RR-7 (end-of-life review & retirement); FSD-GV-4 broadened (demand pipeline + retained history); continuity added to the SAC; new-technology intake trigger + Gate 1 vendor due-diligence; new `reference/FitSD — Information Stores` + Diagrams §6; tier model reframed into Framework / Implementation layers. *(2026-06-23)*
- ~~Consistency pass (v0.1 review)~~ — added the sixth demand family (Finance & people) to the context diagrams; synced the Gate 2 "rework" edge label across both gate-flow diagrams; reconciled the "sixth capability" wording in Charter §4 with the FSD-SC plan; gitignored `.repowise/` and `.claude/settings.local.json`. *(2026-06-23)*
- ~~De-number the SAC~~ — removed the hardcoded count from prose and the `#` column; criteria referenced by name. *(2026-06-22)*
- ~~Split SAC "Monitoring, alerting & incident triggers"~~ — now **Monitoring & alerting** and **Incident profile** as separate criteria. *(2026-06-22)*
- ~~Compliance/risk driver in Gate 1~~ — primary driver + Risk/Compliance value lens. *(2026-06-22)*
- ~~Gate 2 timeline & effort element~~ — milestones + person-days by role (not FTE). *(2026-06-22)*
- ~~Service-level incident profile~~ — FSD-RR-6 + SAC criterion. *(2026-06-22)*
- ~~Capability cards for GV / CH / RR / SA~~ — one-page reference cards (objective, requirements, how-to-satisfy, SD hand-off, flow lens). Plus `reference/FitSD — Influences`. *(2026-06-22)*
