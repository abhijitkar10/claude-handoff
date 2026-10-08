---
name: claude-handoff
description: Private repo abhijitkar10/claude-handoff restores Claude config (memory, CLAUDE.md, skills, settings) and clones every project repo into the same layout on a new machine
metadata:
  type: reference
---

https://github.com/abhijitkar10/claude-handoff (PRIVATE — memory holds personal goals). `./restore.sh` installs memory/CLAUDE.md/settings/skills and clones all repos to the same paths as the Mac, so paths in other memories stay valid. Made 2026-10-08 when he moved to a Linux laptop.

To refresh it after memory changes: copy `~/.claude/projects/<mangled $HOME>/memory/` into the repo's `memory/`, commit, push.

Repo map (all abhijitkar10/): thoth-wtsc, minissd, answer-grader, customer-satisfaction-mlops, quant-multi-factor-system (WIP on branch wip/point-in-time-universe), major-project-b3 → ~/major-project-b3 (was ~/Downloads on the Mac), job-vault → ~/job, life-vault → ~/Documents/life (Obsidian; nested repos ignored), kyc-rag, rgm-tpo-docs → ~/Documents/life/Startup, promo-audit → Startup/promo-audit, graph-theory → ~/Documents/life/Academics/Graph Theory.
