# Findings — Stage 0, stand-up workshop (Marcus Webb, Management System Owner; Dana Okafor, ratifying CTO)

Context: standing FitSD v0.3 up for a 5-person platform team inside a ~150-person company,
following *FitSD — Implementation Guide* step by step, producing `artifacts/S0-adoption-pack.md`.
Both hats logged: MSO running the workshop; CTO who must ratify and later defend it.

### [S0-MSO-1] The seven-step checklist is genuinely runnable in half a day
- **Kind:** worked-well
- **What I needed:** an ordered path from "we've decided to adopt" to "we're stood up", with nothing forgotten.
- **What the standard gave me:** Implementation Guide, "The stand-up checklist" — seven steps, each a decision not machinery, each citing the requirement it satisfies (FSD-GV-1 → GV-5, SD-1…6, GV-7). Every step pointed at exactly one other document when detail was needed.
- **What I did about it:** worked down the list once; the artifact's section numbers map 1:1 to the steps.
- **Severity:** praise
- **FitSD doc & section:** FitSD — Implementation Guide, "The stand-up checklist"
- **Suggested fix:** —

### [S0-MSO-2] No mechanism for "Approver at a level appropriate to risk"
- **Kind:** gap
- **What I needed:** a way to decide who approves what — when does a gate or acceptance need the CTO rather than the team manager? The Charter, Definitions and FSD-SD-6 all say the Approver acts "at a level appropriate/matched to the risk", but nothing defines levels, gives example thresholds, or even says the levels are mine to set.
- **What the standard gave me:** Charter §6 and Definitions ("at a level matched to the risk"); Implementation Guide "Roles on a small team" (hat-collapsing, plus the builder rule). The Tier 3 roles model that would presumably cover this is explicitly "later" (Charter §5; Roadmap).
- **What I did about it:** invented a two-level scheme (manager by default; CTO for Gate 2 always, and for spend > £10k, new data classification, or company-wide impact) and wrote it into the pack §2.
- **Severity:** major — every adopter must invent this, and a team that doesn't will default to "the manager signs everything", which is exactly the risk-blindness the wording is trying to prevent.
- **FitSD doc & section:** FitSD — Framework Charter §6; FitSD — Requirements FSD-SD-6; FitSD — Implementation Guide, "Roles on a small team"
- **Suggested fix:** one line in the Implementation Guide step 2: "write down your escalation line — the spend/impact level above which approval moves up" (with an example), pending the Tier 3 roles doc.

### [S0-MSO-3] Who ratifies the SAC baseline is ambiguous — "the organisation" vs the MSO
- **Kind:** ambiguity
- **What I needed:** to know whose signature makes the baseline "ratified". FSD-GV-7 says *the organisation* shall ratify; the SAC doc's ratification block suggests "the accountable owner, e.g. Management System Owner".
- **What the standard gave me:** those two pointers, which pull in different directions for a team-scoped adoption inside a larger org. If the MSO (me, Marcus) both proposes and ratifies his own baseline, Dana's hat asks what "ratified" adds over "written"; there is no sponsor/executive concept anywhere in the roles model to hang the CTO's signature on.
- **What I did about it:** had the CTO ratify with the MSO proposing, and recorded both. Felt right; the standard neither requires nor suggests it.
- **Severity:** major — audit defensibility turns on this. An MSO self-ratifying is the plausible default reading and the weakest one.
- **FitSD doc & section:** FitSD — Requirements FSD-GV-7; reference/FitSD — Service Acceptance Criteria, "Ratification"
- **Suggested fix:** a line in the ratification guidance: "where the team sits inside a larger organisation, ratification should sit above the MSO" — or introduce a lightweight Sponsor/Governance role.

