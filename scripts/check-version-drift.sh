#!/usr/bin/env bash
#
# check-version-drift.sh — guard against version claims creeping into the
# body text of the standard's documents.
#
# The version lives in exactly five places: document frontmatter, the VERSION
# file, CHANGELOG.md, the README and the Roadmap. A "v0.2" baked into a
# callout or a status table goes stale the moment a release is cut — the same
# drift the SAC count guard catches, one field over.
#
# Run:   bash scripts/check-version-drift.sh
# Exit:  0 = clean, 1 = a version claim was found in a governed doc's prose.
#
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

# A vN.N claim. Frontmatter writes `version: 0.3` with no leading "v", so
# anchoring on the v-prefix skips it.
pattern='\bv[0-9]+\.[0-9]+'

# The governed set: every framework doc except the ones whose job is to talk
# about versions (README, CHANGELOG, BACKLOG, Roadmap, Versioning Policy,
# RELEASING) — web/, which versions itself — and validation/, whose run
# records legitimately cite the version they tested (that is adoption
# working as the Versioning Policy describes, not drift).
hits="$(grep -rInE --include='*.md' \
  --exclude-dir='node_modules' \
  --exclude-dir='.git' \
  --exclude-dir='web' \
  --exclude-dir='docs' \
  --exclude-dir='validation' \
  --exclude='README.md' \
  --exclude='CHANGELOG.md' \
  --exclude='BACKLOG.md' \
  --exclude='RELEASING.md' \
  --exclude='FitSD — Roadmap.md' \
  --exclude='FitSD — Versioning Policy.md' \
  --exclude='*.local.md' \
  "$pattern" "$root" || true)"

if [[ -n "$hits" ]]; then
  echo "Version claim found in a governed document's prose. The version lives in"
  echo "frontmatter, VERSION, CHANGELOG.md, the README and the Roadmap — nowhere else:"
  echo
  echo "$hits"
  exit 1
fi

echo "OK — no version claims in governed docs' prose."
