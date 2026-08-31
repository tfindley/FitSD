# Findings — Stage 2b, Approver perspective (Marcus Webb, Gate 1)

Reviewer's notes, out of character. Context: acting as the Gate 1 Approver on
S2-FRM-01 (CertHub), reading the standard as a team manager would — what am I signing,
is it my call, and what does it cost my team. Decision reached: proceed via PoC first,
with conditions (see the artifact §8).

### [S2b-MANAGER-1] Signing Gate 1 — accountable for what, exactly?
- **Kind:** gap
- **What I needed:** what my signature commits me to. Design effort? The PoC's five
  person-days? Later build budget? The risk of the eventual service? When Dana asks
  "why did you approve this?", what am I answerable for?
- **What the standard gave me:** FSD-PRO §2/§3 — the Approver "reviews and signs off…
  at a level appropriate to the risk"; FSD-FRM-01 §8 — "Sign-off authorises progression
  to Gate 2 (or to a PoC first)". That is the whole account of what approval *means*.
  Only the non-normative *Adoption & Positioning* ("leadership steers by approving…
  at Gate 1, and funds the build at Gate 2") implies Gate 1 commits no build money.
- **What I did about it:** took the position that my signature commits gate-to-gate
  effort only (the PoC time-box and the work of producing a Gate 2 design) and wrote
  that boundary into the conditions myself.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §5, §8; FSD-FRM-01 §8
- **Suggested fix:** one sentence in FSD-PRO §5: a Gate 1 approval commits design/PoC
  effort only; build and run costs are committed at Gate 2.

### [S2b-MANAGER-2] "At a level appropriate to the risk" — risk of the decision, or of the solution?
- **Kind:** ambiguity
- **What I needed:** to know whether approval routing is judged on what *this gate
  commits* (a £0, five-day PoC) or on the *eventual solution* (a Tier 1 service holding
  every private key in the estate). Priya expressly flagged the key-material /
  data-classification line "for the Approver" — the flag reached me; nothing told me
  how to rule on it.
- **What the standard gave me:** FSD-PRO §2 and FSD-SD-6: single accountable approver,
  "at a level appropriate to the risk" — risk *of what* left open. Our adoption pack's
  tiers (£10k line, new data classification, company-wide impact) are entirely local
  invention, and even they don't say which gate a solution-level trigger bites at.
- **What I did about it:** ruled on what the gate commits: the PoC touches no
  production key material, so Gate 1 stayed mine, and the classification question was
  passed to the Gate 2 design — which routes to Dana in all cases under our pack. Note
  honestly: the layered scheme saved me here *by accident of our own design* (Dana takes
  every Gate 2), not because the standard resolved the question.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §2 (Approver definition); FitSD — Requirements FSD-SD-6
- **Suggested fix:** state that gate authority is judged on what the gate commits, with
  escalation where the solution's risk profile outgrows the gate approver.

### [S2b-MANAGER-3] No concept of sponsorship
- **Kind:** gap
- **What I needed:** recognition that approving Gate 1 makes me the proposal's advocate
  at Gate 2. I now carry Priya's case upward to Dana; my credibility is attached to it;
  I spent managerial capital before Gate 2 exists (holding two product teams off their
  home-builds, forcing a stopgap change). What is the mid-tier approver accountable for
  between the gates?
- **What the standard gave me:** FSD-PRO §5 calls the record "the fundable proposal
  taken upward for a decision", and *Adoption & Positioning* is substantially about
  "talking upward" — so the standard *knows* the record travels up. But grep finds zero
  occurrences of "sponsor" anywhere in keystone, and the role model (FSD-PRO §3) is
  Solution Owner / Approver / Contributor only. The relationship between a lower-gate
  approver and a higher-gate approver is nowhere.
- **What I did about it:** acted as sponsor anyway — conditions 3–4 on the artifact are
  sponsorship acts no FitSD role asked of me.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §3; FitSD — Framework Charter §6 (role table)
- **Suggested fix:** a line in FSD-PRO (or the planned Tier 3 role model): where
  approval is tiered, the earlier gate's approver sponsors the record at the later gate.

### [S2b-MANAGER-4] Gate 1 is a per-item decision; nothing pointed me at the portfolio
- **Kind:** gap
- **What I needed:** to weigh CertHub against everything else on a five-person team's
  plate — the demand register, in-flight work, what a "yes" displaces this quarter.
  "Worth doing?" is the wrong question on its own; mine is "worth doing *ahead of
  what*?".
- **What the standard gave me:** the demand/pipeline register exists (FSD-GV-4;
  *Information Stores* even calls it "the view that turns a pile of gate records into a
  portfolio", and *Adoption & Positioning* sells that view to the board) — but neither
  FSD-PRO §5 nor FSD-FRM-01 tells the Approver to consult it before deciding, and the
  form has no capacity or displacement field anywhere.
- **What I did about it:** checked the PLAT front-door board before signing — but out
  of habit from our monthly ops review, not because the process sent me there.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §5; FSD-FRM-01; reference/FitSD — Information Stores
- **Suggested fix:** one Approver step in FSD-PRO §5 — "decide with the demand register
  open" — or a "what this displaces" prompt on the form.

### [S2b-MANAGER-5] Risk-driven case with a live deadline, no interim-mitigation prompt
- **Kind:** gap
- **What I needed:** the form to ask what contains the cited risk *while* we gate, PoC,
  design and build. The orphaned wildcard expires 2026-11-30 whether or not CertHub
  lands; unmitigated, the project plan quietly becomes the only barrier to a repeat of
  the trigger incident.
- **What the standard gave me:** FSD-FRM-01 §4 asks impact-of-doing-nothing and case
  expiry — pressure to act, nothing on interim containment. Risk treatment exists in
  FSD-SA-1, but nothing ties it back to a Gate 1 record with a ticking clock.
- **What I did about it:** conditioned a stopgap manual renewal via the change process,
  independent of the proposal's fate.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §4; FitSD — Requirements FSD-SA-1
- **Suggested fix:** a §4 prompt: "if risk-driven — what holds the line while this is
  decided and delivered?"

### [S2b-MANAGER-6] Header Status can't say what §8 decided
- **Kind:** friction
- **What I needed:** a Status value for my actual outcome.
- **What the standard gave me:** the FSD-FRM-01 header offers Draft / Submitted /
  Approved; §8 offers four outcomes. "Proceed via PoC first", "Park" and "Reject" have
  no header representation at all.
- **What I did about it:** wrote "Approved — proceed via PoC first (see §8)".
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 Header vs §8
- **Suggested fix:** align the Status enumeration with the §8 outcomes.

### [S2b-MANAGER-7] §8 Conditions is the junk drawer for everything the approver actually settles
- **Kind:** friction
- **What I needed:** somewhere to record the things a real sign-off settles beyond
  the decision itself: confirming the Solution Owner (the header said "for confirmation
  at sign-off" — the submitter's invention, but a reasonable one), the routing rationale
  (why this was my call and not Dana's), and actions I took on the back of the decision.
- **What the standard gave me:** §8 is Decision / Approver / Conditions / Date. Everything
  else went into Conditions as free text, where the next reader must excavate it.
- **What I did about it:** numbered the conditions and prefixed the routing note into
  the Approver cell — workable, ugly.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §8
- **Suggested fix:** an "Approver's notes / routing" row in §8, or a prompt that the
  sign-off confirms the Solution Owner.

### [S2b-MANAGER-8] The four Gate 1 outcomes fit the real decision exactly
- **Kind:** worked-well
- **What I needed:** an honest middle path — the case is strong but the core technical
  choice is unproven, and I did not want to fund design on an unproven stack or kill a
  good case.
- **What the standard gave me:** FSD-PRO §5 makes "Proceed via PoC first" a first-class
  outcome, and "Park: revisit by a stated date" a legitimate alternative to a soft no.
  My genuine managerial position had a name and a box; I never had to bend the process.
- **What I did about it:** used it as written.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §5
- **Suggested fix:** —

### [S2b-MANAGER-9] The §7 PoC block let me sign a bounded experiment, not a blank cheque
- **Kind:** worked-well
- **What I needed:** to authorise investigation without authorising drift.
- **What the standard gave me:** because FSD-FRM-01 §7 demands objective, success
  criteria, method/cost and duration *before* approval, what I signed was a five-day,
  £0 box with a defined deliverable (the comparison scorecard) — the form structure did
  the bounding for me, and the result field visibly belongs to the delivery side, not
  the approver.
- **What I did about it:** approved it as scoped, adding only a hard-stop condition.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-01 §7; FSD-PRO §2 (PoC definition: "time-boxed,
  low-cost, genuine feasibility uncertainty")
- **Suggested fix:** —

### [S2b-MANAGER-10] The §2 driver rule protected a risk case from its own value scores
- **Kind:** worked-well
- **What I needed:** not to have a Growth score of 1 used (by me, or by Dana later)
  against a risk-reduction case with a customer-facing outage behind it.
- **What the standard gave me:** FSD-FRM-01 §2's explicit rule — for risk/compliance
  work the case rests on §4 and the cited record, "low scores do not weaken a mandated
  case" — while keeping the scores for prioritisation. Precisely the mis-read it
  pre-empts is the one a funding conversation would otherwise have.
- **What I did about it:** leaned on it in my recorded reason.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-01 §2; FSD-PRO §5
- **Suggested fix:** —

### [S2b-MANAGER-11] §6 due diligence and the anti-sprawl trigger surfaced the free-tier trade before commitment
- **Kind:** worked-well
- **What I needed:** as the manager who will own the run-cost and the supplier risk, to
  see the dependencies *before* anything is adopted — including the free ones, which are
  the ones that normally slip in.
- **What the standard gave me:** the FSD-PRO §1 trigger ("regardless of cost or
  effort") plus FRM-01 §6 dragged Let's Encrypt into the light as a deliberate,
  recorded, no-SLA dependency, put smallstep's commercial health on the PoC scorecard,
  and made exit paths a stated field. The £/day anchoring against our £10k routing line
  came from our adoption pack, not the standard — but the form gave it a place to land.
- **What I did about it:** nothing needed — this is the standard doing its job at the
  gate where it is cheapest.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §1; FSD-FRM-01 §6; FitSD — Requirements FSD-SC-2
- **Suggested fix:** —
