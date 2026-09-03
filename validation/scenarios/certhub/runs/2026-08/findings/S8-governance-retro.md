# S8 findings — governance retro (extraordinary FSD-GV-5 review)

Role: Management System Owner / CTO running the PDCA review, 2027-09-01, with CertHub as
the system's first full test case. These findings are about what the *standard* gave the
governance layer — the review itself, the conditions, the cadences — not about CertHub.

### [S8-GOV-1] FSD-GV-5 never required the review to look at a service
- **Kind:** gap
- **What I needed:** a requirement that the management-system review examine per-service state — register accuracy, outstanding conditions, overdue evidence, continuity, EOL candidates — so that a decaying live service would surface at review time.
- **What the standard gave me:** FSD-GV-5: "The management system shall be reviewed at a defined cadence and improved (Plan-Do-Check-Act)." The object of review is *the system*, not the services in it. The FSD-GV capability card *narrates* that the review cadence "catches services that have drifted from how they were accepted, and surfaces end-of-life candidates" — but that is card prose, not a shall, and nothing operationalises it. In our record, the only mechanism that ever put CertHub on a review agenda was the CTO ad-libbing it into a Gate 2 condition (condition 5) — and when the review died, the look died with it.
- **What I did about it:** the extraordinary review invented a per-service walk (registers, conditions audit, continuity state) and made a per-Tier-1-service line a standing local agenda item.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements, FSD-GV-5; capabilities/govern/FSD-GV §"Where it meets Solution Development"
- **Suggested fix:** a thin shall (or a GV-5 note): the review covers, per live service, register accuracy, open conditions, overdue evidence and EOL candidates.

