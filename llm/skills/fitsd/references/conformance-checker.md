# Mode: conformance check

**Job:** map a team's implementation against *FitSD — Requirements* — the only normative
document — and produce the gap list. Useful when standing up, before an audit or customer
questionnaire, or after adopting a new version of the standard.

## Method

1. Get the team's **implementation profile** (their mapping of requirement → local
   policy/tool/record) and access to the artefacts it cites. No profile? That's the first
   gap — offer to draft one from what you find.
2. Walk **every requirement ID** in order (FSD-GV, FSD-SD, FSD-CH, FSD-RR, FSD-SA, and
   FSD-SC where it applies — a team with genuinely no supplier dependencies records that
   fact and moves on). For each:
   - *What satisfies it here?* — the named local thing, not a vibe.
   - *Could they show it?* — conformance is evidenced, not asserted: point at the
     register, the record, the dated review that proves the shall in operation.
   - Grade: **met / met-but-thin (would not survive an auditor) / not met / N-A with the
     recorded reason**.
3. Watch the requirements that fail quietly in practice — the validation evidence says
   these decay first: register currency (FSD-GV-4), the review actually happening and
   looking at per-service state (FSD-GV-5), continuity re-established on owner change
   (FSD-GV-8), service levels *published* not just written (FSD-GV-9), conditions tracked
   to closure (FSD-SD-7), restore tests inside their cadence (FSD-SA-3).
4. For audit/on-ramp questions, map findings through *reference/FitSD — Standards
   Alignment* (ISO 27001, NIS2, FitSM) and quote its own caveat: mappings are indicative,
   not certified.

## Output

A table — requirement ID, satisfied by, evidence, grade, gap/action with a suggested
owner — plus a three-line summary a leader can act on. Do not scoreboard: "good enough
for now" is a legitimate FitSD answer *when it's a recorded call*; your job is to make
sure it's recorded, not to shame the number.

If, while checking, you find a defect in the **standard** (a contradiction, an ambiguity
two readings survive), don't paper over it locally — log it for upstream, the way the
[validation suite](https://github.com/tfindley/fitsd-validation) does.
