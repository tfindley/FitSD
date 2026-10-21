---
title: "FitSD — Companion Profile — FitSM"
framework: FitSD
document: Companion Profile — FitSM
tier: 0
version: 0.4
type: reference (non-normative)
status: draft
owner: "Tristan Findley"
date: 2026-10-21
tags: [fitsd, reference, fitsm, companion, conformance, implementation-profile, non-normative]
---

# FitSD — Companion Profile — FitSM

> **TL;DR** — A worked implementation profile for a team that already runs a FitSM-based management system. Most of FitSD's spine is already met over there: this names which FitSM requirement answers which FitSD one, so you don't write a second management system. What's left is the part FitSM requires but doesn't ship — the front door, the gates and Service Acceptance — and running it gives you a defined way to meet PR1.2, PR1.3, PR13.3 and PR13.4. Non-normative: the requirements are in *FitSD — Requirements*, and conformance is the single model in *Charter* §7.

## Who this is for

You run FitSM. Your SMS is defined, your processes are documented, your assessor is satisfied. But solution development is where it keeps going wrong: new work arrives from the side, designs skip the operational questions, and services reach production without anyone having agreed what "ready" meant. FitSM told you to evaluate proposals and plan design and transition. It didn't tell you how.

That gap is what FitSD fills. This profile is the bridge: what you already have, what you still need, and where the forms feed your records.

**It is not a second conformance route.** FitSD has one conformance model — show each Tier 1 requirement is met, with your own documents (*Charter* §7). For you, "your own documents" are largely your FitSM SMS. This profile is the mapping that lets you say so.

## What you already have

Most of FitSD's spine is answered by your SMS. The table below is the mapping to cite in your implementation profile.

**Coverage** says how much of the FitSD requirement the FitSM one carries. **Full** means an assessor would accept the FitSM evidence as-is. **Partial** means FitSM requires the intent but not FitSD's specific bar — note what closes the difference.

| FitSD | FitSM | Coverage | Notes |
|---|---|---|---|
| **GV-1** scope | GR3.2 | Full | |
| **GV-2** one owner per service | *service owner* (FitSM-3 role model, guidance) | Partial | FitSM-1 has no "shall". Confirmed per service on the register at acceptance (FSD-PRO §7) |
| **GV-3** document control | GR2.4 | Full | |
| **GV-4** registers, pipeline, history | PR1.1 + GR2.3 | Full | Your service portfolio *is* the register; FitSM-2's phases (proposed / planned / production / retired) carry the pipeline and the history |
| **GV-5** review & improve | GR1.3, GR6.1–6.2, GR7.1–7.2, PR14 | Full | |
| **GV-6** roles & authority | GR2.2, GR4.1, PR12.4 | Full | |
| **GV-7** SAC baseline | — | **Owed** | FitSM's acceptance criteria are per service (PR1.3). The standing baseline above them is FitSD's addition |
| **GV-8** owner-change continuity | — | **Owed** | |
| **GV-9** service levels & reporting | PR2.1–2.3, PR3.1–3.3 | Full | FitSM is stricter — it has no best-effort option |
| **SD-1…7** front door, gates, acceptance, conditions | PR1.2, PR1.3, PR13.3, PR13.4 | **Owed** | The intent is required; the gates, forms and conditions are not. This is the profile's whole point — see below |
| **CH-1** risk & impact assessed | PR12.3 | Full | |
| **CH-2** authorised by risk | PR12.1, PR12.4 | Full | |
| **CH-3** recorded & reviewed | PR12.1, PR12.5 | Full | |
| **CH-4** controlled, repeatable, reversible | PR13.1, PR13.4–13.6 | Full | |
| **RR-1** incidents to targets | PR9.1, PR9.2 | Full | |
| **RR-2** major incidents | PR9.3, PR9.4, PR9.6 | Full | |
| **RR-3** root cause | PR10.1, PR10.2 | Full | |
| **RR-4** availability & capacity | PR4.4, PR5.2–5.4 | Full | |
| **RR-5** patching | PR6.3 (generic controls) | Partial | Per service, via the SAC Security row |
| **RR-6** per-service incident profile | — | **Owed** | PR9.1 and PR9.6 are organisation-level. The per-service triggers are FitSD's addition |
| **RR-7** end of life | PR1.3 lifecycle; FitSM-2 *retire service* | Partial → **Owed** | The lifecycle phase exists; the controlled decommissioning (data, access, SLA withdrawal, archive, knowledge) does not |
| **SA-1** risk register & acceptance | PR4.2, PR6.2 | Partial | Risks are assessed at planned intervals; no register and no formal acceptance by an owner. Record how you close this |
| **SA-2** least privilege, JML, review | PR6.5 | Partial | PR6.5 asks only for consistent access control. Per service, via the SAC Access row |
| **SA-3** backup, tested restore | PR4.3 (generic measures) | Partial | Per service, via the SAC Backup row — the *tested* part is FitSD's |
| **SA-4** exceptions | — | Partial | Per service, via the SAC Security row ("any departures recorded") |
| **SA-5** legal & regulatory | GR3.1, PR6.1 | Partial | GR3.1 requires these be "considered". Record how you evidence control |
| **SA-6** key management | PR6.3 (generic) | Partial | Per service, via the SAC Security row |
| **SC-1** supplier register & owner | PR8.1, PR8.2, PR1.4 | Full | |
| **SC-2** assessed before adoption | PR8.4 is periodic, not pre-adoption | Partial | At intake, via Gate 1 §6 vendor due diligence |
| **SC-3** expectations in agreements | PR2.4 (UAs "as needed") | Partial | Record how you close this where a supplier handles data |
| **SC-4** periodic review, EOL, exit | PR8.4 | Partial | PR8.4 covers the review; the *exit path* for critical dependencies is FitSD's |