### [S0-MSO-4] The SAC baseline template asked exactly the right questions
- **Kind:** worked-well
- **What I needed:** to turn nine vague qualities into commitments a 5-person team can be held to.
- **What the standard gave me:** the baseline table's per-row prompts ("backup scope; frequency; retention; how often a restore is tested", "the continuity rule (no single-person dependency)", "severity scheme; what counts as a reportable incident"). Each prompt forced a real decision we had genuinely never written down — the restore-test cadence and the primary/deputy continuity rule did not exist at Fernbrook before this workshop. The categories-fixed/thresholds-yours split, and the refusal to ship default numbers, both survived contact with reality.
- **What I did about it:** filled every row with our own values; the workshop's whole second hour was this table, and it was the most valuable hour.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria, "Your SAC baseline"
- **Suggested fix:** —

### [S0-MSO-5] Applicability rules are an excellent honesty mechanism
- **Kind:** worked-well
- **What I needed:** a way to let a stateless tool skip the backup row without teaching the team that N/A is free.
- **What the standard gave me:** the Applicability paragraph: N/A only against a standing rule, recorded with the reason; "if you find yourself writing N/A with no rule to point at, the fix is to change the baseline, not to bend the record".
- **What I did about it:** wrote three rules into the pack (§4). Dana specifically liked that N/A becomes a deliberate call against a published rule.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria, "Your SAC baseline — Applicability"
- **Suggested fix:** —

### [S0-MSO-6] The baseline invites restating other policies' numbers — a drift risk
- **Kind:** friction
- **What I needed:** (Dana's hat) confidence that the ratified baseline won't silently diverge from the company policies it draws on. Our Security row carries patch timescales that also live in the (pre-existing) patch standard; if that standard changes, we now have two places with numbers.
- **What the standard gave me:** nothing either way — the template's prompts read as "write your values here", and nothing says a row may *cite* an existing policy as its source of truth rather than restating it.
- **What I did about it:** added a local convention above the table: where a row cites a Fernbrook policy, the policy is the source of truth and the row inherits it.
- **Severity:** minor — but a real team that copies numbers in will get bitten at the first policy revision, and the annual re-ratification is a long time to wait.
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria, "Your SAC baseline"
- **Suggested fix:** one line: "a row may reference an existing policy as its authority rather than restating its values".

### [S0-MSO-7] The Owner column in the baseline template is undefined
- **Kind:** ambiguity
- **What I needed:** to know what "Owner" means per criterion row — owner of the threshold (maintains the standard), owner of the evidence at acceptance, or the role that signs that row off?
- **What the standard gave me:** a bare column header. The Information Stores doc owns the *baseline as a whole* (Govern), but not the row-level semantics.
- **What I did about it:** read it as "owner of the standard for that criterion — the person you argue with to change the row", and assigned accordingly.
- **Severity:** minor
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria, baseline table
- **Suggested fix:** a parenthetical under the table: "Owner = who maintains this row's standard (evidence owners are named per service, on FRM-03)".

### [S0-MSO-8] The builder rule is stated but has no fallback mechanism
- **Kind:** gap
- **What I needed:** to handle the case where the natural Approver *is* the builder. I (Marcus) will sometimes build things myself; the guide says the builder shouldn't be the sole acceptance approver, but not who steps in, nor does step 2 of the checklist prompt me to name an alternate while I'm standing roles up.
- **What the standard gave me:** Implementation Guide, "Roles on a small team" — the principle, clearly and memorably put ("one line uncrossed"), plus honest team-of-one guidance. The principle itself is praiseworthy; the stand-up step just never asks me to operationalise it.
- **What I did about it:** named the fallback in the pack §2 (acceptance approval passes to the CTO, informed by the service delivery manager).
- **Severity:** minor — the principle is hard to miss; the missing prompt is easy to.
- **FitSD doc & section:** FitSD — Implementation Guide, step 2 and "Roles on a small team"
- **Suggested fix:** add to step 2: "name the alternate approver for work the default Approver builds".

### [S0-MSO-9] The incident-profile row silently depends on a central severity scheme existing
- **Kind:** friction
- **What I needed:** to fill the baseline's "severity scheme; reportable-incident bar" row. Fernbrook has an incident policy with Sev1–4, so we mapped to it — but the SAC template assumes a scheme exists to point at, and FSD-RR's card only says "most teams already run a central incident policy. Use it."
- **What the standard gave me:** no path for the team that has *no* central policy: does the baseline define a local severity scheme from scratch, and does that then become the de-facto company one? For us this cost ten minutes; for a smaller shop it would be the hardest row on the page with the least help.
- **What I did about it:** mapped to the existing scheme; noted in the pack that the per-service-profile idea (FSD-RR-6) was new to Fernbrook and is a real gap FitSD closed.
- **Severity:** minor (for us; plausibly major for a team with no incident policy at all)
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Incident profile row); capabilities/run-and-restore/FSD-RR, "How to satisfy them"
- **Suggested fix:** one line on the FSD-RR card: "no central scheme? define Sev1–4 in your baseline and treat it as the team's standing scheme".

