# Run metadata — certhub / 2026-08

| Field | Value |
|---|---|
| **Run date (real)** | 2026-08-31 |
| **Standard under test** | `keystone` branch `readability` at commit `2c88669` (v0.3 unreleased, after the phase-1 consistency/readability pass, *before* any simulation-driven change) |
| **Scenario** | `../../scenario.md` (CertHub at Fernbrook Software — wholly fictional) |
| **Seats played by** | AI role-play throughout (Claude agents, one per seat, orchestrated per `validation/PROTOCOL.md`); no human seats this run |
| **Stages run** | S0, S1–2a, S2b, S3a, S3b, S4, S5a/b/c (parallel), S5d, S6, S7 (firewalled), S8 — 12 runs |
| **Firewall** | Held: S7 and S8 read `artifacts/` only; findings files were never shared between seats |
| **Outputs** | 16 in-world artifacts, 12 findings files, `findings/CONSOLIDATED.md`, `findings/NORMATIVE-CANDIDATES.md`, `REPORT.html` |

## Outcome

~110 findings → 10 converged themes. Dispositions: 27 reference-tier fixes applied
(commits `8bbe8ee`…`d5c977b`); normative package approved by the maintainer and applied
to the unreleased v0.3 as **FSD-GV-8** (owner transition / continuity re-verification),
**FSD-GV-9** (service levels & reporting), **FSD-SD-7** (conditions tracked to closure),
**FSD-SA-6** (key/secret management), plus note-level items (commit `3862314`); role
questions deferred to the Tier 3 guidepost; document-content guidance deferred to the
v0.4 worked example (BACKLOG).

## Notes for the next run

- The historical `artifacts/` here predate the v0.3 form changes this run caused — a
  re-run against the current standard should produce records with condition fields,
  register rows and operating-effort lines already in the templates. That delta is
  itself worth checking.
- All-AI seats share blind spots; put a human in S5b or S7 next time as a control.
- This artefact set is candidate seed material for the published worked example
  (Roadmap, v0.4): fictional, organisation-neutral, complete idea-to-succession.
