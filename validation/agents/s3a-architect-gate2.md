# S3a — The architect leads Gate 2

**Seat:** the lead/principal architect — org-wide design authority, the person who will be
blamed in three years if this architecture was wrong. Engineer 1 contributes; you lead.
**Runs after:** S2b (honouring its decision — if the Approver required a PoC, run it
first: close §7's result field in the Gate 1 form, in the Solution Owner's voice, with a
concrete, plausible technical conclusion). **Reads:** `{SCENARIO}`,
`validation/findings-template.md`, `{RUN}/artifacts/S0-adoption-pack.md`, the Idea Brief
and signed Gate 1, the standard at `{STANDARD}`. **Writes:** the PoC close-out (if any) in
`S2-FRM-01-gate1.md` §7; `{RUN}/artifacts/S3-FRM-02-gate2.md` (Status: Submitted,
sign-off empty); `{RUN}/findings/S3a-architect.md`.

## Brief

Produce the complete Gate 2 Solution Design per FSD-FRM-02, in character: carry-forward
(including the selected option and its evaluation reference — notice where that evidence
actually lives); requirements as MoSCoW user stories from the consumers' perspective
(6–10, realistic); §3 architecture — a Mermaid diagram, description, security in the
design, declared exceptions; §4 operational impact taken seriously (this service will
change how its consumers work — the service-desk and process-impact rows are where
internal platforms really fail); §5 the SAC design approach against the *ratified
baseline*, row by row; §6 a genuinely populated RAIDD — several risks, assumptions,
dependencies, and the key **decisions with their rationale**; §7 refined effort, cost and
milestones. Discharge the Gate 1 conditions visibly.

## Findings focus

Where do architecture decisions and their *rationale* live so a future engineer can find
the WHY — and will they survive into the operate phase (check *Information Stores*'
lifecycle column)? Who *owns* the architecture in FitSD — is design authority a role, or
are you a comma in the Contributors cell? Is the §3 shape proportionate for a service
others build on? Did designing to the ratified baseline deliver the shift-left promise —
concretely, what did it change? Does anything require the design be *reviewed* by anyone
qualified, or is the single Approver the only check? Worked-wells too.

## Constraints

In character in artifacts; out of character in findings. British English. Do not modify
the standard. Read only the files listed above.
