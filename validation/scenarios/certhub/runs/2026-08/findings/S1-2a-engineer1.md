# Findings — Stages 1–2a (Engineer 1 / Priya Chandra: Idea Brief + Gate 1 submission)

Perspective: a capable engineer with no PM background, following FitSD for the first time,
from "I want to propose CertHub" through to a submitted FSD-FRM-01. Reading path taken:
README → Quickstart → FSD-PRO → FRM-00/01 → Definitions → SAC reference → Charter §6 → FSD-SC card.

### [S1-2a-ENG1-1] The scope test answered "is this for the front door?" in under a minute
- **Kind:** worked-well
- **What I needed:** to know whether CertHub goes through Solution Development or is just a change.
- **What the standard gave me:** FSD-PRO §1's five in-scope triggers. CertHub trips four unambiguously (new service, new infrastructure, over the local 5-day net-new line, new ongoing burden) and the fifth ("new technology **regardless of cost or effort**") would have caught it even if the rest hadn't. The adoption pack's scope line ("any net-new shared service we take on") settled that it's *our* front door.
- **What I did about it:** nothing — no local call needed.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §1; adoption pack §1/§3
- **Suggested fix:** none.

### [S1-2a-ENG1-2] The ratified SAC baseline answered the questions I most feared
- **Kind:** worked-well
- **What I needed:** an availability target, a support model, and a monitoring expectation — the three things a lone engineer cannot invent credibly.
- **What the standard gave me:** the SAC mechanism (categories fixed centrally, thresholds ratified once locally, FSD-GV-7) meant the pack's §4 already held the answers: CertHub matches the Tier 1 definition word for word; the supportability row names the desk, the rota, and the primary-plus-deputy continuity rule; and the monitoring row *already mandates* monitoring of "expiry-style dates (certificates…)" — the standing baseline had pre-named the exact failure that caused our outage. I designed my scope *to* a known bar instead of guessing. This is the shift-left the SAC reference doc promises, and it worked.
- **What I did about it:** cited the baseline by reference in FRM-00 §2, as the form directs.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria; FSD-FRM-00 §2; FSD-GV-7 via adoption pack §4
- **Suggested fix:** none.

### [S1-2a-ENG1-3] Nobody is obliged to help a submitter — there is no sponsor
- **Kind:** gap
- **What I needed:** numbers and facts I don't own: current per-team cert spend, service-desk ticket volume, whether £10–25k/yr SaaS spend is even fundable, and someone to sanity-check key-handling. I also needed to know who I was *entitled* to ask.
- **What the standard gave me:** the roles exist — Contributor (FSD-PRO §3) and Consulted SME (Charter §6) — and the FRM-01 header has a Contributors line. But nothing creates a duty on anyone to respond to a submission, no route to request their time, and no sponsor/champion role for the person raising demand. Charter §5 marks the Tier 3 roles model "later". I got my inputs because Owen, Elena and Rafi are helpful colleagues on a 5-person-adjacent team; a first-timer in a less friendly org, or one raising demand *into* a team (which FSD-PRO §1 explicitly invites — "source-agnostic"), could stall exactly here and go back to the corridor.
- **What I did about it:** used the adoption pack's named SMEs and goodwill; wrote "est." on everything financial and flagged it for Gate 2.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §3; Charter §5–§6; FSD-FRM-01 header
- **Suggested fix:** one line in FSD-PRO: on submission of an Idea Brief/Gate 1, the Approver brokers the contributor input the record needs (or names why not) — a thin duty, not a new role.

