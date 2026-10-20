# Flipkart Big Billion Days (BBD) Capstone Analytics Pipeline

## Project Overview
This repository contains a complete, traceable 4-part end-to-end data analytics pipeline analyzing Flipkart's "Big Billion Days" sale dataset. All currency values are calculated in Indian Rupees (INR).

## Tools & Environment
* **SQL Compiler & Dialect**: SQLite (via web-based compiler)
* **Spreadsheet Tool**: Google Sheets / Microsoft Excel
* **Dashboard Specification**: Designed for Tableau Public (`docs/dashboard_spec.md`)
* **AI Assistant**: Utilized for query generation and structure assistance under strict human-in-the-loop verification (`docs/ai_log.md`)

## Executive Summary & Key Findings
1. **Regional Leadership**: The North region led regional performance with **119,300 INR** in completed order revenue, driven heavily by high-ticket electronics.
2. **Category Dominance**: Electronics generated **142,300 INR** (approx. 41% of total revenue), closely followed by Home goods (**126,400 INR**), while Apparel lagged behind at **77,500 INR**.
3. **Monthly Growth Momentum**: Total sales exhibited positive month-over-month acceleration from September (106,400 INR) through November (129,100 INR), led by surging demand in the Home category.

## Repository File Index
| File Path | Description | Project Part |
| :--- | :--- | :--- |
| `README.md` | Project documentation, tool stack, index, and summary | Root / Submission |
| `sql/00_schema_and_seed.sql` | Database schema definition and seed data insert script | Part A |
| `sql/q01.sql` to `sql/q13.sql` | Individual SQL reporting and analytical queries | Part A |
| `sql/d1_corrected.sql` | Corrected SQL query for AI verification scenario D1 | Part D |
| `results/query_results.md` | Row counts and markdown result tables for queries q01–q13 | Part A |
| `data/orders_enriched.csv` | Exported full order-level enriched fact table (q09) | Part A / B |
| `data/orders_clean.csv` | Cleaned and filtered completed orders dataset (63 rows) | Part B / C |
| `docs/spreadsheet_notes.md` | Spreadsheet formula notes, validation, and reconciliation | Part B |
| `docs/dashboard_spec.md` | Tableau dashboard specification, layout, and business narrative | Part C |
| `docs/ai_log.md` | AI assistance prompts, defect logs, and human-in-the-loop protocol | Part D |

## Assumptions
* Revenue is strictly defined as the sum of `amount` over orders where `status = 'completed'`.
* Missing order amounts (`NULL`) are handled via data cleaning pipelines and excluded from completed revenue aggregates.
