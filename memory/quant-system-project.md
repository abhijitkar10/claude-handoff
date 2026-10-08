---
name: quant-system-project
description: Multi-factor equity trading system, public on GitHub; Phases 0-4 built; IR 0.66 → 0.02 (point-in-time universe) → −0.15 (membership enforced per row, 27 Sep 2026)
metadata:
  type: project
---

Personal **multi-factor equity trading system** recreating the institutional architecture from the YouTube video "What Nobody Tells You About Being a Quant" (The Quant Insider, video id tzTftCzmr7k). Purpose: data-engineering + quant-finance portfolio piece and interview talking point — supports [[user_goals]].

Repo: `~/quant-multi-factor-system`, **public at https://github.com/abhijitkar10/quant-multi-factor-system** (pushed 2026-09-06). Package `qmf` under `src/`, `uv` + Python 3.12. CLI: `uv run qmf <universe|ingest|match|factors|backtest|status|phase1|point-in-time>`.

**Built (Phases 0-4), 62 tests, 9 deps:** point-in-time universe with membership intervals; yfinance price loader; OpenFIGI security matching (SCD-2); audit gate that halts the feed *before* writing; Delta Lake with time travel; `factors.py` (momentum/reversal/low-vol → z-scores → trailing-IC-weighted alpha → cross-sectional factor returns); `portfolio.py` (V = BFB'+diag(d) risk model, V^-1·alpha with projected constraints, linear costs, backtest, return attribution). `data/constituents.py` reconstructs **real point-in-time S&P 500 membership from Wikipedia revision history** (fetch the page as it existed on a quarterly grid; contiguous snapshot runs become intervals) — 700 tickers, 503 current + 200 departed, replacing the hand-seeded 43.

**Deliberate simplifications, marked `ponytail:` in source:** no cvxpy (41x41 solve is one numpy line); no market impact (unit-notional book has no capital base); sample covariance not Ledoit-Wolf (3 factors vs 1900 obs); weights held fixed between rebalances.

**THE headline finding (the best interview story here):** on the honest 604-name universe the backtest gives **IR 0.02, +0.15% net ann.** — versus **IR 0.66, +5.65%** on the 41 hand-picked names. The apparent edge was almost entirely survivorship bias. Deliberately NOT tuned afterwards. The IC t-stat weighting idea **was** then tested properly (protocol declared first: in-sample 2018-2022, held out from 2023-01-01, both rules reported either way) and **rejected** — 0.32 vs 0.33 held-out, no improvement; `add_alpha` normalises by sum of weight magnitudes so only relative ordering matters and momentum wins under either rule. Available as `qmf factors --weighting tstat`, default `mean`.

Both rules give IR ~0.02 full-period and ~0.33 from 2023 onward — that gap is a **period effect, not skill**; quote both, never just the 0.33. Signal ICs on the real universe: momentum +0.0202 holds up, reversal +0.0072, low_vol +0.0007 (noise, and it now destroys value because trailing-IC weighting fits noise and flips its sign).

**Second correction (2026-09-27): IR 0.02 → −0.15, held-out 0.33 → 0.03.** `factors.build` scored every name on every date; the universe only chose which tickers to download. 19.5% of ticker-days were outside membership (names scored years before joining). Fixed via `universe.filter_members` applied in `factors.build` before z-scoring. The 0.33 "period effect" was mostly this bug. **Current honest numbers: IR −0.15 full, 0.03 held out 2023+, momentum IC +0.0169.** Earlier figures below (0.02/0.33, ICs, attribution) are superseded.

**Remaining honest limitation:** universe is bias-free but price history is not — 99 of 197 departed names have no yfinance history. The free price vendor is now the binding constraint. Audit reflects this: `universe_coverage` gates only on still-listed names (100%), `delisted_coverage` is non-critical and reports 49.7%.

Attribution of the 5.81% gross: momentum +4.61%, low_vol +1.31%, reversal +0.39%, specific -0.49%. Low-vol pays positively because its negative IC makes the trailing-IC weight hold it short.

**Still planned:** 99 no-price tickers — many are renames (ABC→COR); can't be auto-matched from membership data (rename vs index replacement look identical), needs composite FIGI via security_master. Phases 5-6 (Spark, kdb+) are deliberately deprioritised: 1.2M rows fits in polars; Spark on a laptop is résumé-driven complexity.

Interview prep lives in the job vault (per [[job-vault-sync]]): `~/job/project_qa_quant.md` (full Q&A, all four bugs, the IR 0.66→0.02 killer answer in §5.1, recall sheet in Part 7) and `~/job/quant_domain.md` (study path: target quant-developer/DE roles not researcher; Grinold & Kahn chapter map, DDIA for the engineering half, what to skip). Both routed from START_HERE.

Docs in repo `docs/`: feature-plan.md, tech-stack.md, build-log.md (the interview script — records every bug found and why each simplification was made), reading-list.md. Book: Grinold & Kahn, *Active Portfolio Management*; Kleppmann's *DDIA* for the engineering half.

**Why:** interview-grade project aligned with stated career goals.
**How to apply:** build phase-by-phase per [[ponytail-lazy-default]]; log notable decisions and real-data findings in build-log.md.