### [S1-2a-ENG1-4] Who appoints the Solution Owner?
- **Kind:** ambiguity
- **What I needed:** to know whether I *am* the Solution Owner just because I raised the idea and volunteered.
- **What the standard gave me:** FSD-PRO §2 defines the role and §1 says a proceeding solution "always has" one on the delivering team — but nothing says how or when the role is assigned. FRM-00 says "Raised by"; FRM-01 suddenly asks for a Solution Owner.
- **What I did about it:** self-appointed and wrote "self-nominated at intake; for confirmation at sign-off" in the header.
- **Severity:** minor
- **FitSD doc & section:** FSD-PRO §1–§3; FSD-FRM-01 header
- **Suggested fix:** one line: "the Approver confirms the Solution Owner at Gate 1 sign-off."

### [S1-2a-ENG1-5] The "don't design anything yet" rule chafed — and earned its keep
- **Kind:** worked-well
- **What I needed:** permission to write "deploy step-ca" — I arrived with the design itch; the PIR action even sounds like a solution.
- **What the standard gave me:** FRM-00's rule ("Don't design anything yet… Gate 1 makes the case, Gate 2 designs it") and the "Outcome sought" prompt ("the outcome, not the design"). Writing the problem without the solution was genuinely uncomfortable for about twenty minutes — and it directly improved Gate 1: because the brief described an outcome rather than a tool, the options table naturally admitted "federate with no central service" and "buy", which I would never have listed if I'd been allowed to write step-ca on day one. The discomfort is the mechanism working.
- **What I did about it:** kept candidate tech out of the brief entirely; it first appears in FRM-01 §5.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-00 preamble and §1
- **Suggested fix:** none.

### [S1-2a-ENG1-6] Idea Brief vs Gate 1 §1: real overlap, but worth it for a first-timer
- **Kind:** friction
- **What I needed:** to not write the same thing twice.
- **What the standard gave me:** FRM-00 §1 (problem/outcome/scope) reappears almost field-for-field as FRM-01 §1 — "carry forward… confirmed and firmed up". Of the ~1 hour the brief cost, perhaps 20 minutes was duplicated into Gate 1. The standard is honest that the brief is optional (FSD-PRO §4, Definitions), and for a *first* submission it was a cheap on-ramp: I could start before I was able to answer the Gate 1 questions, and the §2 SAC reference made me think about quality early. On my second proposal I'd skip straight to FRM-01, which the standard permits.
- **What I did about it:** wrote FRM-01 §1 as a genuine firming-up (added ticket volumes, tier claim) rather than a paste.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-00 §1; FSD-FRM-01 §1; FSD-PRO §4
- **Suggested fix:** a hint on FRM-00: "if you can already answer Gate 1's questions, go straight there."

### [S1-2a-ENG1-7] Definitions rescued the jargon — CAPEX/OPEX, T-shirt, MoSCoW
- **Kind:** worked-well
- **What I needed:** I did not know what CAPEX/OPEX meant, and only vaguely what T-shirt sizing was; MoSCoW (waiting for me at Gate 2) I'd never heard of.
- **What the standard gave me:** FitSD — Definitions has plain one-line entries for all three, plus RAIDD, SLO and the rest of what's coming. The README's "Stuck on a term?" routing worked. An ordinary engineer can fill FRM-01 §3 from the glossary alone.
- **What I did about it:** nothing beyond reading it.
- **Severity:** praise
- **FitSD doc & section:** FitSD — Definitions ("Common terms & acronyms"); README "How to read this"
- **Suggested fix:** none.

### [S1-2a-ENG1-8] …but the forms themselves never point at Definitions
- **Kind:** friction
- **What I needed:** to find the glossary *from the form*, because in real adoption I'd meet the form first — our Jira intake raises the Confluence template directly; nobody lands on the repo README.
- **What the standard gave me:** FRM-01 uses CAPEX/OPEX/T-shirt/MoSCoW inline with no pointer to Definitions. I only knew the glossary existed because I'd read the README path first, which a form-first submitter won't.
- **What I did about it:** nothing — I'd already found it; logging for the submitter who won't.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §3; FitSD — Definitions
- **Suggested fix:** one line in each form's preamble: "terms: see *FitSD — Definitions*."

