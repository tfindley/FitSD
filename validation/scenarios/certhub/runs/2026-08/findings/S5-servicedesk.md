# Stage 5 findings — service desk analyst (Rafi Osman, tier 1/2 operator)

Reviewer notes, out of character. Perspective: the front-line operator whose acceptance
the Supportability/handover criterion requires. Method: read the standard only as far as a
desk analyst realistically would (SAC reference, FSD-PRO §7, FSD-RR card, Definitions),
then dry-ran three runbook procedures (§5.1, §5.2, §5.3) plus SOP-1 on paper as tier 1/2.

### [S5-SERVICEDESK-1] "Accepted by operators" names an actor the standard never defines
- **Kind:** gap
- **What I needed:** to know whether *I* — tier 1/2 service desk — am an "operator" whose acceptance FSD-PRO §7 requires, or whether that means the platform engineers who hold kubectl.
- **What the standard gave me:** FSD-PRO §3 defines exactly three roles (Solution Owner, Approver, Contributor). "Operator" appears in no role list and has no Definitions entry — the word exists only inside the SOP definition ("accepted by operators") and the FSD-PRO §7 Supportability row. The Tier 3 roles model that would settle this is roadmap-only (FitSD — Roadmap, "Tier 3 — Roles model"; README confirms unpublished).
- **What I did about it:** relied on Fernbrook's local invention: the Adoption Pack §2 role table added an "Operator" row naming platform engineers *and* the desk analyst. Without that row I could not have said whether my sign-off was required or merely polite.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §3, §7; FitSD — Definitions ("SOP"); FitSD — Roadmap (Tier 3)
- **Suggested fix:** a Definitions entry for Operator (interim), superseded by the Tier 3 roles model — which should include first-line support, not only engineers.

### [S5-SERVICEDESK-2] No evidence bar for what operator acceptance *is*
- **Kind:** gap
- **What I needed:** what act constitutes "runbook and SOPs accepted by operators" — a walk-through? a dry run? a dated signed record? Can I accept with conditions?
- **What the standard gave me:** the bare phrase in FSD-PRO §7 and the SAC Supportability row. Nothing on form, evidence, or timing. Contrast the same table's other rows, which are exacting about evidence ("a test restore performed, **dated**, with evidence attached"; "a test alert **observed end-to-end**"). Operator acceptance has no equivalent bar.
- **What I did about it:** in-simulation, FRM-03 recorded me as having "formally accepted" at a review meeting (2026-11-17) before any written operator review existed; the written record exists only because Marcus asked for it afterwards. Had nobody asked, the FRM-03 "Y" would look identical. My review also had to invent "accept with fixes" as a verdict — the standard offers operators no conditional-acceptance mechanism the way gates get "approved with conditions".
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Supportability row); reference/FitSD — Service Acceptance Criteria
- **Suggested fix:** one line matching the sibling rows' pattern: "accepted by the named operators in a dated record, following a walk-through or dry-run" — dated, named, evidenced, conditions permitted.

### [S5-SERVICEDESK-3] First-line support is invisible: FitSD never distinguishes the desk from operations
- **Kind:** gap
- **What I needed:** the standard's view of who takes the first call — tier 1 desk vs the engineers who run the service — and what a "support model" must minimally contain (hours, response targets, first-contact route, escalation path).
- **What the standard gave me:** the SAC reference lists "The support model" as a threshold prompt with no minimum contents; FSD-RR speaks of incidents "detected, recorded, prioritised and resolved to targets" (FSD-RR-1) without saying by whom; "service desk" appears nowhere in the requirements or definitions. The support hours and response targets I could quote to a user (09:00–17:30, Sev1 15 min…) exist solely because Fernbrook's baseline row wrote them.
- **What I did about it:** proceeded on the Fernbrook baseline. But this worked because Owen was in the adoption workshop; a smaller adopter could write "support model: the team" in that cell and pass acceptance with no hours, no first-contact route and no named front line. A related symptom: alert routing (Opsgenie/Slack) bypasses the desk entirely and nothing in the standard prompts anyone to ask where tickets — as opposed to alerts — enter.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability row); FSD-RR-1
- **Suggested fix:** a prompt list in the SAC Supportability cell: *hours; response targets by severity; who takes the first contact; escalation path and cover* — questions, not numbers, consistent with the SAC's no-defaults stance.

### [S5-SERVICEDESK-4] Nothing asks "executable by whom?" of the runbook
- **Kind:** gap
- **What I needed:** runbook procedures I could actually execute with tier-1 access, or at least explicit stop-and-hand-off lines telling me where my lane ends.
- **What the standard gave me:** the Documentation criterion requires a runbook to *exist* and Supportability requires operators to *accept* it, but nothing prompts for per-step actor or access. Result in-simulation: a runbook whose procedures open with kubectl/bastion/AWS steps the named tier-1 operator cannot perform (my §5.1 and §5.2 dry-runs both stalled at step 1 — no cluster access, no portal inventory group for the desk). The artefact I would genuinely work from — the triage guide — is a Fernbrook invention with no FitSD home: not one of the five mandatory documents, unversioned, outside the acceptance set.
- **What I did about it:** wrote the required-fixes list (desk access pack; tier-1 lane marked per procedure; escalation hours/cover) into the operator review and made acceptance conditional on it. A team without a bloody-minded analyst would have signed and discovered this during the first live incident.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Documentation, Supportability rows); FSD-PRO §7
- **Suggested fix:** add "each procedure states who can execute it and where it hands off" to the Documentation prompt — the cheap fix that would have forced the access gap out at Gate 2 instead of at the desk.