### [S8-GOV-2] The review has no inputs — I invented the entire agenda
- **Kind:** gap
- **What I needed:** an agenda skeleton, a minimum-inputs list, a checklist, or any metric feed for the GV-5 review — the "Check" of PDCA needs something to check.
- **What the standard gave me:** one sentence. Implementation Guide step 7: "Pick when you'll review the system (and re-ratify the SAC baseline): annually, or on material change. Tie it to a review you already hold." That is the entirety of the review guidance. Contrast the treatment of acceptance: the SAC gives it nine criteria, evidence expectations and applicability rules. GV-5 is the only load-bearing requirement with no reference artefact behind it at all. Nothing in the standard produces review inputs either — no service reporting, no metrics (a gap the standard itself admits in Standards Alignment §2, and which Sam's S5 memo and the Meridian ticket independently hit).
- **What I did about it:** built the agenda from the Adoption Pack §7 (itself local), the FRM-03 conditions table, the takeover assessment, and the pitch in Adoption & Positioning §2–3 (grading the framework against its own sales copy turned out to be an excellent Check structure — worth suggesting as a pattern).
- **Severity:** major
- **FitSD doc & section:** FitSD — Implementation Guide §7; FSD-GV card; FSD-GV-5
- **Suggested fix:** a half-page "review inputs" list in the GV card or Implementation Guide; promote service reporting from the backlog to a thin requirement so the review has a feed.

### [S8-GOV-3] The annual cadence sat behind the entire failure curve — and the review itself failed silently
- **Kind:** gap
- **What I needed:** a cadence that could catch decay before damage, and a mechanism that notices when a review does not happen.
- **What the standard gave me:** "annually, or on material change" (Implementation Guide §7). Map the timeline against it: adoption June 2026; acceptance November 2026; conditions began dying December 2026 (ownership drive slipped); the deputy ceremony drill died in Q1 2027; the 02:07 page and the audit request landed February 2027; the restore re-test was missed in May 2027; Priya resigned in May and left 12 June — and the June 2027 annual review, the first scheduled Check since adoption, *itself did not run*, because the person whose service it would have examined was leaving and the MSO was absorbed in exactly that. Every single failure predates the first cadence point, and the cadence point then failed too — with nothing in the standard (or our pack) to detect a missed review. The extraordinary review only happened in September because three shocks stacked up. Note also: the monthly ops review — our local addition, *beyond* the standard — was the only faster check, and the record proves it toothless for conditions ("nothing watching it but a monthly agenda item").
- **What I did about it:** local hardening — interim half-year check, calendar-held annual with an automatic escalate-to-CTO tripwire if not held within the month.
- **Severity:** major
- **FitSD doc & section:** FSD-GV-5; FitSD — Implementation Guide §7
- **Suggested fix:** one line: "a review that does not occur by its due date shall be escalated to the accountable authority" — the review needs its own tripwire; and a note that annual is likely too slow for Tier-1-service state.

### [S8-GOV-4] "Accepted with conditions" is how everything was actually decided, and the standard has no machinery for it
- **Kind:** gap
- **What I needed:** somewhere for gate/acceptance conditions to live, a requirement that they be tracked to closure, and an escalation when one breaches.
- **What the standard gave me:** nothing. FSD-SD-6 requires decisions recorded; no form has a field for setting or discharging conditions (Gate 2 and FRM-03 both invented "position at submission/acceptance" sections and flagged the deviation); FSD-PRO §7's remediation table is reserved for *unmet* criteria (FRM-03 repurposed it, flagged); no store in Information Stores holds open conditions; nothing escalates a breach. The audit result is the evidence: of 11 acceptance conditions, 5 closed on time, 3 ran months past date, 3 silently died — and the split is perfectly explained by whether a named beneficiary was chasing (the desk's and SDM's closed; management-side drills/ratifications died). One dead condition (the ownership drive) directly produced the February 02:07 page; another (product ownership) killed the invented Tier-3 role by pure administrative decay.
- **What I did about it:** local machinery — every condition becomes a dated ticket with an assignee, breach auto-escalates to the approver who set it; agenda lines abolished as a tracking mechanism.
- **Severity:** major (for a governance layer, borderline blocker — the review could count the bodies only because the artifact authors had voluntarily written conditions down in repurposed fields)
- **FitSD doc & section:** FSD-SD-6; FSD-PRO §5/§7; FSD-FRM-01/02/03; reference/FitSD — Information Stores
- **Suggested fix:** a thin shall: "conditions attached to a gate or acceptance decision shall be recorded with owner and date, tracked to closure, and breaches escalated to the approver who set them" — plus a conditions field on the three decision forms.

### [S8-GOV-5] FSD-GV-4's "kept current" has no verification, so it silently wasn't
- **Kind:** gap
- **What I needed:** a way to know the registers were accurate — specifically, to catch that the service register named a leaver as Service Owner for ~8 weeks.
- **What the standard gave me:** FSD-GV-4 requires the register "maintained and kept current", with no mechanism, cadence or trigger for verifying currency. Ours drifted wrong at the exact moment it mattered most (a Tier 1 service, ownerless in fact, owned on paper) and nothing noticed until the successor did.
- **What I did about it:** register-accuracy check added to every monthly ops review; leaver tripwire added to the SAC baseline (re-verify register + dual-control seats within 5 working days of any leaver).
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements, FSD-GV-4
- **Suggested fix:** a note on GV-4: currency is verified at the GV-5 review and on any staffing change touching an owner.

### [S8-GOV-6] Ownership has no succession path: GV-2 names an owner but says nothing about the owner leaving
- **Kind:** gap
- **What I needed:** a transfer procedure — or at least a requirement — for when a Service Owner departs: reassignment window, access/dual-control re-verification, deputy re-establishment, register update.
- **What the standard gave me:** FSD-GV-2 ("a single named owner accountable") and FSD-SD-5's continuity criterion, both point-in-time. The 10-working-day reassignment rule that existed was *our own* SAC baseline row, and even that had no tripwire — breached ×4 (nine weeks), dual-control seats un-reseated for ~11 weeks against SEC-02's one day, undetected throughout. The framework proved knowledge-continuity magnificently (the record set carried a no-handover succession) and people-continuity not at all: continuity was evidenced once at acceptance and never re-asked. The takeover assessment — the best artifact in the whole set — was entirely improvised.
- **What I did about it:** adopted the takeover-assessment format as the local standing transfer procedure; SAC amendment makes continuity a 6-monthly re-verification like restore tests.
- **Severity:** major
- **FitSD doc & section:** FSD-GV-2; FSD-SD-5; reference/FitSD — Service Acceptance Criteria (supportability/continuity row)
- **Suggested fix:** two thin shalls: continuity re-verified on a cadence; ownership transfer on leaver within a defined period including access re-verification. (S7 will have logged the same from the other side; the governance angle is that *nothing asked twice*.)

### [S8-GOV-7] No independence guidance: the MSO reviews his own failures
- **Kind:** ambiguity
- **What I needed:** any steer on who conducts the GV-5 review and what happens when the system's failures are the reviewer's own (the missed June review, the dead conditions, the stale registers were substantially the MSO's).
- **What the standard gave me:** nothing — FSD-GV-5 has no actor. The Implementation Guide's "one line uncrossed" builder rule shows the standard *can* do cheap independence, but only does it for acceptance.
- **What I did about it:** the CTO attended and held the pen on the promise grades; the minutes open with the MSO's admission. That worked, but it worked because of the people, not the process.
- **Severity:** minor
- **FitSD doc & section:** FSD-GV-5; FitSD — Implementation Guide (builder rule, §"one line uncrossed")
- **Suggested fix:** one line: the review is attended by an authority the MSO answers to, mirroring the builder rule.

### [S8-GOV-8] Worked-well: the "or on material change" arm legitimised this review
- **Kind:** worked-well
- **What I needed:** a sanctioned way to review out of cycle after the succession, rather than waiting for June 2028.
- **What the standard gave me:** Implementation Guide §7's "annually, **or on material change**", carried into our Adoption Pack §7. The extraordinary review is that arm firing — late (the material change was arguably Priya's resignation in May; we convened in September after three triggers stacked), but it existed, it was pre-agreed, and nobody had to argue about whether an off-cadence review was legitimate.
- **What I did about it:** used it; local fix addresses only the lateness (the leaver tripwire would have forced the question in June).
- **Severity:** praise
- **FitSD doc & section:** FitSD — Implementation Guide §7; FSD-GV-5

### [S8-GOV-9] Worked-well: the record set gave the Check something to check
- **Kind:** worked-well
- **What I needed:** evidence to review — ten months after acceptance, seven weeks after a no-handover succession.
- **What the standard gave me:** everything the Solution Development spine touched was dated, evidenced and honest: gate records with reasons, an acceptance record that flagged its own template deviations, a restore-test log that kept the *failed* test, reviews that wrote their dissent down. The conditions audit (§2.2 of the minutes) was countable *only* because the artifact authors had recorded conditions at all, even in repurposed fields. PDCA's Check was cheap because Do had left a trail — this is FSD-SD-4's "evidenced rather than asserted" paying off a second time, at review, for a purpose the acceptance authors never had in mind.
- **What I did about it:** nothing needed; noted in the upstream feedback as praise, alongside the DEC7 standing decision log (a local CTO condition that deserves promotion into the SAC documentation row).
- **Severity:** praise
- **FitSD doc & section:** FSD-SD-4; FSD-PRO §7; FSD-FRM-03

### [S8-GOV-10] Worked-well: FSD-RR-7 turned a supplier shock into a decision, routed correctly
- **Kind:** worked-well
- **What I needed:** the governance layer to receive the smallstep EOL announcement as something other than a panic.
- **What the standard gave me:** FSD-RR-7's renew/replace/retire triad plus FSD-SC-4's kept-alive exit path. Five days after the announcement — and nine weeks into an unplanned succession — the review received a recorded EOL decision with reasoning, a register entry, a raised risk, and fresh demand already at the front door (PLAT-512). The 2026 Gate 1 due-diligence question "how would we get off it?" was answered in 2027 currency: without a rebuild, because DEC2 froze the consumer surface. This is the lifecycle loop of the standard closing exactly as drawn.
- **Severity:** praise
- **FitSD doc & section:** FSD-RR-7; FSD-SC-4; FSD-FRM-01 §6

### [S8-GOV-11] The pitch's four promises: two delivered by the standard, two carried by local invention
- **Kind:** gap
- **What I needed:** grading the adoption pitch (Adoption & Positioning §2–3; Quickstart) against the record, I needed the framework to have produced what its pitch sells.
- **What the standard gave me:** promises (a) "heard and funded" and (b) "no 2 a.m. page for something nobody wrote down" are genuinely delivered by the standard's own machinery (the forms; the SAC monitoring/incident-profile rows — February's page was for something written down in five documents, with a week of fuse, versus INC-4211's post-failure discovery). But (c) "the evidence trail customers and auditors ask for" was answerable only because the SDM had *invented* the service statement and monthly summary as acceptance conditions — the standard's SAC never asks for a customer-facing artefact; and (d) "a product with an owner, not a thing you'll quietly carry alone forever" failed on both halves the standard doesn't cover: product (no role, no backlog home — S5-PM's memo) and enduring ownership (finding 6). The pitch is honest about the floor but sells the ceiling.
- **What I did about it:** graded honestly in the minutes (met / met-with-finding / met-when-asked-decaying / failed-rescued-by-records); the local SAC amendments and upstream items 4–6 close the gap between pitch and spec.
- **Severity:** major
- **FitSD doc & section:** FitSD — Adoption & Positioning §2–3; FitSD — Quickstart (acceptance walk); reference/FitSD — Service Acceptance Criteria
- **Suggested fix:** either add the thin requirements that make (c) and (d) true (service statement/reporting; continuity cadence; ownership transfer), or soften the pitch. The record supports adding them.

