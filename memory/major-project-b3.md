---
name: major-project-b3
description: B.Tech major project — add field-level counter/MAC indices to a DynamoRIO trace pipeline to measure Thoth's WTSC/WTBC gap; private repo major-project-b3
metadata:
  type: project
---

Oct 2026. Team brief (BTech_FieldLevel_Trace_Brief.pdf) from a research mentor: modify `canonicalize.py` to emit ctr/MAC field indices per write, validate block-level totals unchanged (ctree block-merge 67.35%), capture six workloads on x86-64 Linux.

Repo: https://github.com/abhijitkar10/major-project-b3 (PRIVATE — contains unpublished mentor notes; keep it private). `NOTES.md` there holds all findings and the Linux checklist. DynamoRIO excluded (1.5 GB; release URL in NOTES.md).

Open as of 2026-10-08: 64B vs 128B line size undecided; `llc_multi.py`/`metadata_model.py` not yet received; possibly no recapture needed since field index = f(addr) already emitted. He's moving to his Linux laptop to continue.

Related: [[thoth-secure-nvm-project]] (hybrid-v answers the brief's "free WTBC via padding" question).

**How to apply:** treat NOTES.md as the source of truth; don't let shift amounts be guessed — the brief forbids it.