### [S1-2a-ENG1-9] T-shirt sizes have no anchor, and at Fernbrook the size routes the approval
- **Kind:** ambiguity
- **What I needed:** to know what S/M/L *mean* — S relative to a 5-person team? To the company? It matters locally: the adoption pack routes approval to the CTO above £10k/yr, so my OPEX letter effectively chooses the Approver.
- **What the standard gave me:** FRM-01 §3 says "Size each as S/M/L with a short note"; Definitions defines T-shirt sizing but no anchors. Fair enough for a portable framework — but the pack didn't set local anchors either, and the standard never prompted it to (unlike the net-new line, which FSD-PRO §1 explicitly tells you to set).
- **What I did about it:** put rough £ ranges in every note column and flagged the option that crosses the £10k line.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §3; FitSD — Definitions (T-shirt sizing); adoption pack §2
- **Suggested fix:** Implementation Guide prompt: "set local S/M/L anchors alongside the net-new line, aligned to your approval thresholds."

### [S1-2a-ENG1-10] §6 assumes one new technology; real proposals adopt several, before the option is chosen
- **Kind:** gap
- **What I needed:** due diligence for *three* new dependencies (CA software, Let's Encrypt, a paid CA account) — and a different set per delivery option, with the option not yet decided at Gate 1.
- **What the standard gave me:** FRM-01 §6 is a single field/entry table for "what is being adopted". A real team under time pressure fills it for the headline tool and lets the quiet dependency slide — and the quiet one here is Let's Encrypt, a free tier becoming load-bearing with no contract, which is *precisely* the failure mode the FSD-SC card warns about ("the 'free tier' that quietly became load-bearing"). The form's shape works against the card's own lesson.
- **What I did about it:** repeated the §6 table once per dependency of the preferred option (6a/6b/6c) and noted the deviation on the record.
- **Severity:** major
- **FitSD doc & section:** FSD-FRM-01 §6; FSD-SC card ("Objective", "Where it meets Solution Development")
- **Suggested fix:** reword §6: "repeat this table for **each** new technology, tool or dependency the preferred option adopts."

### [S1-2a-ENG1-11] "The cited obligation or risk record" assumes the risk is already registered
- **Kind:** friction
- **What I needed:** a risk record to cite for a risk-driven case (FRM-01 §2 says the case rests on it). The cert-management risk was three weeks old and in nobody's register.
- **What the standard gave me:** the instruction to cite a record, with no word on what to do when none exists — the common case for a first-timer, whose proposal usually *is* the discovery of the risk.
- **What I did about it:** raised Platform Risk Register entry RSK-021 at submission and cited it, which felt right but was my invention.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §2; FSD-PRO §5
- **Suggested fix:** a form hint: "no standing record? Raise one now and cite it — the proposal is how the risk gets registered."

### [S1-2a-ENG1-12] Time cost and the verdict: about a day, and yes, I'd do it again
- **Kind:** worked-well
- **What I needed:** the whole thing to cost less than the corridor conversations it replaces.
- **What the standard gave me:** actuals — reading the standard cold: ~2 h (the README's "don't read it all" routing is why it wasn't more); Idea Brief: ~1 h (Quickstart's "half a day, tops" is honest); Gate 1: ~3.5 h writing plus chasing numbers (Quickstart's "~30 minutes" describes the Approver's conversation, not the writing — slightly rosy for the submitter, worth a caveat). Total ≈ one working day for a fundable, PoC-scoped proposal. The FRM-01 sections are, almost exactly, the list of questions my corridor pitches have historically died on ("what does it cost to run?", "who supports it?", "why now?") — answered once, in writing, on my own terms. I would do this again unprompted, which is the only adoption metric that matters.
- **What I did about it:** n/a.
- **Severity:** praise
- **FitSD doc & section:** FitSD — Quickstart §1–2; FSD-FRM-01 throughout
- **Suggested fix:** Quickstart: say "~30 minutes *for the conversation*; budget half a day to write it."
