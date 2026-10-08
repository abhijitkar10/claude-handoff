---
name: minissd-firmware-project
description: "MiniSSD — SSD firmware simulator in C at ~/minissd, built for a storage-firmware JD; all 7 phases done 2026-08-25, live on GitHub, 18763 checks"
metadata:
  type: project
---

**MiniSSD** (`~/minissd`, public repo https://github.com/abhijitkar10/minissd,
CI green on gcc+clang+sanitizers) — an SSD firmware
simulator in C, built as a resume/interview project for a storage-firmware
job description (NVMe over PCIe, FTL, data path, unit tests, optimise for
memory/power/perf).

Deliberate constraints, agreed up front:
- **From scratch, no libraries** — same style as his RAG project. Every line
  has to be explainable in an interview.
- **Each phase ends with a number that gets printed**, not just code.
- **Resume bullets carry bracketed placeholders** — he fills them only with
  numbers he has personally watched the code print. Do not invent metrics.

Seven phases in `docs/ROADMAP.md`: 1 NAND model ✅ → 2 page-mapped FTL ✅ →
3 garbage collection ✅ → 4 wear levelling ✅ → 5 NVMe front end (SQ/CQ rings, doorbells, PRP) →
6 workloads + metrics + demand-paged mapping cache (the memory win) →
7 power-loss recovery (stretch).

Status 2026-08-25: **ALL 7 PHASES COMPLETE**, 18763 checks green, ~7000 lines,
pushed public, CI green on gcc+clang+sanitizers.
GitHub account is `abhijitkar10` (not abhijitkar). `make demo` runs three
measurement tools.

**Real numbers for the resume:**
- GC: greedy WAF 7.99 @ 7% OP, 3.80 @ 14%, 1.92 @ 28%; greedy < fifo < random.
- Sequential rewrites = WAF exactly 1.000. TRIM cut copies 29,825 → 5,008.
- Wear levelling: drive lifetime 130,246 → 189,383 host writes (**1.45x**);
  dynamic alone gives 1.29x for almost no cost. Erase spread 34 → 16.
- Static WL's cold copies *substitute* for GC work (total copying +<1%) —
  only because the workload is 90/10 skewed. Say that caveat out loud.

- NVMe: same 128 MiB moved at 4 KB vs 128 KB I/O = 260 vs 8.1 doorbells per
  MiB (32x), flash time flat at ~17.9 s. Protocol overhead measured apart
  from device time.

- Mapping cache: 60x less mapping DRAM projected at 1 TB (1024 MiB resident
  vs 17.1 MiB paged), costing 0.74-2.24 flash reads/op and WAF 2.44 -> 3.07.
  Write p50 500 us vs p99 25-47 ms (the GC tail). Live-page marks converted
  byte -> bit (256 MB -> 32 MB at 1 TB).

- Recovery: 10 crashes in a row on a full, actively-collecting drive = 31,730
  acknowledged writes, 1,943 blocks reclaimed, nothing lost. Crash mid-GC
  needs no special handling (write-before-disown ordering from phase 2 +
  sequence numbers). Full-scan recovery projected at ~8.4 min for 1 TB even
  16-way parallel — the measured argument for a checkpoint.

**All three resume bullets are fillable. The project is done.**

Caveats he must state rather than hide (all now written into README,
INTERVIEW.md and ROADMAP.md as an explicit "what this does not do" list):
map hit rate has a ~67% floor (one host write touches the same map page 3x,
so quote map rd/op instead); map compaction is unamortised, one command pays
~300 ms — the biggest tail left; no recovery checkpoint (O(drive) scan);
TRIM does not survive a crash (legal under NVMe); two knobs picked not swept
(static WL threshold 16, map region 4x); single die, no parallelism modelled.

Next work if he returns: the recovery checkpoint is the highest-value item,
then amortising map compaction.

**Real bug worth retelling in interviews:** controller phase bit and host
expected phase were one variable. Passed everything until the CQ wrapped for
the first time (8th command on an 8-deep queue), then every command hung.
Known untuned: static WL threshold (16) was picked, not swept.

He asked Claude to build phase 2 too, after being told he should write it
himself. If he keeps handing phases over, the honest framing is the one from
[[rbi-sebi-rag-project]]: Claude builds, he verifies and rehearses from
`docs/INTERVIEW.md` before claiming it.

Per-phase habit (same as [[capture-decisions-and-interview-prep]] on his
startup work): every phase updates `docs/DESIGN_DECISIONS.md`
(decision → alternatives → why), `docs/INTERVIEW.md` (Q&A) and
`docs/BUILD_LOG.md` in the same turn as the code. Docs use plain language,
short sentences, terms defined on first use — he is learning storage from
zero here.

Related: [[user_goals]] (placements + Dubai), [[quant-system-project]].

**Not interview-ready (2026-09-06):** he says he is not well-versed in this one. Keep it off resumes and portfolio headlines — see [[defensible-projects-only]].