### [S8-GOV-12] Cadenced obligations survive only where a register row carries a date something reads
- **Kind:** friction
- **What I needed:** looking across §2.1 of the minutes for a unifying diagnosis: why did every pipeline-fed store stay current through the succession while every human-cadence obligation (June review, May restore re-test, quarterly access reviews, monthly summary, baseline re-ratification) broke in the same window, silently?
- **What the standard gave me:** the standard sets several cadences (GV-5 review; SAC-inherited re-test rhythms; SC-4 periodic supplier review) but no pattern for *holding* them — no due-date register, no requirement that overdue evidence surfaces anywhere. The one cadence in our estate that could not be silently missed was the intermediate-expiry alert (`CertHubIntermediateExpiry180d`, "never auto-resolves") — a monitoring rule, not a governance one. The engineers solved for governance's own failure mode better than governance did.
- **What I did about it:** local: overdue evidence (re-tests, re-walk-throughs, reviews) becomes a standing dashboard/agenda feed with escalation; the review checks it (finding 1's per-service walk).
- **Severity:** minor
- **FitSD doc & section:** FSD-GV-5; reference/FitSD — Information Stores (no store carries due dates)
- **Suggested fix:** a one-line note in Information Stores: every cadenced obligation lives in a register row with a due date that the GV-5 review (or monitoring) reads — dates that nothing reads are wishes.
