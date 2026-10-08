---
name: tredence-internship-report
description: 7th-sem 1-credit Tredence internship report — source md in Obsidian, Word build via pandoc script; content deliberately generic
metadata:
  type: project
---

Internship report for the 7th-semester 1-credit course (written 2026-09-29). Source: `~/Documents/life/Internship/Tredence Report.md`. Output: `~/Documents/life/Internship/Tredence Internship Report.docx`, rebuilt with `~/Documents/life/Internship/.report-build/build.sh` (pandoc + `front.md` title/certificate/declaration + `filter.lua` page breaks/TOC + `reference.docx` A4, Times New Roman 12pt, 1.5 spacing, page numbers).

User asked for it to be filled without specifics and without confidential detail, so chapter 5 method claims (smoothing window, log-log elasticity, baseline checked on non-promo periods, question generation) are generic, not confirmed by him. No client names or figures. Databricks confirmed by him (2026-09-29); library list (PySpark, Spark SQL, pandas, NumPy, statsmodels, matplotlib, python-pptx, Git) chosen by me with his OK to name tools. Roll 231CS106 filled. Relieving letter (joined 13 May 2026, last day 13 Jul 2026, entity Tredence Analytics Solutions Pvt. Ltd., designation just "Intern") is `.report-build/certificate.pdf`, spliced in as page ii scaled to A4. Only placeholder left: faculty guide name.

PDF (the submission copy): `.report-build/make_pdf.py` renders the md with reportlab to exactly 15 pages (6 front pages roman i–vi, 9 body pages arabic). NITK publishes no internship-report format; layout follows the community NITK thesis Overleaf template (A4, Times New Roman 12pt, 1.5 spacing, 1in margins + 0.2in binding). Page count is sensitive to edits — the script prints it; chapters run on (only Chapter 1 starts a new page) to fit 15. ₹ replaced with Rs. (TNR has no ₹ glyph).

**Why:** he previously caught a fabricated resume bullet (what-if simulator) — see [[user_goals]].
**How to apply:** if he edits the report, rebuild with build.sh; if he confirms real methods/numbers, replace the generic claims. Never import RGM-TPO startup material into it (his own COI firewall).
