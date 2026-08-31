# Findings — Stage 7, Engineer 2 (Jordan Blake: succession, EOL review, CertHub 2.0 intake)

Out of character. Perspective: the successor who inherited a FitSD-run service nine weeks
after its builder left, with no handover, and had to (a) take over cold, (b) run the
FSD-RR-7/FSD-SC-4 end-of-life review when a supplier exit became real, and (c) raise the
replacement through the front door. This stage is the framework's pay-off test: nearly
everything FitSD makes teams write down is justified by an appeal to "the person who
comes after". I am that person. Verdicts below.

## The headline, before the entries

**Takeover verdict: I could operate the service from the record set alone — run-and-restore
cold, two exceptions (the key ceremony, the portal's code).** That is far better than any
real-world inheritance I have seen, and the credit divides cleanly: the *why* survived
because of the gates and one Approver-imposed condition (DEC7); the *how* survived because
of the SAC; the *who* very nearly did not survive at all, because FitSD proves continuity
exactly once and never asks again.

**Artefact ranking for a successor** (what actually earned its keep, in order):

1. **The HLD's standing decision log (DEC1–12).** The single most valuable page. Every
   "why is it like this?" question I could formulate was answered with evidence and dates
   — step-ca over Vault, the offline root, metadata-only, the failed-restore backup
   redesign. Crucially, this artefact exists because Dana made DEC7 a *condition of
   funding*, not because the standard required it (see entry 2).
2. **The runbook** — specifically its calibration content: "healthy looks like" columns,
   "propagation <5 min is normal", the banner property, the tier-1 lanes added after
   Rafi's review. Procedures I could run cold; several I had already run from it in anger.
3. **The recovery procedure + Restore Test Log** — trustworthy precisely because it
   records a *failure* (RTL-2026-013 → DEC9). A successor trusts a tested procedure and
   audits an asserted one; this one saved me the audit.
4. **The acceptance record's honesty** — the "honest notes" (five weeks of history, the
   declared ceremony gap, the explained two-week drift) told me exactly where the floor
   was thin nine months later. Its §2 conditions table became my takeover punch-list —
   and also the map of what had rotted (entry 4).
5. **The gate records** — read once each, for the why and the value case; I never needed
   them operationally, which is correct. Gate 1 §6a (the exit path) was the exception: it
   became the load-bearing clause of the whole EOL review (entry 6).
6. **The reviews and the annotated ticket log** — Rafi's dry-run review doubled as my
   orientation to how the service actually fails; the Feb ticket log was the only record
   of post-acceptance reality.

**Promised more than delivered:** the acceptance record's continuity row (true on the day,
decayed silently — the claim had no shelf life stated); the FRM-03 §2 conditions mechanism
(owners and dates, no enforcement — three of eleven rows quietly died); and the register
network — the records constantly cite registers (risk, supplier, service) that were only
as current as the last person who cared, and the person who cared left.

**What died with Priya, classified** (each loss: FitSD gap, or just life?):

| Loss | Verdict |
|---|---|
| Portal code knowledge — repo, build, debt, half-finished work | **FitSD gap** (entry 8): the SAC's documentation row is operator-shaped; nothing asks "can a successor *change* it?" |
| Ceremony competence in the operating pair | **Process gap** (entries 3–5): the drill was an accepted condition that rotted; nothing re-verified |
| Operational calibration ("that blip is benign") | **Mostly life**, and the runbook's calibration columns recovered more of it than any framework could demand |
| Verbal per-team migration promises | **Life.** No framework writes those down; FitSD's CRM non-goal is honest about it |
| Suppression-list confidence | **Mostly survived** — DEC11's reason+owner-per-entry discipline is exactly the right shape; only the confidence level behind reasons was lost |
| Renew/replace groundwork on RSK-031 | **Life with a gap edge** — a risk owned by a leaver has no handover rule either |

Net: of eight "only Priya" questions I listed in character, only three were truly
irrecoverable. Full FitSD compliance shrank the death toll dramatically; it did not
reach zero, and the residue clusters exactly where the standard is silent.

---

