---
name: always-push
description: "User wants every commit pushed right away, without asking first"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 3c2fa11b-01e3-4863-8f42-adce68bdbcd9
  modified: 2026-10-02T16:54:18.222Z
---

After committing, push to the remote immediately; don't stop to ask "should I push?".

**Why:** User said "always directly push" (2026-10-03, in ~/fin) after I kept leaving commits local and asking.

**How to apply:** Commit + push in the same step on the current branch. Still never force-push, and still ask before outward-facing actions other than a normal push (PRs, repo settings, secrets). Related: [[job-vault-sync]].
