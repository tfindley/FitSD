# CertHub — Operator acceptance review (service desk, tier 1/2)

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub (child page of the runbook).

| | |
|---|---|
| **From** | Rafi Osman, service desk analyst (tier 1/2) |
| **To** | Marcus Webb; Owen Gallagher |
| **Date** | 2026-11-24 |
| **Re** | Written operator acceptance of the CertHub runbook, SOPs and companion docs |
| **Docs reviewed** | Runbook (2026-11-19) · Recovery procedure · User guide · Monitoring & incident profile · my triage guide |

Marcus — you asked me to put my acceptance in writing after the 17 Nov review session. I
gather it has already been minuted on the acceptance record, so let me set down what it
actually consists of. Since the session I have dry-run three of the runbook procedures on
paper, playing them as the person on the desk at 09:05 with a ticket open and a product
engineer typing in all caps. That is the test that matters to me. I have been on the desk
long enough to have inherited a runbook that began "ssh to the box" for a box I could not
ssh to, so I checked every step for three things: can *I* do it, do I know what normal
looks like, and does it tell me when to stop and hand off.

**Verdict up front: I accept, with fixes.** These are the best operational docs any
Platform service has handed the desk — genuinely — and I want that on record. But three of
the fixes below need to land before I am comfortable holding this queue on my own, because
right now the runbook's step-by-steps are written for someone with access I do not have
and am not supposed to have.

## Dry-run 1 — §5.1 ACME issuance failing for a team's deploy

The ticket this generates is the one I will see most: "Certificate issue or failure",
pipeline blocked, order URL pasted in if I am lucky.

- **Step 1 stalls me immediately.** `kubectl --context <team-ctx>` — I have no kubectl, no
  cluster contexts, and certainly none for *product teams'* clusters. Nor should I: the
  access row restricts admin to the Platform team, and I am not Platform. My actual first
  move is the portal order view, which the user guide (§5) rightly says shows the failing
  step in plain English — but that path lives in the user guide and my triage guide, not
  in §5.1. The runbook's own procedure starts past the point I can reach.
- Step 2: step-ca logs and the `aws route53` check are not mine either (no bastion, no
  `certhub-dns01` profile). The `dig` check I *can* run from my machine, and "propagation
  delay <5 min is normal" is exactly the calibration I need — more of that, please.
- Step 3 is the best line in the document: `403 namespace not onboarded` → point them at
  SOP-1 / user guide §3, "**Not an incident**." That sentence will save me an argument a
  week.
- Step 4, the severity call, I can make — the profile's triggers are clear (one team, no
  workaround = Sev2; ≥2 teams = Sev1). What is *not* written is the mechanics: when I
  classify a ticket Sev2 at 10:00 on a Tuesday, what exactly do I click to get it onto the
  Opsgenie rota? I assume the IM-02 path, but "I assume" is how the desk gets burned. One
  sentence in §7 or the triage guide, please.