### [S7-ENGINEER2-1] The decision log made the takeover possible — and the standard never asked for it
- **Kind:** worked-well
- **What I needed:** as successor: why step-ca over Vault, why the offline root, why metadata-only, why CNPG over Velero — without re-litigating any of them.
- **What the standard gave me:** indirectly, everything: Gate 1's options table and §6 due diligence, Gate 2's RAIDD Decision rows, the PoC evidence convention. Directly, nothing standing: the RAIDD is a Gate 2/delivery artefact, and FSD-PRO's records are gate records that close with the project. The standing HLD §9 log exists only because the Gate 2 Approver invented DEC7 and made it a funding condition.
- **What I did about it:** nothing needed — I was the beneficiary. Reconstructed every architectural why from documents in an afternoon (takeover assessment §3).
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-02 §6 (RAIDD); FSD-PRO §4/§8 (system of record)
- **Suggested fix:** promote DEC7 from local invention to a thin shall — "decisions of record carry into the service's standing documentation at acceptance" (a one-line addition to the SAC Documentation row or FSD-SD-5).

### [S7-ENGINEER2-2] Continuity is proven once and never again — the standard re-tests backups, not people
- **Kind:** gap
- **What I needed:** something — anything — that forced the continuity evidence to be re-established between acceptance (Nov 2026) and the primary's departure (Jun 2027).
- **What the standard gave me:** SAC Supportability row and FSD-SD-5: continuity "assured" *at acceptance*. The SAC reference's threshold examples even name a "backup-test cadence" — recurrence is in the standard's vocabulary for data, never for people. Fernbrook's baseline locally added 6-monthly restore re-tests and quarterly access reviews, but nobody thought to make continuity recurrent, because nothing prompted the question "which of these rows decay?"
- **What I did about it:** in character, raised RSK-041 and proposed a baseline amendment at the June review. The walk-throughs dated Nov 2026 were the newest continuity evidence in the estate when I took over in Aug 2027.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability row, §20 threshold examples); FitSD — Requirements FSD-SD-5
- **Suggested fix:** the SAC reference gains a decay note: each criterion marked either "proven once" or "re-proven at a cadence the baseline sets" — with Supportability/continuity explicitly in the second class.

### [S7-ENGINEER2-3] No ownership-transfer or handover-on-departure trigger exists anywhere in the standard
- **Kind:** gap
- **What I needed:** when Priya resigned in May with a June leaving date, a rule that fired: handover conversation, re-dated walk-through for the successor, new deputy named, open continuity conditions re-examined, dual-control seats re-seated, owned risks reassigned.
- **What the standard gave me:** FSD-GV-2 (a named owner shall exist — it says nothing about the name *changing*); FSD-SA-2 (leavers lose *access* — the only leaver rule in the standard); FSD-RR-7 (fires at the *service's* end of life, not the owner's). The gap between "owner named" and "access revoked" is precisely where knowledge lives, and nothing in FitSD looks there. Fernbrook's local 10-working-day reassignment rule reassigns only the register entry — and even that lapsed for nine weeks.
- **What I did about it:** absorbed the cost: two days of archaeology, an eight-question list for a departed colleague, a ceremony drill fifteen months late.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements FSD-GV-2, FSD-SA-2; FSD-RR §Scope
- **Suggested fix:** a thin shall in FSD-GV: "on a change of the accountable owner of a live service, the acceptance-time supportability/handover evidence shall be re-established within a defined period" — the departure and the transfer are the same event seen from both ends.

### [S7-ENGINEER2-4] Post-acceptance conditions rot: the process ends at "Accepted" and nothing owns condition closure
- **Kind:** gap
- **What I needed:** the FRM-03 §2 conditions — especially row 3, the deputy ceremony drill, the exact control whose absence defined my first week — to actually close, or to escalate when they did not.
- **What the standard gave me:** FSD-PRO §7 offers two outcomes (Accepted / Remediation required) and its remediation table is for *unmet criteria*; "accepted with conditions" was a local repurposing, honestly flagged as such on the record. After acceptance the standard's machinery is BAU (FSD-CH, FSD-RR) plus an annual GV-5 review — nothing between them tracks a condition. Result, observable in the record: row 1 slipped nine weeks and produced a 2 a.m. page (CERTHUB-1219); row 3 slipped forever and produced me, un-drilled, inheriting the CA. A monthly agenda item is where conditions go to die politely.
- **What I did about it:** in character, audited all eleven rows and re-raised the survivors with owners and dates.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (outcomes); FSD-FRM-03 (no conditions field)
- **Suggested fix:** FRM-03 gains a conditions table (owner, date, closure authority) and FSD-PRO §7 a third legitimate outcome — "accepted with conditions, tracked to closure by the Approver" — since every real acceptance in this simulation used it anyway.

