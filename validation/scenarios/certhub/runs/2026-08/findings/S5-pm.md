# Findings — Stage 5, product manager (Sam Reyes)

Perspective: asked to take long-term product ownership of a live FitSD-delivered service —
roadmap, a backlog of feature requests from eight consuming teams, adoption targets,
prioritisation of enhancements. Read the standard specifically for what it offers that seat.

### [S5-PM-1] No role is accountable for a service's value over time

- **Kind:** gap
- **What I needed:** a role I could take (or map to) that owns roadmap, prioritisation and
  value-over-time for a live service — distinct from operational accountability.
- **What the standard gave me:** Charter §6 names five roles (Management System Owner,
  Service Owner, Approver, Operator, Consulted SME). The Service Owner is "accountable,
  end-to-end, for a given service" — read throughout as *operational* accountability
  (register entry, continuity, run-cost). "Product" appears only incidentally (FSD-PRO §1
  "new service, product, or platform capability"; §7 "the product itself"). The Tier 3
  roles model that might settle whether value accountability exists is explicitly unbuilt
  (Roadmap, "Then — the unbuilt tiers"; BACKLOG). No register or record names a product
  owner; the service register's fields (FSD-GV-2/4, Information Stores) have no place for one.
- **What I did about it:** in character, made acceptance conditional on a locally invented
  role definition (a one-page adoption-pack addition, a service-register column), keeping
  Service Owner accountability untouched.
- **Severity:** major
- **FitSD doc & section:** Charter §6; FSD-PRO §3; FitSD — Roadmap ("Tier 3 — Roles model")
- **Suggested fix:** when Tier 3 lands, either add an optional Product/Value Owner role or
  state explicitly that the Service Owner carries value accountability — silence is read as
  "nobody does".

### [S5-PM-2] Minor enhancements route to FSD-CH, but no backlog store exists and nobody ranks it

- **Kind:** gap
- **What I needed:** where eight teams' feature requests wait, and who prioritises them.
- **What the standard gave me:** FSD-PRO §1 splits demand cleanly: net-new goes through the
  front door (Idea Brief → Gate 1); "routine changes and minor enhancements are handled
  under the Change & Release capability (FSD-CH)". But FSD-CH is purely a risk-control
  capability (FSD-CH-1…4: assess, authorise, record, deploy) — it has no queue, no value
  test, no prioritisation mechanism. Information Stores names a demand/pipeline register
  for the front door and change records for changes *already decided*; a pending
  below-the-line enhancement has no named home. Of the three real requests in the
  simulation, two (SSH cert support, Terraform provider) trip FSD-PRO §1 triggers and
  become individual Gate 1 cases; the third (CT reporting) falls into FSD-CH and simply
  has nowhere to sit.
- **What I did about it:** invented a local "enhancement backlog" lane beside the demand
  register, with the (invented) product owner triaging items against the FSD-PRO §1 line.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §1 (Out of scope); FSD-CH (Requirements it carries);
  reference/FitSD — Information Stores (catalogue)
- **Suggested fix:** one line in Information Stores — a below-the-line enhancement queue
  (or an explicit statement that the demand register may hold sub-gate items), with a named
  prioritiser.

### [S5-PM-3] Prioritisation across the portfolio is implied but never assigned

- **Kind:** ambiguity
- **What I needed:** who ranks competing demand — across net-new cases, and between
  net-new and enhancements, when the delivering team is the constraint.
- **What the standard gave me:** FRM-01 §2 says to score the value lenses "anyway, for
  prioritisation" — so the standard *expects* ranking — but no role, forum or mechanism
  ever performs it. MoSCoW (Gate 2) prioritises requirements *within* one solution. The
  Approver decides go/park/reject per item, which is sequencing by side effect. The FSD-CH
  card's flow lens (gates as a WIP limit, Theory of Constraints) shows the author knows
  the constraint problem; the ranking half is missing.
- **What I did about it:** local call — product owner ranks, Approver still decides at
  gates; monthly ops review (an adoption-pack invention) is the venue.
- **Severity:** major
- **FitSD doc & section:** FSD-FRM-01 §2; FSD-PRO §5; FSD-CH ("The flow lens")
- **Suggested fix:** a sentence in FSD-PRO or the Govern card naming who orders the
  pipeline (even "the Approver, at the review cadence" would do).

### [S5-PM-4] Nothing measures adoption or satisfaction — and the standard knows

- **Kind:** gap
- **What I needed:** an instrument for whether the service is being adopted and whether its
  customers are satisfied — the basis of any adoption target or investment case.
