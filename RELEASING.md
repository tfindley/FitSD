# Releasing FitSD

How to publish changes — and how to tell an ordinary edit from a new version of the
standard. The public-facing policy is [FitSD — Versioning Policy](./FitSD%20%E2%80%94%20Versioning%20Policy.md);
this is the operator's checklist.

> **Two repos.** This repo is the **standard** (the canonical Markdown + `VERSION`). The
> **website** ([fitsd.tfindley.dev](https://fitsd.tfindley.dev)) is built by a separate repo,
> [`tfindley/fitsd-web`](https://github.com/tfindley/fitsd-web), which vendors this standard at
> chosen **git refs** (a tag per released version, a branch per preview) and renders them as a
> multi-version site. When you push here, `.github/workflows/dispatch-web.yml` fires a
> `repository_dispatch` at fitsd-web, which rebuilds and publishes the live image. This repo never
> builds the site.

## The mental model: three streams

| Stream           | What it is                                                     | Version bump?           | How to ship                                   |
| ---------------- | -------------------------------------------------------------- | ----------------------- | --------------------------------------------- |
| **Website**      | Styling, layout, search, build config                          | `fitsd-web` only        | Commit in **fitsd-web**; its CI rebuilds       |
| **Spec errata**  | Typos, clarifications, rendering fixes — *no normative effect* | **None** (see below)    | Depends on the current-channel binding         |
| **Spec release** | New or changed **requirements** (normative)                    | `VERSION` (semver)      | Bump + tag + push (below), then promote in fitsd-web |

Decide which stream you're in *before* you push: if you changed what FitSD *requires*, it's a
release; otherwise it isn't.

> **Is it normative?** If an adopter could become non-conformant — or newly conformant —
> because of your change, it's normative → a release. Reworded the same requirement, fixed
> a typo, redrew a diagram, edited an explanatory page? Not normative → errata.

## Cutting a spec release

When you've made (or are about to make) a **normative** change, cut a version. A release is a
deliberate, reviewable act: bump `VERSION`, tag, push.

1. Finish the work on the version's branch (e.g. `v0.3`) and update `CHANGELOG.md` (promote
   `## Unreleased` → `## vX.Y.Z — <date>`). Run the guards below.
2. Bump the root **`VERSION`** to the new number and commit (merge the branch to `main` per your
   flow).
3. **Tag** `vX.Y.Z` and push: `git push --follow-tags`. The tag is the immutable snapshot the site
   will bind the version to.
4. keystone's `dispatch-web.yml` fires on the branch push and the new tag → fitsd-web rebuilds.
5. **Make it current** (in the `fitsd-web` repo): `npm run promote -- X.Y` — flips the new version
   to `role: current` bound to the `vX.Y.0` tag, and the outgoing current to `role: previous`.
   Review the `channels.manifest.mjs` diff, commit, push. fitsd-web publishes `:latest`; the host's
   Watchtower redeploys.

Pick the number with semver (see the Versioning Policy): **MAJOR** = breaking normative change,
**MINOR** = backward-compatible normative addition, **PATCH** = normative-neutral correction you
still want numbered.

## Errata to the current version

The site's **current** channel is pinned to an **immutable tag** (e.g. `v0.2.0`), so — unlike the
old "`main` is live" model — a typo fix committed to `main` does **not** change the published
current version. To ship errata to current, pick the team's policy (record it here):

- **Patch-tag (recommended, keeps versions immutable):** commit the fix, cut a **patch tag**
  (`v0.2.1`), push, then bump the current channel's `ref` to `v0.2.1` in
  `fitsd-web/channels.manifest.mjs` and push fitsd-web. The published version stays a frozen tag.
- **Branch-bound current (live errata):** bind the current channel to a release branch (e.g.
  `release/0.2`) instead of a tag in `channels.manifest.mjs`; then errata pushed to that branch
  republish in place (fitsd-web's nightly + dispatch pick it up). Trade-off: the current version is
  no longer immutable.

Preview/future channels already track a **moving branch**, so edits to `v0.3` publish to `/0.3/`
on the next dispatch/nightly rebuild without a tag.

## Style guards

A few conventions keep the standard consistent and its history legible.

- **Log changes as you go.** Notable and normative changes go in [`CHANGELOG.md`](./CHANGELOG.md) under `## Unreleased` **when you make them** — reconstructing it from memory at release is how detail gets lost. At release, promote `## Unreleased` to `## vX.Y.Z — <date>`.
- **No version claims in prose.** The version and status live in document frontmatter, the `VERSION` file, [`CHANGELOG.md`](./CHANGELOG.md), the README and the Roadmap — nowhere else. Normative and reference documents never state a version in body text: a "v0.2" baked into a callout goes stale the moment a release is cut. Run `bash scripts/check-version-drift.sh` before a spec release (it fails on a `vN.N` in a governed doc's prose).
- **Reference the SAC by name, never by count.** The Service Acceptance Criteria are referenced by name throughout — the set is versioned with the framework, and no document states how many there are. This is what stops the "eight vs nine" drift ([GitHub #7](https://github.com/tfindley/FitSD/issues/7)) from recurring. Run `bash scripts/check-sac-drift.sh` before a spec release (it fails if a number-word slips in before "SAC"/"criteria").
- **Define the SAC once.** The criteria are *defined* in [`reference/FitSD — Service Acceptance Criteria`](./reference/FitSD%20%E2%80%94%20Service%20Acceptance%20Criteria.md); the process and forms reference them by name and carry only their stage column (Gate 2 = design approach, Service Acceptance = evidence). Don't re-describe a criterion elsewhere.

## What the website does with all this

- fitsd-web vendors this standard at the refs named in its `channels.manifest.mjs` — the published
  version of each channel comes from that ref's root `VERSION` file, so the standard drives the
  site, not the reverse.
- The version switcher shows the **current** version (site root `/`) plus every other channel
  (preview at `/0.3/`, previous at `/0.2/`, …); switching stays on the same page where it exists.
- Mermaid diagrams are rendered to static SVG inside fitsd-web's Docker build (`RENDER_MERMAID=1` +
  a headless browser in the build stage only); local builds fall back to code blocks.