### [S7-ENGINEER2-5] The deputy mechanism half-worked — and failed for a reason the standard could have prevented
- **Kind:** gap
- **What I needed:** (the assigned question) an honest verdict on whether the deputy — a Fernbrook invention, not FitSD's — failed, and whether the standard could have saved it.
- **What the standard gave me:** the SAC continuity row ("not reliant on a single person") which Fernbrook operationalised as primary + deputy + dated walk-through. Verdict: **the mechanism worked at acceptance and decayed in service.** It genuinely worked: my Nov 2026 walk-throughs plus rota reps are why I could run the service cold in Aug 2027 — a deputy who had never touched the service would have been theatre. It failed at the tail for a structural reason: the mechanism verifies a *pair*, and nothing watches the pair. Primary left → deputy promoted → deputy seat empty → the baseline's own rule ("every live service has a named primary and deputy, walked through") went unmet with no alarm, because the rule is checked exactly once, at acceptance. The standard could have prevented the tail failure — not the resignation, but the silent decay — with the re-verification shall from entries 2/3: it would have fired at the missed Q1 drill (cadence) and again at the ownership change (event).
- **What I did about it:** named it explicitly in the takeover assessment; deputy re-established as week-3 work.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability); local: Adoption Pack §4 Supportability row
- **Suggested fix:** same as entry 2 — one fix covers both; the deputy pattern itself is worth naming in the SAC reference as an example continuity threshold, since Fernbrook had to invent it.

### [S7-ENGINEER2-6] FSD-SC-4's exit-path question, asked in 2026, paid out in full in 2027
- **Kind:** worked-well
- **What I needed:** when the supplier exit became real (step-ca OSS patch cliff), a way off that wasn't a rebuild.
- **What the standard gave me:** the chain worked end to end, and it is worth spelling out because it is the strongest vindication of the standard in this exercise: FSD-SD-1's new-tech trigger forced step-ca through Gate 1 → FRM-01 §6's due-diligence table asked "exit / alternatives?" → answering it honestly produced DEC2 (ACME everywhere, never proprietary APIs) as a *design commitment* → eleven months later the real EOL lands as a bounded succession: the consumer surface (eight teams' `ClusterIssuer` configs) does not change, the inventory/portal are backend-agnostic, and the Idea Brief practically wrote itself from Gate 1 §6a. Dana's Gate 2 sign-off even predicted the mechanism: "we rent the CA, not marry it." Without that 2026 question, the 2027 announcement is a crisis; with it, it is a procurement decision with a comfortable fuse.
- **What I did about it:** ran the FSD-RR-7 review in a morning; recorded replace-with-renew-as-option; raised the front-door case.
- **Severity:** praise
- **FitSD doc & section:** FSD-SC §Where it meets Solution Development; FSD-FRM-01 §6; FitSD — Requirements FSD-SC-4, FSD-RR-7
- **Suggested fix:** none — this is the standard doing exactly what it claims.

### [S7-ENGINEER2-7] The tested-restore requirement compounds: a proven procedure is inheritable, an asserted one is not
- **Kind:** worked-well
- **What I needed:** to trust a recovery procedure whose author I could not ask.
- **What the standard gave me:** the SAC Backup row's "test restore performed, dated, with evidence". Because the first test *failed* and the failure was recorded (RTL-2026-013 → DEC9 → re-test passed), the procedure I inherited had been through the only review that matters. The unexpected successor-side benefit: executing the restore is also the best available training now the author is gone — the requirement quietly created a rehearsal script for exactly my situation. (The counterpoint feeds entry 2: the *cadence* that would have kept it fresh was Fernbrook's local addition, and it still slipped once nobody owned it.)
- **What I did about it:** made re-running the overdue restore my week-2 action, as both compliance and training.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §7 (Backup row); reference/FitSD — Service Acceptance Criteria
- **Suggested fix:** none for the requirement; the cadence question is entry 2's.

