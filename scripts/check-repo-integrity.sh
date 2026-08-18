#!/bin/sh

set -u

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
ERRORS=0

fail() {
  printf '%s\n' "ERROR: $*" >&2
  ERRORS=$((ERRORS + 1))
}

required_files='README.md
LICENSE
CHANGELOG.md
CONTRIBUTING.md
protocol/BANKA-DOCKING.md
templates/ADOPTION-ASSESSMENT.md
handoff/ASMP-HANDOFF.md
handoff/BANKA-HANDOFF.md
examples/clear-scope-existing-project/ADOPTION-ASSESSMENT.md
examples/unclear-scope-routed-to-asmp/ADOPTION-ASSESSMENT.md
examples/production-risk-stop/ADOPTION-ASSESSMENT.md
examples/ready-for-banka/ADOPTION-ASSESSMENT.md
scripts/check-repo-integrity.sh'

printf '%s\n' "$required_files" | while IFS= read -r file; do
  [ -f "$ROOT/$file" ] || printf '%s\n' "MISSING:$file"
done > "$ROOT/.integrity-missing.tmp"
while IFS= read -r missing; do
  [ -n "$missing" ] && fail "required file ${missing#MISSING:} is missing"
done < "$ROOT/.integrity-missing.tmp"
rm -f "$ROOT/.integrity-missing.tmp"

markdown_files=$(find "$ROOT" -type f -name '*.md' -print)

for source in $markdown_files; do
  source_dir=$(dirname "$source")
  awk '
    {
      line = $0
      while (match(line, /\]\([^)]*\.md([#?][^)]*)?\)/)) {
        link = substr(line, RSTART + 2, RLENGTH - 3)
        sub(/[?#].*$/, "", link)
        print link
        line = substr(line, RSTART + RLENGTH)
      }
    }
  ' "$source" |
  while IFS= read -r target; do
    case "$target" in
      http://*|https://*|mailto:*|'') continue ;;
    esac
    [ -e "$source_dir/$target" ] ||
      printf '%s\n' "BROKEN:${source#$ROOT/}:$target"
  done
done > "$ROOT/.integrity-links.tmp"
while IFS= read -r broken; do
  [ -n "$broken" ] && fail "broken relative Markdown link ${broken#BROKEN:}"
done < "$ROOT/.integrity-links.tmp"
rm -f "$ROOT/.integrity-links.tmp"

bad_names=$(find "$ROOT" -type f \( -iname '*adoption*assessment*.md' -o -iname '*assessment*adoption*.md' \) ! -name 'ADOPTION-ASSESSMENT.md' -print)
[ -z "$bad_names" ] || fail "non-canonical assessment filename found: $bad_names"

noncanonical_refs=''
for file in $markdown_files; do
  hits=$(grep -nE 'ADOPTION[_ ]ASSESSMENT\.md|Adoption-Assessment\.md|adoption-assessment\.md' "$file" 2>/dev/null || true)
  [ -z "$hits" ] || noncanonical_refs="$noncanonical_refs\n$file:$hits"
done
[ -z "$noncanonical_refs" ] || fail "non-canonical assessment filename reference found"

extract_statuses() {
  awk '/STATUS-VOCABULARY:START/{on=1;next}/STATUS-VOCABULARY:END/{on=0}on' "$1" |
    sed -n 's/^- `\(.*\)`$/\1/p'
}

readme_statuses=$(extract_statuses "$ROOT/README.md")
protocol_statuses=$(extract_statuses "$ROOT/protocol/BANKA-DOCKING.md")
[ "$readme_statuses" = "$protocol_statuses" ] ||
  fail "README and protocol status vocabularies differ"
[ "$(printf '%s\n' "$protocol_statuses" | sed '/^$/d' | wc -l | tr -d ' ')" = 6 ] ||
  fail "status vocabulary must contain exactly six entries"

secret_pattern='AKIA[0-9A-Z]{16}|-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|(^|[^A-Za-z0-9_])(password|passwd|secret|api[_-]?key|access[_-]?token)[[:space:]]*[:=][[:space:]]*[^][[:space:]]{4,}'
example_secrets=''
for file in $(find "$ROOT/examples" -type f -name '*.md' -print); do
  hits=$(grep -nE "$secret_pattern" "$file" 2>/dev/null || true)
  [ -z "$hits" ] || example_secrets="$example_secrets\n$file:$hits"
done
[ -z "$example_secrets" ] || fail "secret-shaped content found in examples"

copy_markers='SECTION 2: COMPLEXITY ASSESSMENT RUBRIC|TO THE AI AGENT READING THIS|THE CORE MAPPING CYCLE|<!-- BANKA:START -->|You are ingesting Banka|Scope Map — \[Initiative Name\]|Project Operating Protocol.*Senior Technical Lead'
copy_hits=''
for file in $markdown_files; do
  hits=$(grep -nE "$copy_markers" "$file" 2>/dev/null || true)
  [ -z "$hits" ] || copy_hits="$copy_hits\n$file:$hits"
done
[ -z "$copy_hits" ] || fail "known Banka/ASMP copy-regression marker found"

version_mismatch=''
for file in $markdown_files; do
  hits=$(grep -nE '(^|[^0-9])0\.[0-9]+\.[0-9]+(-draft)?' "$file" 2>/dev/null |
    grep -v '0\.1\.0-draft' || true)
  [ -z "$hits" ] || version_mismatch="$version_mismatch\n$file:$hits"
done
[ -z "$version_mismatch" ] || fail "another pre-1.0 version appears alongside 0.1.0-draft"

if [ "$ERRORS" -ne 0 ]; then
  printf '%s\n' "Integrity check failed with $ERRORS error(s)." >&2
  exit 1
fi

printf '%s\n' 'Integrity check passed.'
printf '%s\n' 'Limits: this structural scan cannot prove factual accuracy, evidence completeness, privacy safety, semantic originality, or external-protocol currency.'