- **What the standard gave me:** an honest confession. Standards Alignment §2 names FitSM
  PR3 Service Reporting as a known gap ("candidate thin requirement", see BACKLOG) and PR7
  Customer Relationship Management as a declared non-goal. What exists measures other
  things: DORA metrics are flow, the SAC availability SLO is uptime. In the simulation,
  the migration-progress reporting was a Gate 2 approver condition — invented per-project,
  exactly what a standing requirement would have made unnecessary.
- **What I did about it:** in character, made a monthly service report (adoption, tickets,
  satisfaction pulse) a condition of acceptance of the role.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Standards Alignment §2; BACKLOG ("Service
  Reporting (candidate thin requirement)")
- **Suggested fix:** promote the backlogged thin shall — "service performance is reported
  to stakeholders at a defined cadence" — folded into the FSD-GV-5 review, as the backlog
  itself proposes. Cheap, and it is the row a PM (and FitSM assessor) looks for first.

### [S5-PM-5] The EOL loop is real lifecycle thinking, but only fires at the deathbed

- **Kind:** friction
- **What I needed:** a point in the live phase where "should we invest more in this?" is
  asked — the grow/extend arm of a product lifecycle.
- **What the standard gave me:** FSD-RR-7's renew/replace/retire decision is genuine
  product-lifecycle machinery — *replace* routing back through the front door as new demand
  is a loop a PM recognises and approves of. But it triggers "when a service reaches end of
  life", and the FSD-GV-5 review is described as catching *drift* and surfacing *EOL
  candidates* (Govern card). Between acceptance and EOL the standard's stance is BAU.
  The model is internally coherent — new investment simply *is* new demand through the
  front door — but nobody is tasked with generating that demand for a live service, which
  compounds S5-PM-1.
- **What I did about it:** in character, asked for a product line (adoption, demand,
  investment case) in the annual review alongside the RR-7-feeding supplier-health check.
- **Severity:** minor
- **FitSD doc & section:** FSD-RR ("Where it meets Solution Development", FSD-RR-7);
  FSD-GV ("Where it meets Solution Development"); FitSD — Definitions ("End-of-life review")
- **Suggested fix:** one clause in the FSD-GV-5 or RR-7 note: the periodic review also asks
  whether a live service warrants *further investment*, routed as new demand.

### [S5-PM-6] The Gate 1 form is a better business case than most product organisations use

- **Kind:** worked-well
- **What I needed:** a fundable case format for the two feature requests that trip the
  net-new line.
- **What the standard gave me:** FRM-01 in full: primary driver (value/compliance/risk)
  with the explicit rule that low value scores don't weaken a mandated case; four plain
  value lenses; impact of doing nothing; why now; and a **case-expiry date** ("When does
  this expire?") — decay discipline most PM shops lack. Definitions states flatly that the
  Gate 1 record *is* the business case, "in the language leadership funds work in". Gate 2's
  MoSCoW-rated user stories are native PM practice already in the template. From this seat,
  the Solution Development spine is immediately reusable as roadmap machinery, one item at
  a time.
- **What I did about it:** nothing needed — praised it in the memo and adopted it as the
  vehicle for above-the-line roadmap items.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-01 §2–§5; FitSD — Definitions ("Business case")
- **Suggested fix:** —

### [S5-PM-7] The front door protects a roadmap owner from side-channel scope creep

- **Kind:** worked-well
- **What I needed:** confidence that eight consuming teams can't route around whoever
  prioritises.
- **What the standard gave me:** FSD-PRO §1 makes demand source-agnostic (anyone may raise
  it, all through the same door), the net-new triggers catch material requests *regardless
  of who asks or how small the tech seems*, and FSD-GV-4 retains parked and rejected demand
  with reasons — an institutional memory of "no" that most organisations lose. The
  anti-sprawl trigger doubles as an anti-scope-creep control: a "small" Terraform provider
  cannot slip in as a routine change. A PM inherits this protection for free.
- **What I did about it:** nothing needed — leaned on it in the memo.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §1 ("In scope", "Who may raise demand"); FSD-GV-4;
  reference/FitSD — Information Stores ("Demand / pipeline register")
- **Suggested fix:** —

---

**Summary judgement (out of character).** "Product" does not exist in FitSD as a thing with
a future: the unit is the *service* (provided, run, supported — Charter §8), and its
forward arc is acceptance → BAU → renew/replace/retire. That is a defensible scope choice
for an ops-facing standard, and the front door plus FRM-01 give a PM better *per-item*
machinery than most product stacks. But the connective tissue a PM needs — a value-owner
role, a home for the sub-gate backlog, a prioritiser, and any measure of adoption — must
all be invented locally. Three of the four are already acknowledged in the standard's own
Roadmap/BACKLOG (Tier 3 roles, service reporting), which is to its credit; the enhancement
backlog (S5-PM-2) appears genuinely unnoticed and is the cheapest to fix.
