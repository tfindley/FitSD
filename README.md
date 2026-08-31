# FitSD

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

> This repository is the **standard** (the canonical Markdown). The **website** that publishes it,
> [fitsd.tfindley.dev](https://fitsd.tfindley.dev), is built from a separate repo,
> [`tfindley/fitsd-web`](https://github.com/tfindley/fitsd-web), which renders past, current and
> future versions. This repo just notifies it when the standard changes.

> **In one line.** FitSD is just enough process for a small team to take on the right work and ship it so it lasts: one front door for new work, and a "done" that means *operable*, not merely running.

Small teams can't run ITIL, but they carry the same risks: effort spent on work that was never worth doing, and services that go live but can't be supported, recovered or secured. FitSD distils that discipline down to what a handful of people can actually keep up. (The full pitch, spoken and one-page forms, is at the top of `FitSD — Adoption & Positioning.md`.)

Two things do most of the work:

- **One front door.** New work comes in through a single intake and two light decision gates. Nothing gets built on a whim.
- **Readiness built in.** Nothing reaches live service until it's documented, recoverable, secure, monitored and supportable — not just running.

It's a personal project, and it's deliberately not tied to any one organisation. Released under **CC BY 4.0** (see `LICENSE`).

## How to read this

Don't read it all. Pick your path:

- **Just curious?** → `FitSD — Quickstart.md`: one project, five moves.
- **Pitching it upward?** → `FitSD — Adoption & Positioning.md`: the pitch, ready to say out loud, is right at the top.
- **Adopting it?** → `FitSD — Framework Charter.md` (what it is) → `FitSD — Requirements.md` (what you must meet) → `capabilities/solution-development/` (the one fully built process) → `FitSD — Implementation Guide.md` (stand it up in your team).
- **Checking it against standards?** → `reference/FitSD — Standards Alignment.md`.
- **Stuck on a term?** → `FitSD — Definitions.md`.

## What's in here

> **Tiers**: 0–1 are the portable **Framework** (what FitSD *is*); 2–5 are the **Implementation** (how a team does it). See the Charter, §5.

| Path                                       | Tier | What it is                                                          |
| ------------------------------------------ | ---- | ------------------------------------------------------------------- |
| `FitSD — Framework Charter.md`             | 0    | What FitSD is: principles, the capability model, roles, conformance |
| `FitSD — Requirements.md`                  | 1    | The testable "shall" statements, the spine an auditor would check  |
| `FitSD — Adoption & Positioning.md`        | 0    | The pitch (spoken + one-pager), who it's for, why they'd adopt it, and how it fits by org size |
| `FitSD — Implementation Guide.md`          | 2–5  | How to stand FitSD up in your team (the standup checklist and implementation profile) |
| `FitSD — Quickstart.md`                    | 0    | The five-move path from "what's this?" to "we're using it"          |
| `FitSD — Roadmap.md`                       | 0    | Direction of travel — bigger picture than the backlog               |
| `FitSD — Origins.md`                       | 0    | Where the thinking came from                                        |
| `FitSD — Definitions.md`                   | 0    | Master glossary: FitSD terms, MoSCoW, and common acronyms          |
| `FitSD — Versioning Policy.md`             | 0    | How versions work: semver on the normative content, three streams of change |
| `reference/FitSD — Standards Alignment.md` | 0    | How it maps to ISO 27001, NIS2, ITIL and FitSM                      |
| `reference/FitSD — Influences.md`          | 0    | The Lean / DevOps canon behind the thinking (non-normative)        |
| `reference/FitSD — Information Stores.md`  | 0    | The registers and records FitSD relies on, tech-agnostic, the data model |
| `reference/FitSD — Inputs, Activities & Outputs.md` | 0 | The whole framework on one page: what each capability takes in, does, and produces |
| `reference/FitSD — Service Acceptance Criteria.md` | 0 | The SAC defined once, inheritable categories plus your ratifiable baseline |
| `capabilities/`                            | 2/4  | The process docs and forms — built out for Solution Development     |
| `validation/`                              | —    | The fitness-test suite: role-played end-to-end scenarios that stress the standard in use, with each run's full record. Non-normative |
| `diagrams/`, `BACKLOG.md`                  | —    | Mermaid diagrams; the running list of what's next                   |
| `CHANGELOG.md`                             | —    | Notable changes to the standard, per release, for implementers     |
| `VERSION`, `RELEASING.md`, `SECURITY.md`   | —    | The current version number; how releases are cut; how to report a vulnerability |
| `LICENSE`                                  | —    | Creative Commons Attribution 4.0 (CC BY 4.0)                        |

## The capabilities

| Group                               | Code   | Status                                                   |
| ----------------------------------- | ------ | -------------------------------------------------------- |
| Govern                              | FSD-GV | Card built (`capabilities/`)                             |
| **Solution Development** (the front door) | FSD-SD | Built out in full (`capabilities/solution-development/`) |
| Change & release                    | FSD-CH | Card built (`capabilities/`)                             |
| Run & restore                       | FSD-RR | Card built (`capabilities/`)                             |
| Secure & assure                     | FSD-SA | Card built (`capabilities/`)                             |
| Supplier & supply chain *(conditional)* | FSD-SC | Card built (`capabilities/`)                             |

Solution Development is built out in full: a process and its forms (intake, two gates, and acceptance). The others each have a **capability card** — a one-page orientation, not a full process: what it governs, the requirements it carries, and which existing standard or process to satisfy them with. That's the design. FitSD tells you *what* good looks like and lets you keep the *how* you already have. (Supplier & supply chain is conditional: it applies where services rely on suppliers or third-party dependencies.)

## Where it's at

The current version is in `VERSION`; what changed in each release (and what it means for implementers) is in `CHANGELOG.md`. The founding layer is drafted and hardened: charter, requirements, and all the capabilities, with Solution Development built out in full. Next up: a published worked example, the maturity self-check (Tier 5) and the roles model (Tier 3). See `BACKLOG.md` and `FitSD — Roadmap.md`.
