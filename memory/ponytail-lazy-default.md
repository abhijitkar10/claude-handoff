---
name: ponytail-lazy-default
description: Always build the laziest working solution (ponytail) in every project — YAGNI, stdlib/native before deps, no scaffolding for later
metadata:
  type: feedback
---

Abhijit wants the **ponytail** approach applied by default when building in **any** project, not just when the plugin is invoked (instruction given 2026-09-06). The ladder: does it need to exist at all → is it already in the codebase → does the stdlib do it → does the platform do it natively → does an already-installed dep do it → can it be one line → only then minimum code that works.

Concretely: no interface with one implementation, no factory for one product, no config for a value that never changes, no scaffolding "for later". Deletion over addition. Shortest working diff. Non-trivial logic still leaves one runnable check behind.

**Why:** he pulled in the ponytail plugin and asked for it to be kept in mind always; a repo audit of [[quant-system-project]] found ~22% of the source was speculative scaffolding, which is the failure mode this prevents.
**How to apply:** before writing a new module/class/dep, climb the ladder and stop at the first rung that holds. Say in one line what was skipped and when to add it. Never simplify away input validation at trust boundaries, error handling that prevents data loss, security, or anything explicitly requested.