### [S5-SERVICEDESK-5] Definitions and the Documentation criterion disagree about what an SOP is
- **Kind:** ambiguity
- **What I needed:** to know what set of documents my acceptance covered — is the runbook the SOPs, or are SOPs a separate artefact?
- **What the standard gave me:** Definitions says "a service's SOPs **are** its runbook and recovery procedure"; but the Documentation criterion (SAC reference and FSD-PRO §7 alike) lists "runbook, recovery procedure, operating procedures (SOPs)" as three distinct items. CertHub folded its SOPs into runbook §6 and had to flag the discrepancy to the Approver on FRM-03 §1 ("in case a separate SOP artefact is expected").
- **What I did about it:** treated runbook §6 as the SOP set and accepted the lot together; harmless here, but two documents in the same standard give two answers.
- **Severity:** minor
- **FitSD doc & section:** FitSD — Definitions ("SOP") vs FSD-PRO §7 / SAC Documentation row
- **Suggested fix:** align the Definitions entry with the criterion: SOPs are the service's standing procedures, wherever they physically live.

### [S5-SERVICEDESK-6] An operator's duties are one clause deep and addressed to someone else
- **Kind:** friction
- **What I needed:** to find out, as a non-FitSD-literate front-liner, what the standard expects *of me* — ideally a page I could be pointed at.
- **What the standard gave me:** my entire existence in FitSD is one clause of one row of the FSD-PRO §7 table plus a sub-clause of the SOP definition. Everything is written to the Solution Owner and Approver — reasonably, but it means the person whose sign-off gates acceptance has no document addressed to them, and could not discover the duty (or the leverage: my acceptance can block go-live) without someone quoting it at them. Discoverability for my role: two documents, three sentences, all found only because I was told where to look.
- **What I did about it:** nothing to fix locally; noted that the Adoption Pack §2 table was the only place my name appeared before Stage 4 artefacts.
- **Severity:** minor
- **FitSD doc & section:** FSD-PRO §7; FitSD — Definitions
- **Suggested fix:** the planned Tier 3 roles doc should carry a short "if you are an operator" passage — what you're accepting, what you may refuse, what refusal triggers.

### [S5-SERVICEDESK-7] The per-service incident profile is the desk's best tool — FSD-RR-6 earns its keep
- **Kind:** worked-well
- **What I needed:** to classify CertHub tickets against real triggers instead of guessing severity from IM-02's abstract definitions.
- **What the standard gave me:** FSD-RR-6 ("each service declares its incident profile… registered with the incident process") plus the SAC row that forces it at acceptance. The FSD-RR card is right that "almost nobody writes down what an incident means for *this* service" — from the desk chair, this is the criterion that changed my job. The registered trigger table in JSM makes tier-1 severity calls mechanical, and the deliberate "cert <7 days, no renewal in flight = Sev2" trigger lets the desk raise an incident *before* an outage — the exact lesson of the founding incident, encoded where the first responder can act on it.
- **What I did about it:** nothing — used it. This was the only SAC artefact I could apply unaided from minute one.
- **Severity:** praise
- **FitSD doc & section:** FSD-RR-6; capabilities/run-and-restore (card, "FitSD's distinct contributions"); FSD-PRO §7 (Incident profile row)
- **Suggested fix:** —

### [S5-SERVICEDESK-8] The SAC baseline made the support terms quotable, once, org-wide
- **Kind:** worked-well
- **What I needed:** hours, response targets and a continuity rule I could quote to a user on a ticket without asking anyone.
- **What the standard gave me:** the set-once-ratify-inherit mechanism (SAC reference, "Your SAC baseline"; FSD-GV-7). Because the Supportability threshold was written and ratified at adoption, every service arriving at the desk carries the same quotable terms — and the continuity rule (named primary *and* deputy, dated walk-through before acceptance) meant the desk was demonstrably not the only person who'd been shown the service. FitSD deliberately ships no numbers; the *category* still did the work of forcing the numbers to exist.
- **What I did about it:** quoted the baseline row in my review verbatim; it held.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria ("Your SAC baseline"); FSD-GV-7
- **Suggested fix:** —

### [S5-SERVICEDESK-9] "Registered with the service desk" made someone talk to me before go-live
- **Kind:** worked-well
- **What I needed:** to be involved before the service went live, not after the first bad ticket.
- **What the standard gave me:** the combination of the Incident-profile row ("registered with the incident-management process") and the Supportability row ("accepted by operators") is the only mechanism in any framework I've role-played under that *structurally requires* the delivery team to approach the front line before acceptance. In-simulation it produced an October walk-through, a triage guide, a November review session and this written acceptance. The gaps in findings 1–4 are real, but the load-bearing fact is: the standard made the conversation happen at all. Absent those two clauses, CertHub goes live and the desk meets it via its first Sev2.
- **What I did about it:** —
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §7 (Incident profile + Supportability rows); FSD-RR-6
- **Suggested fix:** —