- Nothing tells me what to say to the blocked team while triage happens. §5.3 has its
  ready-made line; §5.1 needs one ("nothing already issued is affected; your existing
  certs are fine; we are on the issuance path now").

**Where I'd stall:** step 1, inside a minute. My workable lane is portal order view →
user-guide §5 table → onboarding/known-error or escalate with the order URL attached. That
lane exists — but only in my triage guide, and the runbook does not mark where my lane
ends and on-call's begins.

## Dry-run 2 — §5.2 Expiry alert / renewal failure

- First oddity: the alerts themselves never reach the desk — Sev2 goes to Opsgenie, Sev3
  to `#platform-alerts`. What reaches me is the auto-raised JSM ticket at 14 days. Fine,
  but which request type does that auto-ticket land under? We registered two ("onboarding"
  and "certificate issue or failure") and an auto-generated expiry nudge is neither. Right
  now I think it falls into the catch-all, where it will look like a user-raised fault.
- Step 1: "look it up in the portal (Inventory → search CN)". **With what access?** The
  access model lists `certhub-admin` (Platform only) and `certhub-team-<n>` (product
  teams). There is no group that gives the service desk a read-only, estate-wide inventory
  view — and I need exactly that to do step 1 of my most common future ticket. This is my
  hard blocker. On paper I stall here; in practice I would be pinging Priya to look things
  up for me, which is precisely the single-person dependency this whole framework is
  meant to kill.
- Step 2 routes by `source`, and the routing is good: *issued* → not mine (kubectl/cmctl
  again — on-call's lane); *discovered, owned* → **mine**, nudge the owning team, offer
  migration — I can do that today if someone gives me a canned message; *discovered,
  unowned* → "on-call adopts it" — a clean handoff, well done.
- Step 3 escalates to Marcus by name. Names worry me. The escalation table (§7) is all
  named individuals with no hours and no absence cover. Priya → Jordan is a chain of two
  people who sit next to each other and take leave at Christmas like everyone else. What
  does the desk do with a Sev3 on 29 December when both are off and it is not worth
  paging? Write the cover down.
- Step 4, confirming `certhub_cert_expiry_seconds` moved: I believe I have Grafana viewer
  access from the existing stack, but nobody has confirmed I can see the two CertHub
  dashboards. Confirm it, and I gain a genuinely useful "is it fixed" check — the
  "healthy looks like" column in §2 is the sort of thing I never get given.

**Where I'd stall:** step 1, on portal access. The *logic* of this procedure is the best
in the runbook — the source-based routing matches exactly how the tickets will arrive.

## Dry-run 3 — §5.3 Portal / API down

- The italic header line — issuance and renewal are unaffected, say so early, caps it at
  Sev3 — is the single most valuable sentence in the runbook for my job. It hands me the
  severity call *and* the user-facing message in one breath. Every failure mode should
  open like this.
- Steps 1–3 (kubectl, logs, rollout restart) are not mine and never will be, and here
  that is fine — my lane is: confirm the probe alert, post the line above in the channel,
  classify Sev3, log, hand to Platform next business day. I only wish the runbook *said*
  that is the shape of it, rather than leaving me to derive it.
- Step 4 — Okta down, check status.okta.com — I can do that, and "portal login loops →
  Okta group missing" in the user guide §5 covers the adjacent ticket I will actually get.

**Where I'd stall:** nowhere, provided nobody expects me to run step 1. This is the model
procedure from the desk's side.

## The ones I deliberately did not dry-run

§5.5 (CA down), §5.6 (revocation/compromise), SOP-2 (ceremony), SOP-4 (break-glass): not
my lane, and the docs are honest that they are dual-control, bastion, Platform-only
territory. Good. My only ask: §5.6 should say explicitly what the *desk* does on a
suspected-compromise call ("page security and on-call immediately, touch nothing, keep
the caller on the line" — or whatever you want) because that call will come to the desk
first, at 09:00, from someone who read about certificates on the news.

SOP-1 (onboarding): the request type lands in my queue, but the approval step is
"Admin → Onboarding", which is `certhub-admin`, which is not me. So my part is: check the
request is complete, check the service register, route to Platform. Fine — but SOP-1 does
not name its actors per step, and it should, or I will be blamed for a two-day DNS lead
time I cannot influence.

## Required fixes

Before I hold the queue solo:

1. **Desk access pack, named and granted.** A read-only inventory/portal group for the
   service desk (call it `certhub-support`), recorded in the access model; my Grafana
   view on both dashboards confirmed; and an explicit written statement that tier 1/2 has
   *no* kubectl/bastion/AWS access and no procedure step assumes otherwise.
2. **Tier-1 lane marked in every §5 procedure.** One short opening block each: what the
   desk does, what it checks (portal, `dig`, status pages, Grafana), the exact stop line,
   and the handoff route. Or a per-section cross-link to the matching triage-guide entry.
   §5.3's italic header is the template — copy that pattern.
3. **Escalation table with hours and cover.** §7 gains: hours per row, cover when the
   named person is away, and the one-sentence mechanics of how a desk-classified Sev2
   ticket reaches the Opsgenie rota.

Before migration close (2026-12-18):

4. **Canned comms lines** for §5.1 and §5.2 (what I tell the affected team while triage
   runs), matching the §5.3 pattern.
5. **Ticket taxonomy sorted.** Where the auto-raised 14-day expiry tickets land (their own
   request type or a clearly marked sub-category), and a route for migration questions
   until 12-18 — the queue will be full of them.
6. **The triage guide brought under the same regime as the runbook** — dated, versioned,
   review-cycled, and in scope of the next operator review. It is the document I will
   actually be working from; today it is an unversioned child page.

## What is genuinely good — say it back to whoever set the bar

The incident profile registered in JSM is the first time the desk has been *given* the
severity call for a Platform service instead of guessing against IM-02's abstractions —
and the "cert <7 days, no renewal in flight = Sev2" trigger means I get to raise an
incident *before* the outage, which after the checkout weekend is the whole point. The
banner line ("a CertHub outage blocks new issuance and renewal only") is the thing I will
recite on every call. The user guide §5 table predicts, almost word for word, what users
will paste at me. The support hours and response targets are written down somewhere I can
quote. And someone walked me through the portal error surface in October *before* asking
me to sign anything in November — I have never had that before. Whatever process made all
of that happen: keep it.

## Formal position

**Accept with fixes.** My acceptance of the runbook and SOPs as the tier 1/2 operator
stands, conditional on fixes 1–3 landing before the desk is expected to hold the CertHub
queue without a Platform engineer on tap, and 4–6 by 2026-12-18. If fixes 1 and 2 are not
in by the first week of December I would like that recorded as a risk against the
Supportability row, because at that point the desk's "acceptance" describes a service
only Platform engineers can actually operate.

— Rafi
