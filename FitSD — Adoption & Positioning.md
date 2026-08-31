---
title: "FitSD — Adoption & Positioning"
framework: FitSD
document: Adoption & Positioning
tier: 0
status: draft
type: explanatory (non-normative)
owner: "Tristan Findley"
date: 2026-06-23
tags: [fitsd, adoption, positioning, pitch, executive-summary, explanatory]
---

# FitSD — Adoption & Positioning

> **What this is.** The *who, why and how-far* of FitSD: the pitch (a spoken version and a one-pager for whoever holds the budget), who picks it up, what pulls them in, and how it fits teams of different sizes. None of it is normative; it adds no requirements. The framework stays lean. This is the story around it.

## 1. The case, in a line

FitSD gives a technical team just enough governance to take on the right work and ship it so it can be run. And, just as usefully, a shared language for getting a yes out of the people who hold the budget.

## 2. The pitch

The short forms: a pitch to say out loud, and a one-pager to hand to whoever holds the budget.

**One line.**
FitSD is just enough process for a small team to take on the right work and ship it so it lasts: one front door for new work, and a "done" that means *operable*, not merely running.

**The thirty-second version.**
Small teams can't run ITIL. It assumes a department and a budget for process nobody has. But they still have to decide what's worth building, design it so it can actually be run, and avoid the 2 a.m. page for something nobody wrote down. FitSD is the smallest amount of that discipline a handful of people can keep up. New work enters through one front door with two quick decision gates (*is this worth doing?* then *is it ready to build?*) and nothing goes live until it's proven ready: documented, recoverable, secure, monitored, supportable. It keeps what ITIL, ISO 20000 and FitSM get right, and drops everything a small team can't sustain.

**The version that actually lands (talking upward).**
Ever watched a good idea die because there was no clean way to pitch it? FitSD turns "we need to replace the ageing build pipeline" from a nervous corridor conversation into a one-page proposal with a yes/no at the bottom, in the language leadership already speaks: the driver, the cost of doing nothing, the options, the effort. It gets technical teams heard and funded, then makes sure what they ship can actually be run and supported. Governance that works *for* the team, not on it.

### The one-pager

**The problem.** Frameworks like ITIL and ISO/IEC 20000 are built for organisations with a department, a budget, and people whose whole job is process. Most teams have none of that. Yet they carry the same risks: effort spent on work that was never worth doing, and services that go live but can't be supported, recovered or secured. Good ideas die for want of a way to pitch them, and the things that do ship come back as out-of-hours incidents and audit findings.

**What FitSD is.** A distillation of mainstream service-management and security practice (ITIL 4, ISO 20000, FitSM) down to the smallest amount a handful of people can actually sustain, vendor- and organisation-neutral, released under CC BY 4.0 so any team can adopt and adapt it. Two commitments set it apart: **one front door** (a single intake and two light decision gates: effort is earned at a gate; nothing is built on a whim) and **readiness as the finish line** (nothing reaches live service until it is *evidenced* as ready, documented, recoverable with a tested restore, secure, access-controlled, monitored and supportable).

**How it stays light.** FitSD owns only a thin set of testable requirements. It ships a full, ready-to-use process for one capability — Solution Development, the front door — and for the others (govern; change & release; run & restore; secure & assure; supplier & supply chain) it states the requirement and points at the standard or process a team already runs. That is how it can require change, incident and security discipline *without rebuilding those disciplines*: the single design choice that keeps it lightweight rather than just claiming to be.

What an adopting team actually gets is §3; where FitSD is the wrong tool is §7.

## 3. Why a team actually adopts it

Most lightweight-ITSM material sells control. FitSD's real pull is the opposite: it helps technical people get heard.

The "talking upward" pitch above isn't rhetoric. It's literally what the forms produce. The Idea Brief and the Gate 1 Outline Proposal *are* the one-page proposal with a yes/no at the bottom: the **business case** for the work; the driver, the cost of doing nothing, the options and the effort are its section headings. For an engineer who has watched good ideas die for want of a way to pitch them, that's the hook.

The rest follows from there:

- **Readiness is built in.** The acceptance criteria stop you shipping things that run but can't be supported, recovered or secured: the exact failure mode that becomes a 2 a.m. page or an audit finding.
- **Credibility without a PMO.** It leaves the evidence trail customers and auditors ask for — acceptance records, a risk register, change records — without an enterprise governance team to produce it.
- **An on-ramp, not a dead end.** It maps cleanly onto ISO 27001 and NIS2 (see *Standards Alignment*), so the discipline you build early isn't wasted if you grow into the heavier standards.

## 4. The use case worth leading with

Talking upward is where FitSD earns its keep.

**Engineer to manager.** Fill the Idea Brief to frame the need, then Gate 1 to make the case. You walk in with a proposal, not a problem; your manager gets something they can compare against the last three, instead of another corridor pitch.

**Team lead to the board.** Stack the Gate records up and you have a portfolio view: here's our demand, here's what we propose, here's what we need to proceed. The gates *are* the governance conversation. Leadership steers by approving, parking or rejecting at Gate 1, and funds the build at Gate 2. It puts the team's work in the language of risk and investment the board already uses.