### [S7-ENGINEER2-8] The SAC is operator-shaped: nothing asks whether a successor can *change* the service
- **Kind:** gap
- **What I needed:** for the one bespoke component (the portal), the things a maintainer needs: source repo, build/release pipeline, test state, dependency-update process.
- **What the standard gave me:** the Documentation row names HLD, runbook, recovery, SOPs, user guide — all operating documents. CertHub met every one, and yet the record set never names the portal's source repository. The service is fully *operable* and partially *unmaintainable*: Trivy keeps finding base-image issues that someone must patch in code nobody living has worked on. Gate 2 §3 even flagged "bespoke code the team will own" as a design exception — the standard let the risk be recorded and then never asked for the artefact that mitigates it.
- **What I did about it:** portal source audit added to the 30-day plan; RSK-044 raised.
- **Severity:** major (minor for most services; major wherever acceptance admits bespoke code)
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Documentation row); FSD-PRO §7
- **Suggested fix:** one clause on the Documentation row: "for bespoke components: where the source lives, how it is built and released, and how a successor makes a change".

### [S7-ENGINEER2-9] FSD-RR-7's three arms arrive before you can honestly pick one
- **Kind:** ambiguity
- **What I needed:** to record the renew/replace/retire decision the requirement demands, on the day the EOL trigger fired.
- **What the standard gave me:** FSD-RR-7: "a decision shall be recorded — renew, replace, or retire". But at trigger time the renew-vs-replace choice *is* Gate 1's options question (pricing the commercial edition against alternative backends) — the machinery for answering it lives one door down. I recorded "replace, renew retained as a Gate 1 option, retire rejected" and felt I was bending the form; really the recordable decision at EOL time is "not retire — route to the front door". The capability card half-knows this (the replace arm "routes back through the front door as fresh demand"; the renew arm is "fed by the FSD-SC-4 review") but the requirement's wording implies a three-way pick at a moment when only the one-way rejection is honest. Credit where due: the Adoption Pack's EOL column on the service register (a FitSD-prompted habit) gave the decision a home — without it I'd have had nowhere to put it.
- **What I did about it:** recorded the decision shape as above; findings-flagged.
- **Severity:** minor
- **FitSD doc & section:** FitSD — Requirements FSD-RR-7; FSD-RR §Where it meets Solution Development
- **Suggested fix:** a note on FSD-RR-7: "the decision may legitimately be recorded as 'not retire — succession routed to Solution Development', with the renew/replace arm settled at Gate 1".

### [S7-ENGINEER2-10] The Idea Brief gives no steer on bundling accumulated demand with a forced succession
- **Kind:** friction
- **What I needed:** to know whether CA succession, SSH-cert support and the second region are one Idea Brief or three. They share a service and a sensible delivery window (change the backend once); they have three different drivers, three different evidence bases, and two of them trip FSD-PRO §1 independently.
- **What the standard gave me:** FRM-00 is "one page: is this worth a proper look?" — singular by construction; FSD-PRO §1's triggers classify each item but say nothing about aggregation. Stage 5's PM review predicted this exact queue-shape problem (enhancements accumulating with no home); a year on, the accumulated demand duly arrived stapled to an EOL event.
- **What I did about it:** one brief, succession as primary driver, the demand named as riders, with an explicit note that Gate 1 owns the split decision — and a confidence note flagging that the SSH/second-region demand is pressure, not records.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-00; FSD-PRO §1, §5
- **Suggested fix:** one line in FRM-00 or FSD-PRO §5: related demands may share a brief; the Gate 1 Approver decides whether they share a case.

### [S7-ENGINEER2-11] Acceptance-time honesty is the highest-yield content for a successor — and the standard permits it without requiring it
- **Kind:** worked-well
- **What I needed:** to know where the floor was thin, nine months after everyone stopped looking.
- **What the standard gave me:** an evidence-based acceptance (FSD-PRO §7: proven, with evidence) that this team used to record *against interest*: the failed restore, the five-week history, the deputy's declared ceremony gap, the two-week schedule drift with causes. Every one of those honest notes was a signpost I used in week one — the declared ceremony gap was literally the headline of my takeover risk. Contrast the alternative: a greenwashed FRM-03 would have cost me days of false confidence. The standard's evidence culture *enables* this; nothing in it *requires* recording the near-misses (a form full of "Y" with clean evidence would also conform).
- **What I did about it:** continued the convention (the takeover assessment and Idea Brief both carry declared-hedge sections).
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §7; FSD-FRM-03
- **Suggested fix:** optional: FRM-03 evidence guidance gains "record failed attempts and known thinness alongside the pass — the successor reads this table before anything else".

