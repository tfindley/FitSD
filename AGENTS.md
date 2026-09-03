# Working in this repository (agents & assistants)

This repo is **FitSD** — a lightweight solution-development standard, written as Markdown.
It is a *standard*, not software: the deliverable is the text, and the text is governed.
Read this before editing anything.

## The one normative document

`FitSD — Requirements.md` is the **only** normative document — the testable "shall"
statements. Everything else is a charter, reference, guidance, or a reference
implementation (the process and forms under `capabilities/`). Changing a shall — adding,
removing, tightening, rewording one — is a **release-stream** change: it needs the
maintainer's explicit decision, a `[normative]` CHANGELOG entry, and eventually a version
bump per `FitSD — Versioning Policy.md`. Never change normative text as a side effect of
another task.

## Decide the stream before you edit

Three decoupled streams (`RELEASING.md`):

1. **Website** — lives in a separate repo (`fitsd-web`); nothing web-specific is committed
   here. (`web/` is a retired legacy tree awaiting deletion — don't edit it.)
2. **Spec errata** — typos, clarifications, guidance, reference docs. No version bump.
3. **Spec release** — normative change. Maintainer-driven.

The test: *could an adopter become conformant or non-conformant because of this change?*
If yes, it's normative.

## House rules (enforced by guards and review)

- **Reference the Service Acceptance Criteria by name, never by count.** No number-word
  before "SAC" or "criteria", anywhere. Run `bash scripts/check-sac-drift.sh`.
- **No version claims in prose.** Versions live in frontmatter, `VERSION`, `CHANGELOG.md`,
  the README and the Roadmap — nowhere else. Run `bash scripts/check-version-drift.sh`.
- **Define the SAC once** (`reference/FitSD — Service Acceptance Criteria.md`); process and
  forms reference the criteria by name and carry only their stage column.
- **Log changes as you go** in `CHANGELOG.md` under `## Unreleased`, in the same commit.
- **Every standard document opens with a `> **TL;DR** —` callout** (the capability cards
  and the four forms keep their own shared openers).
- **Cite numbered sections (`Doc §n`) only in documents with numbered headings** (Charter,
  FSD-PRO, Adoption & Positioning, Standards Alignment, Diagrams, the forms); cite
  everything else by heading name. Renumbering a heading means sweeping every citation.
- **Diagrams are duplicated deliberately** between `diagrams/FitSD — Diagrams.md` and the
  documents that embed them — change both copies in the same edit.
- **Frontmatter** on every tiered document: `tier`, `type`, `version`, `status`, `date`
  (semantics in *FitSD — Versioning Policy*, "Document markers").
- **British English**, and the voice is an asset: plain, second person, short declaratives,
  concrete metaphors. Edit for clarity, never flatten the voice.
- **Filenames use em-dashes** (`FitSD — Requirements.md`) — quote paths in shell commands.
- **No AI-attribution trailers in commits** (no `Co-Authored-By`/"Generated with" footers).

## Layout, briefly

Root `FitSD — *.md` = the framework layer. `capabilities/` = the one full process
(Solution Development: FSD-PRO + forms FRM-00…03) and one-page cards for the rest.
`reference/` = non-normative reference docs. The separate [`fitsd-validation`](https://github.com/tfindley/fitsd-validation) repo holds the repeatable
fitness-test suite and its run evidence (excluded from the guards — its records may
quote counts and cite versions). `llm/` = assistant/agent integration for *using* the
standard. `llms.txt` = the curated reading map for LLMs.

## If you are helping someone USE FitSD (not edit it)

Stop here and read `llm/README.md` — different job, different rules. The short version:
you may draft records and check evidence; you may never be the Approver, and you never
invent evidence or thresholds.
