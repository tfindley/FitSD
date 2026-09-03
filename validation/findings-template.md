# Findings template

Each seat writes one findings file: `{RUN}/findings/S<stage>-<seat>.md`. Log **both**
failures and successes — the review must be fair to the standard. One entry per finding,
numbered sequentially, in exactly this format:

```markdown
### [S<stage>-<SEAT>-<n>] <one-line title>
- **Kind:** gap | friction | ambiguity | worked-well
- **What I needed:** <the information, artefact, rule or role I was looking for>
- **What the standard gave me:** <what FitSD actually provided, with doc + section>
- **What I did about it:** <the local call made to proceed, if any>
- **Severity:** blocker | major | minor | praise
- **FitSD doc & section:** <e.g. FSD-PRO §7; reference/FitSD — Service Acceptance Criteria>
- **Suggested fix:** <optional — one line, e.g. "a thin shall", "a form field", "a Tier 3 role">
```

Severity guide:

- **blocker** — I could not perform my function from the standard alone; I had to invent
  something material.
- **major** — I proceeded, but a real team would plausibly get this wrong or skip it.
- **minor** — friction, wording, or a small missing convenience.
- **praise** — the standard actively helped here; say how, concretely.