> **Verify before you rely on it.** This mapping is indicative, like every table in *FitSD — Standards Alignment*. It is made against the FitSM release named in that document's Sources. Check it against your own copy, and against your assessor's reading, before putting it in front of one.

## What you still owe

Five things your SMS doesn't give you. This is the adoption case in one list.

1. **FSD-SD-1…7 — the front door.** Intake, two gates, Service Acceptance, and conditions tracked to closure. The substance of this profile.
2. **FSD-GV-7 — the ratified SAC baseline.** A standing set of thresholds every service's acceptance criteria inherit, instead of each project inventing its own.
3. **FSD-GV-8 — continuity on owner change.** Re-proving operating knowledge when the accountable owner leaves.
4. **FSD-RR-6 — the per-service incident profile.** What counts as an incident *for this service*, registered with your incident process.
5. **FSD-RR-7 — end of life.** Renew, replace or retire as a recorded decision, with controlled decommissioning.

And the thing you get back for it: adopting FSD-SD gives you **a defined, evidenced way to meet PR1.2, PR1.3, PR13.3 and PR13.4** — the FitSM requirements that are easiest to wave at and hardest to show. Your gate records become the evidence.

## Where the forms meet your records

The forms stay framework-neutral — an engineer filling in a Gate 2 shouldn't have to read FitSM requirement IDs. The mapping lives here instead. Each form carries an optional **Framework record(s)** header row; put your own record's identifier in it, and the two systems stay cross-linked (GR2.3 wants the execution of key activities recorded).

| Form / section | Serves | Produces or feeds |
|---|---|---|
| **FRM-00** Idea Brief | SPM *identify demand*; customer requirements arriving via CRM | A demand entry in the portfolio |
| **FRM-01** Gate 1 | **PR1.2** — proposal evaluated on predicted demand, required resources, expected benefits | The service proposal and its decision. Close to §1 *Conceptual design* of FitSM's Service Design & Transition Package template |
| **FRM-01 §6** new technology / vendor | PR1.4, PR8.1–8.2 | Supplier register entries |
| **FRM-02** Gate 2 | **PR1.3** — design and transition planned, considering timescales, responsibilities, technology, communication and acceptance criteria | The design and transition plan. Close to that template's §2 *Service and technical design* and §3.2 *Transition plan* |
| **FRM-02 §4** operational impact | The SPM interfaces — SLM, SACM, CAPM, ISM, SUPPM, CONFM | Inputs to those processes |
| **FRM-02** → delivery | SPM → CHM: requests for change to implement plans for new or changed services | Your RFC(s) |
| **FRM-03** Service Acceptance | **PR13.3, PR13.4** — deployment planned including acceptance criteria; releases built, tested and evaluated against them before deployment | Release acceptance. The portfolio entry moves to *production* (PR1.1); catalogue and SLA follow (PR2.1, PR2.2); the CMDB is updated (PR11.3) |

**Roles.** FitSD's Solution Owner and Service Owner both land on FitSM-3's *service owner* (one per service). The Approver is whoever your SMS already empowers to authorise at that level of risk — in many teams the SPM process manager for the gates, since they "ensure the lifecycle of new or changed services are managed". The SAC baseline is ratified by the **SMS owner** (GR1.1) and held as SMS documentation (GR2.1).

## The SAC, in your vocabulary

A word of warning on the term, because it will cause confusion in a room otherwise.

FitSM's service acceptance criteria are **per service**, set at design, covering functional and non-functional aspects. FitSD's SAC *baseline* is **organisation-wide and standing**. These are not rivals — they are two of the three layers set out in *FitSD — Service Acceptance Criteria*. Your FitSM per-service criteria are the third layer, the *Service SAC*; FitSD adds the standing layer above it that every service inherits, so each project designs to a known bar instead of negotiating one.

Where a criterion would otherwise set a value your SMS already owns, cite rather than copy — the Availability row points at the SLA, the Incident profile row maps onto your existing priority scheme rather than inventing severities. That table is in the SAC reference under *Running alongside another framework*.

## Standing it up

Work through *FitSD — Implementation Guide*, with these changes:

- **Skip the steps your SMS already covers** — scope and the management-system layer are done.
- **Step 4 (ratify the SAC baseline) is the one that matters.** It is new work, and it is where most of the value is.
- **Your implementation profile names this companion profile** as the source of its satisfaction mappings, so the organisation says once: *we run FitSM; these FitSD requirements are met over there; these five are ours to build.*
- **Record the partials.** Where the table above says Partial, write what closes the difference. An assessor reading your profile should never have to guess.

## See also

- `FitSD — Framework Charter` §7: the single conformance model and the profile pattern
- `FitSD — Requirements`: the requirements this profile maps
- `reference/FitSD — Standards Alignment` §2: the capability-level FitSM mapping and the sources
- `reference/FitSD — Service Acceptance Criteria`: the three layers, and *Running alongside another framework*
- `FitSD — Implementation Guide`: the stand-up checklist and the implementation profile
- `capabilities/solution-development/FSD-PRO`: the process this profile is recommending you adopt