### [S0-MSO-10] Nowhere for the stand-up record itself to live, and no name for it
- **Kind:** gap
- **What I needed:** a named artefact for the output of the stand-up — the thing an auditor (or a new joiner) reads first. The guide says each step is "a decision you record" but never says where the seven decisions are recorded together, what the record is called, or that it should itself enter document control under FSD-GV-3.
- **What the standard gave me:** the implementation profile table (a named piece of it) and the Information Stores catalogue (homes for the registers) — but no "adoption record" or equivalent wrapping artefact.
- **What I did about it:** invented the "adoption pack": one page holding all seven decisions, registered as row 1 of our document register, with owner/approver/review cycle per FSD-GV-3.
- **Severity:** minor — most teams will do something like this anyway, but naming it would make step 1 concrete ("open a page called X") and give conformance evidence a front door of its own.
- **FitSD doc & section:** FitSD — Implementation Guide (whole checklist); reference/FitSD — Information Stores
- **Suggested fix:** name the artefact ("adoption record" / "implementation profile page") in the guide's intro and add it to the Information Stores catalogue.

### [S0-MSO-11] The net-new default anchored a real decision instead of replacing it
- **Kind:** worked-well
- **What I needed:** a defensible effort threshold for "this comes through the gates".
- **What the standard gave me:** FSD-PRO §1 / Implementation Guide step 3: "about 10 person-days is a sensible default" — the only place FitSD ships a number, and rightly flagged as a default, not a rule. Having an anchor made the local call fast: we halved it and could say why in one line. The regardless-of-size new-technology trigger also meant the number carries less weight than it first appears, which Dana probed and was satisfied by.
- **What I did about it:** set 5 person-days, justification recorded in the pack §3.
- **Severity:** praise
- **FitSD doc & section:** capabilities/solution-development/FSD-PRO §1; FitSD — Implementation Guide, step 3
- **Suggested fix:** —

### [S0-MSO-12] Information Stores catalogue made step 6 mechanical — but gives no minimum fields
- **Kind:** friction
- **What I needed:** the register list (got it, cleanly — the catalogue plus the "named homes with owners, no new tools" framing is exactly right for a small team) and then, per register, what columns it minimally needs.
- **What the standard gave me:** each store's "What it holds" is a description, not a field list; e.g. the service register "live services, named owner, status (incl. retired)" — is tier there? deputy? EOL decision? We derived fields from scattered requirements (FSD-RR-7 implies an EOL column; our continuity rule implies a deputy column).
- **What I did about it:** invented the columns per register in the pack §6.
- **Severity:** minor — and half a praise: fourteen stores stood up in under an hour because the catalogue exists.
- **FitSD doc & section:** reference/FitSD — Information Stores, "The catalogue"
- **Suggested fix:** an italicised minimum-fields hint per store row, template-not-mandate, matching the SAC table's style.
