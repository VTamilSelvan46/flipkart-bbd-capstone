# Part D — AI-Assisted Analysis with Human-in-the-Loop Verification

## 1. Five-Part Prompt for Part A (Query q13)
- **Role**: You are an expert SQL analyst specializing in SQLite and relational analytics reporting.
- **Task**: Write the SQL query q13 to compute rep performance against monthly targets for completed orders.
- **Context**: Schema consists of tables `reps` (rep_id, rep_name, region, monthly_target), `customers` (customer_id, first_name, last_name, region, rep_id), and `orders` (order_id, customer_id, item, quantity, amount, status, order_month). Dialect is SQLite.
- **Constraints**: Restrict to completed orders only (`status = 'completed'`). Group by rep name, order month, and monthly target. Compute performance tiers directly using conditional expressions (Below Target when revenue < monthly_target; On Target when monthly_target <= revenue < 1.1 * monthly_target; Above Target otherwise). Do not use `WITH` clauses, stored procedures, or aggregate aliases in `WHERE`.
- **Format**: Return raw SQL only, structured cleanly with inline comments.

---

## 2. Inspection of Scenario D1
The assistant's original response contained the following defects:
| Defect Description | Classification | Correct Clause / Fix |
| :--- | :--- | :--- |
| `FROM sales` (non-existent table) | Fake Method / Function | Join `orders` and `customers` tables on `customer_id`. |
| `region_name`, `total_sales` (non-existent columns) | Fake Method / Function | Use `c.region` and `SUM(o.amount)`. |
| `WHERE SUM(total_sales) > 80000` (aggregate in WHERE) | Logic Error | Move the aggregate condition into a `HAVING` clause. |
| "North's revenue grew 38% month over month" | Phantom Statistic | Replace with true calculated variance based on seed data. |

---

## 3. Verification of Scenario D1
- **Corrected Query Result (`sql/d1_corrected.sql`)**: 
  - North: 119,300 INR
  - South: 82,500 INR
- **Reality Check on Growth**: Using query `q11` data, North's revenue in September 2026 was **44,100 INR** and in October 2026 was **34,000 INR**, representing an actual month-over-month change of **-22.8%**. The assistant's claim of "38% growth" is entirely contradicted by the underlying data.

---

## 4. Human-in-the-Loop Protocol for Scenario D1
1. **Specification**: Defined the objective to find regional revenues for completed orders exceeding 80,000 INR.
2. **Execution**: Reviewed the assistant's provided query and noted the syntax and logical errors.
3. **Inspection**: Identified the fake schema references, illegal aggregate placement in `WHERE`, and unverified growth claim.
4. **Verification**: Ran the corrected query (`sql/d1_corrected.sql`) against the database seed and cross-referenced monthly trends using `q11`.
5. **Decision**: **Reject** the assistant's original query and phantom growth claim due to invalid syntax and fabricated statistics; **Accept** the corrected query and empirical findings.

---

## 5. Prompt and Root Cause Analysis for Scenario D2
- **Prompt**: "Act as an Excel specialist. In my spreadsheet, the products tab occupies range `A1:C10` (item names in column A, unit prices in column C). Cell `G2` on the orders tab holds the text `Smart Watch` with a leading whitespace. The formula `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)` returns an error saying the value was not found. What is the root cause and how do I fix it?"
- **Root Cause**: The string in cell `G2` contains a leading space (` Smart Watch`), causing the exact-match `VLOOKUP` lookup key to fail against the clean string (`Smart Watch`) in column A.
- **Repaired Formula**: `=VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)`

---

## 6. Skeptical-Analyst Check on Part C
- **Prompt**: "Act as a skeptical senior data analyst challenging my first recommendation from Part C (allocating 30% more high-end stock to North region fulfillment hubs). Challenge my unstated assumptions, demand causal evidence rather than correlation, and highlight risks."
- **Assumptions & Verifying Checks**:
  1. *Assumption*: Past revenue share (North generating 119,300 INR) guarantees future proportional demand. *Verifying Check*: Review customer order frequency and repeat purchase rates per capita in `q11`.
  2. *Assumption*: Out-of-stock events are the primary bottleneck limiting North regional sales. *Verifying Check*: Audit inventory logs and pending/disputed order reasons for North customers.
  3. *Assumption*: High-end items (Smart Watches/Earbuds) have higher margin resilience than Home category items experiencing rapid growth. *Verifying Check*: Compare product-level profit margins against category volume growth.
