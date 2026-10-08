---
name: customer-satisfaction-mlops
description: Resume project — ZenML+MLflow+Streamlit pipeline on Kaggle Olist data at ~/customer-satisfaction-mlops, public on GitHub
metadata:
  type: project
---

"Customer Satisfaction Prediction Pipeline" resume project at `~/customer-satisfaction-mlops`, built Jul 2026 for interview prep (see [[user_goals]]). Public: https://github.com/abhijitkar10/customer-satisfaction-mlops

Python 3.11 venv at `.venv` (system default 3.13 is unsupported by ZenML). Data: Kaggle `olistbr/brazilian-ecommerce` (9 relational CSVs) via kagglehub, joined AND aggregated to one row per order by `scripts/download_data.py`. Stack: ZenML 0.96 (ingest→clean→train→evaluate), MLflow 3.x (one run per execution, R²-gated registration, env-driven `MLFLOW_TRACKING_URI` falling back to local sqlite), Streamlit `app.py` loading `models:/customer_satisfaction_model/latest` with a committed `deployment/model.joblib` fallback.

v2 (commit ea29c37) results: 95,829 delivered orders, 17 features, RF RMSE 1.124 / R² 0.225; linreg R² 0.196; mean-guess baseline RMSE 1.277.

Key finding worth remembering: the v1 join fan-out (order item × payment) put the same order in both train and test and inflated R² to 0.089 vs an honest 0.025 — measured with a controlled comparison. Delivery features then took it to 0.225 (on-time orders average 4.29 stars, late 2.27).

`INTERVIEW_PREP.md` (pitch + v1→v2 story) and `MODULE_QA.md` (per-module design decisions + interviewer Q&A) hold talking points — both gitignored, verified absent from the public repo along with data and mlflow.db.

Known remaining flaws, deliberately documented not fixed: median imputation before the train/test split, and a random rather than temporal split on time-ordered data. Deployment steps still pending on the user's side: Streamlit Community Cloud and DagsHub hosted MLflow.
