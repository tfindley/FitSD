---
title: "FitSD — Versioning Policy"
framework: FitSD
document: Versioning Policy
tier: 0
type: explanatory (non-normative)
version: 0.3
status: draft
owner: "Tristan Findley"
date: 2026-08-31
tags: [fitsd, versioning, governance, releases]
---

# FitSD — Versioning Policy

> **TL;DR** — How FitSD is versioned, so a team can adopt, and conform to, a
> *specific* version and trust it won't move under them. Non-normative governance; it adds
> no requirements. Maintainers: the operational how-to is in `RELEASING.md`.

## The version is part of the standard

FitSD's version is declared in one place: the **`VERSION`** file at the root of the
repository (e.g. `0.2.0`). It is the single source of truth. The website does not invent a
version — it reads `VERSION` and publishes it. The standard drives the site, never the
other way round.

## What the numbers mean

FitSD uses semantic versioning (`MAJOR.MINOR.PATCH`) applied to the **normative**
content (the testable requirements and the model they hang off):

| Part      | Changes when…                                                                                                                                      | Example         |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| **MAJOR** | A normative change that could break conformance: a requirement is removed, tightened, or redefined so an existing adopter might no longer comply. | `1.0.0 → 2.0.0` |
| **MINOR** | A backward-compatible normative addition, a new requirement or capability that doesn't invalidate existing conformance.                           | `0.2.0 → 0.3.0` |
| **PATCH** | A correction with no normative effect: wording, examples, a clarified note that doesn't change what's required.                                   | `0.2.0 → 0.2.1` |

If a change doesn't touch the normative content at all (a typo in an explanatory page, a
diagram redraw, a website tweak) it does **not** need a new version. See the three
streams below.

## Document markers

Every tiered standard document carries three frontmatter fields (meta files —
`README`, `CHANGELOG`, `BACKLOG`, `RELEASING`, `SECURITY` — don't need them):

- **`version`** — the spec version the document was last revised for. It tracks content,
  not the release: only `VERSION` at the repo root names the current release.
- **`status`** — `draft` until the framework reaches v1.0; `living` for documents that
  update continuously between releases (the Roadmap, the Definitions, the Backlog).
- **`type`** — what kind of document it is: `normative` (the Requirements alone),
  `framework charter`, `explanatory (non-normative)`, `reference (non-normative)`,
  `implementation guide (non-normative)`, `capability card`,
  `process (reference implementation)`, or `form (reference template)`.

## Three streams of change, decoupled

Not everything that changes is a release. There are three independent streams:

1. **The website.** Styling, layout, search, build. Built by its own repository and versioned by
   its own number; never touches the standard. Ships continuously.
2. **Spec errata.** Typos, clarifications, rendering fixes to the *current* version — no
   normative effect. Applied to the current version without cutting a new one. **No version bump.**
3. **A spec release.** A normative change (new or altered requirements). This is the only
   stream that cuts a new version: the outgoing version is frozen, `VERSION` is bumped, and
   a tag is created.

This is the decoupling that keeps the standard stable: a stream of small corrections and
site improvements never forces, or masquerades as, a new version of the framework.

## Latest, and the frozen record

- **The current version is live.** The site root (`fitsd.tfindley.dev/`) always serves the
  current version; errata are published against it without cutting a new version.
- **Released versions are frozen.** When a new version is cut, the outgoing one is archived
  as an immutable snapshot, browsable forever at a stable URL (`…/0.1/`, `…/0.2/`) with a
  version switcher. A frozen version is never edited in place.

## Adopting a version

To adopt FitSD `vX.Y`, cite that version and work from its pages. A team that needs an
immutable reference (for an audit, a contract, or a conformance claim) should pin to a
**frozen** version — its URL and content will not change. The current/latest line is the
right choice for a team that simply wants the most recent guidance.

## Cutting a release (maintainers)

A release is a deliberate, reviewable act, not an automatic side effect of editing. The
maintainer runs the release script, which freezes the outgoing version, bumps `VERSION`,
and creates the tag for review before anything is published. The full procedure, and the
errata-vs-release decision, is in [`RELEASING.md`](https://github.com/tfindley/keystone/blob/main/RELEASING.md).
