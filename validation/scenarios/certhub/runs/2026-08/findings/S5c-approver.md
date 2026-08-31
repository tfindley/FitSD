# Findings — Stage 5c, Approver (Service Acceptance)

Role: Marcus Webb, Approver for Service Acceptance (Adoption Pack §2). Decision made
2026-11-27 on S5-FRM-03, with three operator/stakeholder reviews in hand, all three of
which said some flavour of "accept with conditions".

### [S5C-APPROVER-1] The binary Accepted/Remediation outcome doesn't fit "accept with conditions" — which is the common case
- **Kind:** gap
- **What I needed:** an outcome that accepts a solution into service while binding
  post-acceptance conditions to that acceptance. All three reviews (SDM, service desk,
  PM) accepted with conditions; not one found a baseline criterion unmet. This is surely
  the modal real-world acceptance, not an edge case.
- **What the standard gave me:** FSD-PRO §7 offers exactly two outcomes — "Accepted:
  solution enters service; managed thereafter as BAU" and "Remediation required:
  outstanding criteria listed; re-presented when closed". The second is defined by
  *unmet criteria*, which I didn't have; choosing it would have looped CertHub back to
  Delivery (§4 lifecycle) and jeopardised the 2026-12-18 migration over gaps the
  reviewers themselves called non-blocking. Meanwhile the *form* (FSD-FRM-03 §3) has a
  Conditions field, §3 of the process says the Approver "records any conditions", and the
  §2 definition of a gate says "with or without conditions" — but §7's Service Acceptance
  outcomes never say Accepted may carry conditions, and the §2 remediation table's
  caption restricts it to "any criterion not yet met". The form was ahead of the process.
- **What I did about it:** decided **Accepted into service**, used the §3 Conditions
  field as the binding instrument, and repurposed the §2 table as the conditions
  register (owner + date per row), flagging the repurposing on the record.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Outcomes); FSD-FRM-03 §2 caption, §3
- **Suggested fix:** one sentence in §7 — "Acceptance may carry conditions; each has an
  owner, a target date and a stated place it is tracked" — and widen the §2 caption to
  admit conditions as well as unmet criteria.

### [S5C-APPROVER-2] The Solution Owner → Service Owner hand-off is unwritten at the exact moment it happens
- **Kind:** gap
- **What I needed:** at the moment of signing, I had to name the live **Service Owner**
  for the register (FSD-GV-2, Dana's Gate 2 condition 3): who names them, by what act
  accountability transfers from the Solution Owner, and what the outgoing Solution Owner
  still owes (Priya owns several §2 actions — does that obligation survive her role
  dissolving at acceptance?).
- **What the standard gave me:** almost nothing, and it knows it. Charter §6 defines
  Service Owner ("accountable, end-to-end, for a given service"); FSD-PRO §3 defines
  Solution Owner; the §4 lifecycle diagram simply terminates at "Live service register
  entry + owner"; and the Roadmap (Tier 3 — Roles model) openly lists "an explicit
  lifecycle hand-off: how the Solution Owner becomes (or hands to) the Service Owner at
  Service Acceptance" as *unbuilt* work, with "owner reconciliation" a call still to
  make. In the chair it felt like the whole framework funnels to this one act — put a
  named accountable owner on the register — and then goes silent on who performs it.
  It felt seamless only because both roles land on the same head: I named Priya, who was
  already the Solution Owner. The day they differ (a contractor-built service; the day
  Priya leaves) there is no transfer procedure at all.
- **What I did about it:** named **Priya Chandra** (deputy Jordan Blake) in the sign-off
  and ratified the register entry, reasoning locally: the builder rule bars the builder
  from *sole acceptance approval*, not from live ownership; the Adoption Pack wants "one
  named engineer per live service", which rules me out (manager, Approver, MSO — naming
  myself would concentrate roles the wrong way); and all the continuity evidence
  (walk-throughs, rota) was built around Priya/Jordan.
