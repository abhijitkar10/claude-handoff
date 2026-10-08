---
name: job-vault-sync
description: Always update the Obsidian job-vault notes when project facts change — project_qa_mlops.md, START_HERE.md, mlops_deep_dives.md
metadata:
  type: feedback
---

When anything changes about the Customer Satisfaction MLOps project (see [[customer-satisfaction-mlops]]) — numbers, architecture, findings — also update the Obsidian vault notes at `~/job/`, without being asked each time:

- `project_qa_mlops.md` — the main interview study note (Parts 1–8; Part 7 is the recall sheet)
- `START_HERE.md` — the vault index; its routing line for the project and the "three things to say before they ask" list both cite project numbers
- `mlops_deep_dives.md` — niche overflow (drift, A/B, feature importance)

**Why:** Abhijit studies from the vault, not from the repo. The repo docs are the source of truth; the vault is his recall layer. A stale number there is one he'd quote in an interview.

**How to apply:** These notes cross-reference each other with `[[wikilinks]]` and repeat key numbers in several places (glossary, narrative, Part 7 table, traps table) — grep for every stale figure rather than patching one section. Match his existing voice: British spellings, blockquote callouts, "how to say it" boxes. The kyc-rag project has a parallel set (`project_qa_kyc_rag.md`, `kyc_deep_dives.md`) that likely deserves the same treatment.
