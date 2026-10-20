# Part B — Spreadsheet Cleaning and Pivot Layer

## 1. Setup Section
* **Tab Names Created**: `orders`, `products`, `completed_orders`
* **Import Range (Orders)**: 90 rows imported into the `orders` tab from `data/orders_enriched.csv`. `order_month` kept as plain text (`2026-09`, etc.).
* **Products Range**: Range `A1:C10` on the `products` tab.
* **Filter & Sort Applied**: Filtered `orders` where `status = completed`, and sorted visible rows by `amount` from largest to smallest before populating `completed_orders`.
* **XLOOKUP Fallback Test**: Tested with `Mystery Item` in a spare cell, which correctly displayed `UNKNOWN_ITEM`.

## 2. Added Column Formulas (First Data Row)
* **`clean_first_name`**: `=PROPER(TRIM(B2))`
* **`clean_last_name`**: `=PROPER(TRIM(C2))`
* **`category`**: `=VLOOKUP(G2, products!$A$2:$C$10, 2, FALSE)`
* **`unit_price`**: `=XLOOKUP(G2, products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`
* **`revenue_calc`**: `=I2*J2` (where column I is `unit_price` and column J is `quantity`)

## 3. Aggregate Results (Completed Orders)
* **COUNT**: 63
* **SUM (Total Revenue)**: 346,200 INR
* **AVERAGE**: 5,495.24 INR
* **MIN**: 1,100 INR
* **MAX**: 15,600 INR

## 4. Pivot Tables
### Pivot (i): Revenue by Category and Region (Sum of Amount)
| Category | North | South | East | West | Grand Total |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Apparel | 23,800 | 14,900 | 17,500 | 21,300 | 77,500 |
| Electronics | 54,000 | 37,200 | 25,100 | 26,000 | 142,300 |
| Home | 41,500 | 30,400 | 21,300 | 33,200 | 126,400 |
| **Grand Total** | **119,300** | **82,500** | **63,900** | **80,500** | **346,200** |

### Pivot (ii): Revenue Trend by Month
| Order Month | Sum of Amount | Count of Order ID |
| :--- | :--- | :--- |
| 2026-09 | 106,400 | 19 |
| 2026-10 | 110,700 | 20 |
| 2026-11 | 129,100 | 24 |
| **Grand Total** | **346,200** | **63** |

## 5. Reconciliation Table
| Metric | Spreadsheet Value | Part A (q05) Value | Match / Mismatch |
| :--- | :--- | :--- | :--- |
| COUNT | 63 | 63 | Match[cite: 1] |
| SUM | 346,200 INR[cite: 1] | 346,200 INR[cite: 1] | Match[cite: 1] |
| AVERAGE | 5,495.24 INR | 5,495.24 INR | Match |

## 6. Data Validation Section
* **Missing Amounts**: Handled three missing amounts (order IDs 1001, 1010, 1064) by keeping them empty as identified in Part A's query `q02`, since they correspond to pending/uncompleted orders and do not factor into completed revenue[cite: 1].
* **Data Types**: Confirmed numbers are stored as numeric values for calculations.
* **Outliers & Duplicates**: No duplicate order IDs among completed orders. The largest amount among completed orders is **15,600 INR**, which occurs in orders 1011, 1061, 1065, 1069, and 1077 (Note: 1011 and 1061 are disputed/completed depending on status context, but 1061, 1065, 1069, 1077 are verified completed orders of 15,600 INR).
* **Colleague Decision Note**: Documented that all currency calculations rely strictly on completed status orders to maintain alignment with leadership reports.
