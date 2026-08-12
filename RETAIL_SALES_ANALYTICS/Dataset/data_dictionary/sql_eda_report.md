# SQL EDA Report — Retail Sales Analytics

**Script:** `SQL/06_EDA.sql`
**Database:** RetailSalesAnalytics
**Table:** SuperstoreSales
**Tool:** SQL Server (SSMS)

---

## Purpose

This phase answers the core business questions defined in Step 1 using SQL — covering KPIs, customer behavior, product performance, category/sub-category profitability, geographic performance, and time trends. Advanced SQL techniques (CTE, RANK, LAG, window functions with running totals) were used to demonstrate analyst-level SQL proficiency.

---

## 1. KPIs (Executive Summary)

| Metric | Value |
|---|---|
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Total Quantity | 37,873 units |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Total Products | 1,862 |
| Average Order Value | $458.61 |
| Average Profit per Order | $57.18 |
| **Profit Margin** | **12.47%** |

**Interpretation:** A healthy but not exceptional retail profit margin — indicates room to investigate where margin is being lost.

---

## 2. Customer Analysis

**Top Customer by Sales:** Sean Miller ($25,043 sales) — but generates **-$1,981 profit** (a loss-making top customer).

**Top Customer by Profit:** Tamara Chand ($8,981 profit from $19,052 sales) — a far more valuable customer despite lower revenue than Sean Miller.

**Repeat vs. One-Time Customers:**
- Repeat customers: 781 (98.5%)
- One-time customers: 12 (1.5%)

**Interpretation:** Excellent customer retention. However, sales volume alone is a misleading metric for identifying "best" customers — profit-based ranking tells a different, more actionable story.

---

## 3. Product Analysis

**Top Product by Sales & Profit:** Canon imageCLASS 2200 Advanced Copier ($61,600 sales, $25,200 profit)

**Biggest Loss-Making Products:**
| Product | Profit |
|---|---|
| Cubify CubeX 3D Printer Double Head | -$8,880 |
| Lexmark MX611dhe Laser Printer | -$4,590 |
| Cubify CubeX 3D Printer Triple Head | -$3,840 |
| Chromcraft Bull-Nose Conference Tables | -$2,876 |
| Bush Advantage Conference Table | -$1,934 |

**Interpretation:** Loss-making products cluster around high-cost Technology equipment and Furniture tables — likely tied to heavy discounting (to be confirmed in Phase 10 with Discount vs. Profit analysis).

---

## 4. Category & Sub-Category Analysis

| Category | Sales | Profit | Margin |
|---|---|---|---|
| Technology | $836,154 | $145,455 | 17.40% |
| Furniture | $741,999 | $18,451 | **2.49%** |
| Office Supplies | $719,047 | $122,491 | 17.04% |

**Key Finding:** Furniture generates comparable revenue to Technology but only 2.49% margin — 7x lower than the other two categories.

**Loss-making sub-categories:**
| Category | Sub-Category | Margin |
|---|---|---|
| Furniture | Tables | **-8.56%** |
| Furniture | Bookcases | **-3.02%** |
| Office Supplies | Supplies | **-2.55%** |

**Interpretation:** Furniture's weak overall performance is driven specifically by Tables and Bookcases — not the category as a whole (Chairs and Furnishings are profitable). This narrows the business problem to specific sub-categories rather than an entire category.

---

## 5. Geographic Analysis

| Region | Sales | Profit | Margin |
|---|---|---|---|
| West | $725,458 | $108,418 | 14.94% |
| East | $678,781 | $91,523 | 13.48% |
| South | $391,722 | $46,749 | 11.93% |
| Central | $501,240 | $39,706 | 7.92% |

All regions appear profitable at this aggregation level.

**Worst-performing states (all loss-making):**
| State | Profit | Margin |
|---|---|---|
| Texas | -$25,729 | -15.12% |
| Ohio | -$16,971 | -21.69% |
| Pennsylvania | -$15,560 | -13.35% |
| Illinois | -$12,608 | -15.73% |
| North Carolina | -$7,491 | -13.47% |

**Best-performing city:** New York City ($62,037 profit)

**Critical Finding:** Region-level reporting masks serious state-level losses. Texas, Ohio, Pennsylvania, and Illinois are all significantly loss-making, but this is invisible when data is only viewed at the regional level — a key example of why aggregation level matters in analysis.

---

## 6. Time Trend Analysis

| Year | Sales | Profit |
|---|---|---|
| 2014 | $484,247 | $49,544 |
| 2015 | $470,533 | $61,619 |
| 2016 | $609,206 | $81,795 |
| 2017 | $733,215 | $93,439 |

**Interpretation:** Consistent year-over-year growth in both sales and profit from 2015 onward. 2017 is the strongest year on record.

**Seasonal pattern:** November and December consistently show peak sales every year (holiday season effect). **January consistently shows the largest month-over-month sales drop every year** (post-holiday slowdown) — confirmed via LAG() analysis.

**Running total validation:** Cumulative monthly running total for Dec 2017 = $2,297,200.86, matching the overall Total Sales KPI exactly — confirms aggregation logic is correct throughout this analysis.

---

## Advanced SQL Techniques Used

| Technique | Purpose |
|---|---|
| CTE (WITH clause) | Multi-step calculations (e.g., customer order counts before classification) |
| CASE WHEN | Classifying customers as Repeat vs. One-Time |
| RANK() OVER() | Ranking customers by profit, correctly handling ties |
| LAG() OVER() | Calculating month-over-month sales change |
| SUM() OVER() with ROWS UNBOUNDED PRECEDING | Running/cumulative total of sales over time |
| GROUP BY with multiple columns | Product_ID + Product_Name grouping (avoids conflating unrelated products sharing a recycled ID) |

---

## Key Findings Carried Forward to Business Analysis (Step 9) and Insights Report (Step 13)

1. Sean Miller: highest revenue customer but unprofitable — needs investigation.
2. Furniture category profitability problem is isolated to Tables and Bookcases sub-categories.
3. Cubify CubeX 3D Printers are consistently loss-making across variants.
4. Texas, Ohio, Pennsylvania, and Illinois are significant loss-making states, hidden by region-level views.
5. January is a consistent seasonal low point every year; Nov/Dec are consistent peaks.
6. Business is growing steadily year-over-year (2014–2017).
