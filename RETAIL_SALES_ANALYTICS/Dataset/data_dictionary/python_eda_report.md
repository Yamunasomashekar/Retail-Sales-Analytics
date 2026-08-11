# Python EDA Report — Retail Sales Analytics

**Notebook:** `Python/04_EDA.ipynb`
**Input:** `Dataset/cleaned/superstore_cleaned.csv`
**Tools:** Python, Pandas, Matplotlib, Seaborn

---

## Purpose

This phase visualizes the patterns and relationships in the cleaned dataset, complementing the numeric findings from the SQL EDA (Step 7). Charts are used to confirm SQL findings visually and to surface patterns (distribution shape, correlation) that are easier to detect visually than in tabular query results.

---

## 1. Univariate Analysis

| Chart | Finding |
|---|---|
| Sales Distribution | Heavily right-skewed — most transactions are low-to-moderate value, with a long tail of large orders. Mean is pulled upward by a small number of high-value transactions. |
| Profit Distribution | Narrow peak centered near zero, with meaningful spread on both sides. Visually confirms the 1,871 loss-making transactions found in SQL. |
| Quantity Distribution | Most transactions involve 2–3 units; frequency declines steadily as quantity increases. |
| Discount Distribution | Two dominant tiers: 0% discount (~4,800 transactions) and 20% discount (~3,650 transactions). Higher discounts (40%+) are comparatively rare. |

---

## 2. Bivariate Analysis

| Chart | Finding |
|---|---|
| Sales vs Profit | Moderate positive relationship, but with significant scatter — high sales does not guarantee profit. |
| Discount vs Profit | **Clear negative pattern.** Profit is mostly positive at 0–20% discount, and shifts predominantly negative from ~40% discount onward. Visual confirmation of a key business driver of losses. |
| Quantity vs Sales | No clear relationship — quantity alone does not predict sales value. |

### Correlation Matrix

| Pair | Correlation | Interpretation |
|---|---|---|
| Sales ↔ Profit | +0.48 | Moderate positive |
| Discount ↔ Profit | **-0.22** | Negative — discounting measurably reduces profit |
| Quantity ↔ Profit | +0.07 | Negligible |
| Sales ↔ Discount | -0.03 | Negligible |

**Key Finding:** Discounting has a measurable, negative effect on profitability, with the effect becoming severe above ~40% discount. This is a validated, evidence-backed finding (confirmed both visually and numerically) for use in business recommendations.

---

## 3. Categorical Analysis

- **Sales vs Profit by Category:** Furniture's sales are comparable to Technology's, but its profit is dramatically lower — visually confirms the category's poor margin efficiency (2.49%) found in SQL.
- **Sales by Region:** West leads ($725K), followed by East, Central, South — consistent with SQL findings. Region-level view does not reveal the state-level losses found in SQL (Texas, Ohio, Pennsylvania, Illinois).
- **Sales by Segment:** Consumer segment is the dominant revenue driver (~$1.16M), more than Corporate and Home Office combined. Flagged for further profit-margin investigation in Business Analysis (Step 9).

---

## 4. Time Analysis

- **Monthly Sales Trend:** Confirms overall upward trajectory from 2014–2017, with recurring seasonal peaks (Nov/Dec) and dips (Jan) each year.
- **Yearly Sales vs Profit:** Notable finding — profit grew every year, including 2015 when sales were flat/slightly down vs. 2014. Indicates improving margin efficiency independent of sales growth.

---

## 5. Customer & Product Analysis

- **Top 10 Customers by Sales:** Sean Miller ranks #1 by sales (~$25K) despite being loss-making overall — reinforces the need for profit-based customer evaluation, not sales-based alone.
- **Top 10 Most Profitable Products:** Dominated by copiers and printing/binding equipment (Technology, Office Supplies).
- **Top 10 Loss-Making Products:** Dominated by 3D printers, laser printers, and conference tables. Cubify CubeX 3D Printer (Double Head) is the single largest loss-maker (~-$8,880), nearly double the next-worst product.

---

## Consistency with SQL EDA (Step 7)

All Python visual findings are consistent with and reinforce the SQL EDA numeric findings, including:
- Furniture category's weak profitability
- Discount as a driver of losses
- Sean Miller as a high-revenue, loss-making customer
- Consistent year-over-year business growth
- Seasonal Nov/Dec peaks and January dips

---

## Findings Carried Forward to Business Analysis (Step 9)

1. Discount-Profit relationship is statistically confirmed (-0.22 correlation) and visually severe above 40% discount — actionable for a discount policy recommendation.
2. Consumer segment's profit margin should be checked — it dominates sales but its profitability is not yet confirmed.
3. Cubify CubeX 3D Printer (Double Head) is a standout loss-maker warranting individual review (pricing, discontinuation, or discount cap).
4. 2015's flat sales with rising profit suggests margin management improved independent of revenue growth — worth highlighting as a positive trend.
