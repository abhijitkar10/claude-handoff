#!/usr/bin/env bash
# Restore Claude Code setup and every project repo on a fresh machine.
# Needs: git and gh, logged in (`gh auth login`) -- most repos are private.
set -euo pipefail
cd "$(dirname "$0")"

C="$HOME/.claude"
P="$C/projects/$(printf '%s' "$HOME" | tr '/' '-')"   # Claude keys memory by $HOME with / -> -
stamp=$(date +%s)
mkdir -p "$C" "$P"

put() {  # copy, backing up whatever was already there
  if [ -e "$2" ]; then mv "$2" "$2.bak-$stamp"; echo "  backed up $2"; fi
  cp -R "$1" "$2"; echo "  $2"
}

echo "== Claude config"
put CLAUDE.md     "$C/CLAUDE.md"
put settings.json "$C/settings.json"
put skills        "$C/skills"
put memory        "$P/memory"

echo "== Repos"
clone() {
  local dest="$2"
  if [ -e "$dest" ]; then echo "  skip $dest (exists)"; return; fi
  mkdir -p "$(dirname "$dest")"
  if gh repo clone "abhijitkar10/$1" "$dest" -- -q 2>/dev/null; then echo "  $dest"
  else echo "  FAILED $1 -> $dest"; failed=1; fi
}
failed=0
clone thoth-wtsc                  "$HOME/thoth-wtsc"
clone minissd                     "$HOME/minissd"
clone answer-grader               "$HOME/answer-grader"
clone customer-satisfaction-mlops "$HOME/customer-satisfaction-mlops"
clone quant-multi-factor-system   "$HOME/quant-multi-factor-system"
clone major-project-b3            "$HOME/major-project-b3"
clone job-vault                   "$HOME/job"
clone life-vault                  "$HOME/Documents/life"           # before its nested repos
clone kyc-rag                     "$HOME/Documents/life/kyc-rag"
clone rgm-tpo-docs                "$HOME/Documents/life/Startup"
clone promo-audit                 "$HOME/Documents/life/Startup/promo-audit"
clone graph-theory                "$HOME/Documents/life/Academics/Graph Theory"

echo
if [ "$failed" = 1 ]; then
  echo "Some clones failed. Check 'gh auth status', then re-run -- finished repos are skipped."
  exit 1
fi
echo "Done. Next: README.md, 'After restore'."
