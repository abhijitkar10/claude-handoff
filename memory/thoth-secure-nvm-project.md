---
name: thoth-secure-nvm-project
description: Built ~/thoth-wtsc, a standalone C model of Thoth's (HPCA'23) PUB eviction policies; found WTBC==oracle, a composability bug in WTSC, and a zero-cost replacement policy
metadata:
  type: project
---

Aug 2026. Abhijit is working on *Thoth* (Han/Tuck/Awad, HPCA 2023, secure NVM partial-updates buffer). Papers in `~/thoth-wtsc/docs/`. Handwritten task list from his notebook (dated Jul 1) drove the work.

**Built: `~/thoth-wtsc`** — standalone trace-driven C model of Thoth §IV.B, no gem5. `make check` = 55 assertions. ~1,100 sweep runs in `results/`. Findings in `docs/findings.md`, artifact at https://claude.ai/code/artifact/ac21f5cc-20e3-4d5d-9baf-93d3e6c08e03

Results worth remembering:
- WTBC is decision-equivalent to an omniscient oracle (provable; asserted in the test suite).
- WTSC's status bit is NOT composable — layering extra discard rules on it breaks crash consistency (status-0 entries freeload on a status-1 "guarantor"). Found by the `--verify` checker, ~70k orphans per 2M writes.
- WTSC ≈ WTBC only while the metadata working set fits the metadata cache; past ~5-10x it costs MORE writes than the baseline (tpcc −37% at 1GB footprint).
- New policy `hybrid-v` (block dirty bit + value compare, no status bit) recovers 99.8% of the gap at zero storage vs WTBC's 56 bits/block. **This is the publishable contribution.**
- The 0.80 PUB eviction threshold is inert (<0.2 points across 0.50–0.99); adaptive is no better.

**Still open:** real trace capture (`docs/pm-trace-capture.md` has the DAX/KVM/gem5 recipe — needs a Linux box, none of it runs on his Mac); porting hybrid-v into gem5 for cycle numbers.

**Why:** systems/architecture research, adjacent to his storage-firmware track ([[minissd-firmware-project]]) rather than data engineering.

**How to apply:** He is building ON Thoth, not summarizing it. Favour concrete simulator/measurement work over exposition. The `--verify` invariant checker is what caught the real bug — keep that habit for any new policy.

**Not interview-ready (2026-09-06):** he says he is not well-versed in this one. Keep it off resumes and portfolio headlines — see [[defensible-projects-only]].
