---
name: kyc-rag-project
description: "RBI KYC RAG project lives at ~/Documents/life/kyc-rag (not ~/), the flagship resume project for retrieval/ML interviews"
metadata: 
  node_type: memory
  type: project
  originSessionId: 6ab2a557-be4d-48ad-b35b-2185b4b94497
  modified: 2026-08-26T17:11:04.719Z
---

Abhijit's **RBI KYC Compliance Assistant** (RAG over the 107-page RBI KYC Master Direction) lives at `~/Documents/life/kyc-rag` — inside the `life` Obsidian vault, **not** at `~/` like his other projects.

Built Jul 2026, from scratch with no LangChain: hand-written BM25 + BGE dense vectors fused with RRF, plus a BGE cross-encoder reranker. Headline result: recall@5 0.82 → 0.93 on a 50-question hand-verified eval set, with two documented negative results (clause-aware chunking, ms-marco reranker) kept in the repo deliberately.

The repo carries its own prep docs: `INTERVIEW_PACK.md`, `EXPERIMENTS.md`, `LAB_NOTEBOOK.md`, `INTERVIEW_5MIN_NOTES.md`.

**Why:** it's the strongest technical project on his resume for ML/retrieval interviews, and the measurement discipline (computing the fusion ceiling, publishing negative results) is what he leads with — see [[user_goals]].

**How to apply:** when he asks about "the RAG project" or "the KYC project", look in `~/Documents/life/kyc-rag`, not the home directory. Interview prep notes for it live in the `~/job` vault as `project_qa_kyc_rag.md`. Related: [[customer-satisfaction-mlops]].