- **Severity:** major
- **FitSD doc & section:** Charter §6; FSD-PRO §3, §4, §7; FitSD — Roadmap ("Tier 3 —
  Roles model"); FSD-GV-2
- **Suggested fix:** until the Tier 3 Roles doc lands, one thin sentence in FSD-PRO §7:
  "At acceptance the Approver confirms the live Service Owner on the service register."

### [S5C-APPROVER-3] FRM-03 has no field for the register entry or the live Service Owner
- **Kind:** gap
- **What I needed:** somewhere on the acceptance record to write the thing the process
  says acceptance produces — the live register entry with its named owner.
- **What the standard gave me:** the FRM-03 header names only the **Solution Owner**;
  §3 closes at Decision/Approver/Conditions/Date. The process's own lifecycle ends on
  "live service register entry + owner", yet the form that concludes the lifecycle has
  no field for either.
- **What I did about it:** added a local "Service register entry" row to the §3 table,
  flagged as a template deviation.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-03 (header, §3); FSD-PRO §4
- **Suggested fix:** a §3 form field — service register entry (service, live Service
  Owner, status).

### [S5C-APPROVER-4] Nothing ever re-checks the §2 conditions after go-live
- **Kind:** gap
- **What I needed:** a mechanism that re-visits the conditions I attached — Owen asked
  for exactly this ("carry them in the FRM-03 §3 conditions field so they don't
  evaporate"), and Rafi set a dated tripwire.
- **What the standard gave me:** "re-presented when closed" attaches only to the
  *Remediation required* outcome. Once **Accepted**, FSD-PRO §7 hands the service to BAU
  (FSD-CH, FSD-RR), neither of which has a hook for open acceptance conditions; and the
  FSD-GV-5 review cadence reviews the management system and registers, not conditions on
  closed acceptance records. An accepted-with-conditions record has no defined afterlife.
- **What I did about it:** three local inventions: (1) every condition is a standing
  item at the monthly ops review until closed; (2) the MSO records closure back on the
  FRM-03; (3) a tripwire — a missed blocking condition converts into a risk-register
  entry against the relevant SAC row (Rafi's own formulation, adopted). A real team
  without an Owen or a Rafi in the room would plausibly let all of this evaporate.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Outcomes), §8; FSD-GV-5
- **Suggested fix:** one line in §7 or FSD-GV-5: an acceptance carrying conditions stays
  on the review cadence as an open item until every condition is closed.

### [S5C-APPROVER-5] The standard still doesn't say what the signature commits the signer to
- **Kind:** gap
- **What I needed:** what does "Accepted into service" bind *me* to? The run-cost? The
  ops-effort envelope? The support model on behalf of the desk and rota? Seeing the
  conditions closed? This is the third gate where the approver has had to invent the
  answer (Dana stated her Gate 2 commitment in the decision cell for the same reason).
- **What the standard gave me:** FSD-PRO §7 describes the *solution's* fate ("enters
  service; managed thereafter as BAU"), not the signature's meaning. The Approver
  definition ("reviews and signs off… at a level appropriate to the risk") says who
  signs, not what signing spends.
- **What I did about it:** followed the Gate 2 precedent and stated the commitment
  explicitly in the §3 decision cell — register entry, support model, run-cost and ops
  effort, condition ownership. By stage 5 this "state what your signature means" habit
  has become a reliable local convention, which is itself evidence the standard should
  just say it.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §2 (Approver), §7
- **Suggested fix:** one sentence per gate/acceptance section: "This signature commits
  the organisation to: …" with a three-item skeleton teams can extend.

### [S5C-APPROVER-6] Worked-well — the SAC baseline made the decision nearly mechanical
- **Kind:** worked-well
- **What I needed:** to decide, under schedule pressure, whether a Tier 1 service was
  actually done.
- **What the standard gave me:** nine rows, each with a designed approach at Gate 2 and
  dated evidence at acceptance, applicability rules explicitly checked. My job reduced
  to auditing evidence and weighing reviews — never negotiating what "done" means, which
  is where acceptance meetings usually die. Better: the Supportability row's "runbook &
  SOPs **accepted by operators**" clause is what summoned the SDM and desk reviews at
  all — the standard forced the operator voice into my decision, and those two reviews
  were the highest-value inputs I had. Rafi's dry-runs exist because the baseline gave
  him standing to demand them.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §7; reference/FitSD — Service Acceptance Criteria;
  FSD-GV-7
- **Suggested fix:** —

### [S5C-APPROVER-7] Worked-well — the builder rule held, at a cost of one sentence
- **Kind:** worked-well
- **What I needed:** confidence that acceptance wasn't the builder marking her own
  homework.
- **What the standard gave me:** the Implementation Guide's "one line uncrossed" —
  whoever built a thing shouldn't be its *sole* acceptance approver. One sentence, cheap
  to honour, and it shaped real behaviour: Priya built and submitted; I approved; the
  operator reviews supplied the second pair of eyes; and the Adoption Pack extended the
  same line upward (where I build, Dana approves). Precisely because it bars only *sole
  approval*, it left me free to name the builder as the live Service Owner — the right
  outcome — without violating anything. Lightest possible segregation of duties that
  still works.
- **Severity:** praise
- **FitSD doc & section:** FitSD — Implementation Guide ("one line uncrossed"); Adoption
  Pack §2 (builder rule)
- **Suggested fix:** —
