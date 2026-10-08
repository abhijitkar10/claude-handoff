---
name: major-project-b3
description: B.Tech major project — add field-level counter/MAC indices to a DynamoRIO trace pipeline to measure Thoth's WTSC/WTBC gap; private repo major-project-b3
metadata:
  type: project
---

Oct 2026. Team brief (BTech_FieldLevel_Trace_Brief.pdf) from a research mentor: modify `canonicalize.py` to emit ctr/MAC field indices per write, validate block-level totals unchanged (ctree block-merge 67.35%), capture six workloads on x86-64 Linux.

Repo: https://github.com/abhijitkar10/major-project-b3 (PRIVATE — contains unpublished mentor notes; keep it private). `NOTES.md` there holds all findings and the Linux checklist. DynamoRIO excluded (1.5 GB; release URL in NOTES.md).

Open as of 2026-10-08: 64B vs 128B line size undecided; `llc_multi.py`/`metadata_model.py` not yet received; possibly no recapture needed since field index = f(addr) already emitted. Now on the Linux laptop (2026-10-08): DynamoRIO installed at ~/Research/Tools, working after an exec-bit fix; canonicalize.py flush bug fixed and pushed. Laptop is under the brief's bar: 11 GB RAM vs 16, 149 GB free vs 150. 2026-10-08: user said to decide everything without the mentor. Built path B (DECISIONS.md: 64 B, six workloads incl. hashmap_atomic, reconstructed llc_multi.py) and captured six traces into the repo's traces/ with Appendix C's offline method, using PMDK built from source with VALGRIND=0 (Ubuntu's PMDK breaks DR offline raw2trace via Valgrind client requests). NOT validated against 67.35%; label them as from a reconstructed pipeline. README.md is the runbook and work log; MENTOR_QUESTIONS.md is the meeting list. First WTSC vs WTBC look via thoth_on_traces.sh: gap zero for 4/6 (traces too short), swap 17%, hybrid-v = WTBC everywhere; preliminary.

Related: [[thoth-secure-nvm-project]] (hybrid-v answers the brief's "free WTBC via padding" question).

**How to apply:** treat NOTES.md as the source of truth; don't let shift amounts be guessed — the brief forbids it.