Either direction, the trick is the same: the form does the framing. The hard part of talking to leadership — structure, brevity, a clear ask — is baked into the template, so you don't have to be good at it on the day.

## 5. Where Solution Development sits

Demand feeds in from across the business; the outputs feed the operational disciplines. Compliance is one lane of several — not the whole story — and what you learn running a service (a nasty incident, a capacity ceiling) loops back round as fresh demand.

```mermaid
flowchart LR
    subgraph IN["Demand sources → requirements"]
      direction TB
      I1["Strategy & leadership<br/>directives, OKRs, new products"]
      I2["Customer & market<br/>requests, bids, SLAs, contracts"]
      I3["Compliance & governance<br/>regulation, audit, exceptions"]
      I4["Risk & security<br/>risk register, vuln/incident findings"]
      I5["Operational & technical<br/>EOL/EOS, capacity, tech debt, cost"]
      I6["Finance & people<br/>budget pressure, cost targets, headcount/skills"]
    end
    SD{{"Solution Development<br/>Gate 1 → Gate 2 → Service Acceptance"}}
    I1 --> SD
    I2 --> SD
    I3 --> SD
    I4 --> SD
    I5 --> SD
    I6 --> SD
    subgraph OUT["Outputs → operational disciplines"]
      direction TB
      O1["Service catalogue / portfolio<br/>live service + owner"]
      O2["Change & release — FSD-CH"]
      O3["Run & restore — FSD-RR<br/>incident, problem, patching, monitoring, availability"]
      O4["Secure & assure — FSD-SA<br/>risk, exceptions, security"]
      O5["Finance & suppliers<br/>run-cost, licensing, supplier mgmt"]
    end
    SD --> O1
    SD --> O2
    SD --> O3
    SD --> O4
    SD --> O5
    O3 -.->|"learnings become new demand"| IN
```

Six families of demand come through that door: strategy and leadership; customer and market; compliance and governance; risk and security; operational and technical; finance and people. It has to read plainly to all of them, which is why Gate 1 stays in business language, not security jargon.

## 6. Fit by organisation size

| Size | What FitSD is to them | Why they'd adopt it |
|---|---|---|
| **Solo / very small (1–5)** | Mostly self-discipline — the front door plus a service register | It stops you shipping things you, alone, can't support later |
| **Small team in a bigger org** | A defensible intake that plugs into the parent's existing change, incident and governance | It gets the team heard and funded, without inheriting the parent's weight |
| **SMB (10–200)** | The whole lightweight management system, and the on-ramp to ISO 27001 / NIS2 | Credibility to customers and regulators, with no enterprise PMO |
| **Enterprise** | A team-level front door feeding the heavier ITIL machinery | Local discipline; it was never meant to be the system of record |

## 7. Where FitSD is the wrong tool

- **Not a full ISMS or ITIL** when certification scope, scale or a contract actually demands the heavy apparatus: a formal risk methodology, a Statement of Applicability, internal audit. FitSD is the on-ramp, not the destination.
- **Not for routine change.** Day-to-day BAU belongs in Change & Release (FSD-CH), not the gates. The scope test in `FSD-PRO §1` exists precisely to keep it out.
- **Little to add** for a team already running mature ITIL or ISO that works — beyond, maybe, borrowing the intake-first pattern as a front door.

## 8. The adoption journey

Nobody adopts a framework by reading it end to end. They take one step, get a win, and come back for the next. FitSM understood this. Its real engine isn't the standard, it's the ladder of certifications that always gives people a next rung. FitSD has no certification body, but it can offer the same shape: a visible next step at every stage.

1. **Discover: "is this even for me?"** Two minutes with the README should settle it. If you're a small team stuck between "just ship it" and "we really should have a process," you're the audience.
2. **Try: one project, this week.** Don't adopt the framework. Take one real piece of work and run it through the front door: a one-page Idea Brief, a Gate 1, and the Definition of Done at the end. One real piece of work (with a genuine trigger and trade-offs that could go either way) tells you more than any amount of reading. One project is enough to feel whether it helps.
3. **Adopt: make it the default.** Copy the four forms and **ratify your SAC baseline**, your own thresholds, set once and inherited by every solution. Agree the requirements you'll actually hold to, and point Change, Incident and Security at the processes you already run. *FitSD — Implementation Guide* walks the whole standup. Now everything new comes through the same door.
4. **Mature: find your level.** The self-check (0–5 per capability) tells you where you stand and what one notch better looks like. It's the no-bureaucracy answer to FitSM's Foundation / Advanced / Expert ladder: a compass, not a certificate.
5. **Share: close the loop.** Send back a worked example, a capability you've fleshed out, or a fix. The framework gets better one contribution at a time, from everyone who passes through.

The most persuasive thing FitSD can have is a **worked example**: a real project, messy, with a genuine trigger and decisions that could have gone either way. One of those brings people on board far better than any amount of explanation, which is why a public one sits high on the roadmap. Lead with the story, not the spec.

---

*Companion documents: `FitSD — Framework Charter` (what it is), `FitSD — Requirements` (the spine), `FitSD — Standards Alignment` (how it maps to ISO 27001 / NIS2 / ITIL / FitSM), `FitSD — Diagrams` (the visuals).*
