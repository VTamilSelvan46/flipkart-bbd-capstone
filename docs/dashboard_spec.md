# Part C — Dashboard Specification and Business Narrative

## 1. Data Source
The dashboard connects to `data/orders_clean.csv`. Below is the field classification into Dimensions and Measures:

| Column Name | Classification | Description |
| :--- | :--- | :--- |
| `order_id` | Dimension | Unique identifier for each order |
| `order_month` | Dimension | Month of order in `YYYY-MM` text format |
| `clean_first_name` | Dimension | Cleaned first name of customer |
| `clean_last_name` | Dimension | Cleaned last name of customer |
| `region` | Dimension | Customer region (North, South, East, West) |
| `rep_name` | Dimension | Sales representative name |
| `item` | Dimension | Product item name |
| `category` | Dimension | Product category (Electronics, Apparel, Home) |
| `unit_price` | Measure | Price per unit in INR |
| `quantity` | Measure | Quantity of items ordered |
| `amount` | Measure | Total order amount in INR |
| `revenue_calc` | Measure | Calculated revenue (unit_price * quantity) |
| `status` | Dimension | Order status (filtered to completed only) |

---

## 2. KPI Cards
* **Total Revenue**: Displays **346,200 INR** (Sum of `amount`). *This revenue card perfectly equals Part A's q05 total_revenue.*
* **Total Units Sold**: Displays **106 units** (Sum of `quantity`).

---

## 3. Chart Specifications and Data Tables

### Worksheet 1: Revenue by Region
* **Chart Type**: Bar Chart
* **Shelves**: Rows = `region`, Columns = `SUM(amount)`, Colour = `region`
* **Justification**: A horizontal bar chart allows quick visual comparison of regional revenue performance against targets.
* **Data Table**:
  * North: 119,300 INR
  * South: 82,500 INR
  * West: 80,500 INR
  * East: 63,900 INR

### Worksheet 2: Revenue by Category
* **Chart Type**: Bar Chart
* **Shelves**: Rows = `category`, Columns = `SUM(amount)`, Colour = `category`
* **Justification**: A bar chart clearly highlights which product lines drive the bulk of BBD sales volume.
* **Data Table**:
  * Electronics: 142,300 INR
  * Home: 126,400 INR
  * Apparel: 77,500 INR

### Worksheet 3: Revenue Trend by Month and Category
* **Chart Type**: Line Chart
* **Shelves**: Columns = `order_month`, Rows = `SUM(amount)`, Colour = `category`
* **Justification**: A multi-line time-series chart reveals month-over-month trajectory and category growth or contraction.
* **Data Table**:
  * 2026-09: Electronics (44,100), Home (38,800), Apparel (23,500)
  * 2026-10: Electronics (47,400), Home (40,200), Apparel (23,100)
  * 2026-11: Electronics (50,800), Home (47,400), Apparel (30,900)

### Worksheet 4: Region x Category Detail
* **Chart Type**: Text Table (Matrix)
* **Shelves**: Rows = `region` and `category`, Text = `SUM(amount)`
* **Justification**: A matrix provides granular lookup capability for regional managers to audit exact cross-tab numbers.
* **Data Table**:
  * North / Electronics: 54,000 | Home: 41,500 | Apparel: 23,800
  * South / Electronics: 37,200 | Home: 30,400 | Apparel: 14,900
  * West / Electronics: 26,000 | Home: 33,200 | Apparel: 21,300
  * East / Electronics: 25,100 | Home: 21,300 | Apparel: 17,500

---

## 4. Dashboard Layout & Interactivity
* **Top-to-Bottom Placement**: 
  1. Top Band: KPI Cards (Total Revenue & Total Units Sold)
  2. Sub-Top Band: Global Category Filter dropdown
  3. Upper Section: Revenue Trend by Month and Category (Line Chart)
  4. Middle Section: Revenue by Region & Revenue by Category (Side-by-side Bar Charts)
  5. Bottom Section: Region x Category Detail (Text Table)
* **Containers**: Built using horizontal and vertical layout containers to maintain responsiveness.
* **Global Filter**: A single Category filter is placed directly below the KPI cards in the top band and is configured to apply to all four worksheets.
* **Interactivity Behaviour**: When a user clicks a bar in the **Revenue by Region** chart with *Use as Filter* enabled, all other charts and the detail table instantly filter to display data exclusively for that selected region.

---

## 5. Insight and Recommendation Narrative

### Visualization Summary
The dashboard aggregates Flipkart's BBD completed orders, revealing that revenue is heavily anchored by Electronics (142,300 INR) and Home goods (126,400 INR), with the North region leading regional performance at 119,300 INR. Sales exhibit steady positive momentum from September through November across all product categories.

### Summary Analysis
1. **Regional Dominance**: The North region generated **119,300 INR**, outperforming the West region (**80,500 INR**) by over 48%, driven primarily by high-ticket Electronics sales (54,000 INR).
2. **Category Hierarchy**: Electronics is the top-performing category at **142,300 INR**, representing roughly 41% of total BBD revenue, whereas Apparel lags behind at **77,500 INR**.
3. **Monthly Growth Trajectory**: Total monthly sales grew steadily across the cycle, moving from September (106,400 INR) to November (129,100 INR), with Home category showing the sharpest acceleration in November (47,400 INR).

### Recommendations
1. **North Region Inventory Allocation**: Given that the North region produced **119,300 INR** (anchored by 54,000 INR in Electronics), Flipkart should allocate 30% more high-end stock (Smart Watches and Wireless Earbuds) to North fulfillment hubs ahead of future flash sales. *Success Metric*: Watch for a 15% reduction in out-of-stock cancellation rates.
2. **Apparel Promotional Push in South & East**: Apparel underperformed relative to other categories, registering only **14,900 INR** in the South and **17,500 INR** in the East. Introduce bundled discounts (e.g., Kurta + Denim Jacket combos) targeting these regions. *Success Metric*: Measure a 20% lift in regional Apparel unit sales within 14 days.
3. **Capitalize on Home Category Momentum**: Home items surged to **47,400 INR** in November. Expand targeted digital ad spend on high-margin home appliances like Air Fryers in the West region (where Home sales reached 33,200 INR). *Success Metric*: Track Return on Ad Spend (ROAS) exceeding 3.5x for Home category campaigns.

---

## 6. Reconciliation Table

| Metric Component | Value (INR) | Status |
| :--- | :--- | :--- |
| KPI Card: Total Revenue | 346,200 | Match |
| Sum of Revenue by Region | 346,200 | Match |
| Sum of Revenue by Category | 346,200 | Match |
| Spreadsheet Pivot Grand Total | 346,200 | Match |