### [S7-ENGINEER2-12] Risks owned by a person have no leaver rule either
- **Kind:** gap
- **What I needed:** RSK-031 (smallstep health — the exact risk that fired in August) had owner Priya and a June review date. She left in June. When the trigger fired in August, the register's owner column pointed at nobody.
- **What the standard gave me:** FSD-GV-4 keeps registers "current"; the Information Stores name owners per entry; nothing connects a leaver to the entries they own — same blind spot as entry 3, one level down. The June review (GV-5) should have caught it; the review fell exactly in the departure window, and I can find no evidence it looked.
- **What I did about it:** re-owned it in character (RSK-043); flagged the register-orphaning pattern to the MSO.
- **Severity:** minor (major in aggregate with entry 3 — it is the same missing event)
- **FitSD doc & section:** FitSD — Requirements FSD-GV-4; reference/FitSD — Information Stores
- **Suggested fix:** covered by entry 3's owner-transition shall if it extends to "entries and risks owned by the leaver".

### [S7-ENGINEER2-13] The ONE change that would most have improved my first week
- **Kind:** gap (synthesis — the exercise's direct question)
- **What I needed:** choosing one: **an owner-transition requirement — when the accountable owner of a live service changes or leaves, the supportability/handover evidence is re-established within a defined period.**
- **What the standard gave me:** nothing between "owner named" (GV-2) and "leaver's access revoked" (SA-2). I weighed the alternatives: the decision-log shall (entry 1) Fernbrook improvised locally, so a good Approver can rescue it; the conditions machinery (entry 4) decays slower; the maintainability clause (entry 8) bites only bespoke code. The owner-transition rule is the one that, on 2027-05-something when Priya resigned, would have mechanically produced everything my first week lacked: a handover conversation while she was still in the building, a re-dated walk-through, a named new deputy, re-seated dual-control credentials, reassigned risks, and a re-examination of the open continuity conditions — six failures, one trigger. It is also the cheapest kind of FitSD rule: a thin shall firing on a rare, unambiguous event.
- **What I did about it:** everything in the 30-day plan is this rule, executed by hand, two months late.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements FSD-GV (new); touches FSD-SD-5, reference SAC Supportability
- **Suggested fix:** "FSD-GV-8: when the accountable owner of a live service changes, continuity **shall** be re-established and re-evidenced (handover, successor walk-through, deputy/cover, transferred register entries) within a period the organisation defines." One sentence; it was the whole of this stage's pain.

### [S7-ENGINEER2-14] Fairness statement: this record set is far better than a real company's, and the standard is most of the reason
- **Kind:** worked-well
- **What I needed:** (the exercise asks for honesty about this) a baseline comparison.
- **What the standard gave me:** at a typical shop, this takeover is: a wiki page two years stale, a monitoring stack nobody documented, credentials in the leaver's head, and "why is it like this?" answered by nobody. Here: I read in over two days along a path the records themselves signposted; every architectural why was answered with evidence; the procedures had been executed by their author and by me; the failure modes were written down with calibration; and the EOL event had a pre-built escape route. The mechanisms responsible are FitSD's: the gates forced the case and the options onto paper before the build; the SAC forced the operational artefacts to exist *as a condition of going live* rather than as good intentions; the new-tech trigger forced the due diligence that became the exit path. The local team improved on the standard repeatedly (DEC7, condition-discharge sections, breadcrumb notes, honest evidence) — but they improved on a floor the standard built. The failures logged above are real and clustered on one theme (nothing re-verifies people); they should be read against a takeover that, overall, the framework can fairly claim as a success.
- **What I did about it:** said so, in character and out.
- **Severity:** praise
- **FitSD doc & section:** the system as a whole; FSD-PRO; reference/FitSD — Service Acceptance Criteria
- **Suggested fix:** none.
