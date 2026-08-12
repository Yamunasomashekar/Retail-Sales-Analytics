# Business Analysis Report — Retail Sales Analytics

**Framework:** Observation → Diagnosis → Business Impact → Recommendation
**Supporting SQL:** `SQL/07_Business_Analysis.sql`
**Company-wide average discount (baseline for comparison):** 15.62%

---

## Finding 1: Furniture Category Profitability Crisis

**Observation:**
Furniture generates $741,999 in sales — nearly matching Technology's $836,154 — but produces only $18,451 in profit (2.49% margin), versus Technology's 17.40% and Office Supplies' 17.04%. Within Furniture, Tables (-8.56% margin, -$17,725) and Bookcases (-3.02% margin, -$3,473) are loss-making.

**Diagnosis (CONFIRMED):**
Verification query shows Tables carry a 26.13% average discount and Bookcases 21.11% — both well above the 15.62% company average. This confirms heavy discounting as a direct driver of these sub-categories' losses. Note: high discount alone does not guarantee loss (Office Supplies → Binders has the highest discount of all sub-categories at 37.2% yet remains highly profitable at $30,222) — the combination of high discount AND high per-unit cost (large furniture items) is the specific driver here.

**Business Impact:**
Furniture consumes significant operational resources (inventory, warehousing, shipping for large items) while returning minimal profit, with two sub-categories in active loss. This drags down overall company profitability.

**Recommendation:**
Cap discounts on Tables and Bookcases at a lower threshold (e.g., 15-20% max) given their high per-unit cost. Conduct a SKU-level pricing review for the specific loss-making Furniture products identified in Step 8 (BoxOffice Rectangular Table, Bush Advantage Conference Table, Chromcraft Bull-Nose Tables).

---

## Finding 2: Sean Miller — High Revenue, Negative Profit Customer

**Observation:**
Sean Miller is the #1 customer by sales ($25,043) but generates -$1,980.74 in profit. Tamara Chand is the #1 customer by profit ($8,981 from $19,052 sales).

**Diagnosis (CONFIRMED):**
Sean Miller's average discount rate is 24.67%, compared to the company average of 15.62% — approximately 58% higher than typical. This directly explains his negative profit despite high sales volume.

**Business Impact:**
Sales-based customer ranking alone would misidentify Sean Miller as the top customer, risking over-investment in retention efforts for a financially unprofitable account, while under-recognizing genuinely valuable customers like Tamara Chand.

**Recommendation:**
Shift customer prioritization from sales-based to profit-based ranking. Review and renegotiate discount terms on Sean Miller's account specifically.

---

## Finding 3: Geographic Losses Hidden by Regional Aggregation

**Observation:**
All 4 regions show positive profit margins (7.92%–14.94%). At the state level, Texas (-$25,729), Ohio (-$16,971), Pennsylvania (-$15,560), and Illinois (-$12,608) are all significantly loss-making.

**Diagnosis (CONFIRMED):**
All four loss-making states show average discounts more than double the company average: Texas 37.0%, Illinois 39.0%, Pennsylvania 32.9%, Ohio 32.5%, vs. 15.62% company-wide. This is a strong, consistent pattern directly explaining the state-level losses.

**Business Impact:**
Region-level aggregation masks ~$60K+ in combined losses across these four states. Without state-level analysis, leadership has no visibility into localized discount practices actively harming profitability.

**Recommendation:**
Implement state-level (or sales-rep-level, if data available) discount approval limits, particularly for Texas, Ohio, Pennsylvania, and Illinois. Adjust standard reporting to always include state-level drill-down alongside regional totals, not regional totals alone.

---

## Finding 4: Discounting as a Systemic, Company-Wide Driver of Losses

**Observation:**
Correlation analysis shows Discount and Profit at -0.22. Visual analysis shows profit turns predominantly negative above ~40% discount.

**Diagnosis (CONFIRMED — this is the unifying root cause):**
Every major loss-making finding in this report (Furniture Tables/Bookcases, Sean Miller, Texas/Ohio/Pennsylvania/Illinois) is independently explained by the same factor: discount rates substantially above the 15.62% company average. This is not four separate problems — it is one systemic issue (uncontrolled high discounting) appearing across multiple dimensions of the business.

**Business Impact:**
This is the single highest-leverage issue in the business. A discount policy fix could simultaneously improve category, customer, and geographic profitability at once, rather than requiring four separate interventions.

**Recommendation:**
Establish a formal, company-wide discount approval policy: discounts above 30% require managerial approval; discounts above 40% require senior approval or are disallowed for high-cost items (Furniture, Technology equipment). Introduce ongoing discount-vs-margin monitoring as a standing KPI, not a one-time analysis.

---

## Finding 5: Cubify CubeX 3D Printer — Standout Loss-Making Product

**Observation:**
Cubify CubeX 3D Printer (Double Head) shows a total loss of -$8,880 — nearly double the next-worst product. The Triple Head variant also appears among top loss-makers (-$3,840).

**Diagnosis:**
Consistent with the broader discount-driven pattern established in Finding 4 — both variants likely reflect the same high-discount, high-cost-item dynamic.

**Business Impact:**
A concentrated, addressable problem — fixing pricing/discount policy on two specific SKUs directly removes over $12,700 in combined losses.

**Recommendation:**
Apply a discount cap specifically to this product line, or evaluate repricing/discontinuation if losses persist after the cap is applied.

---

## Finding 6: Consistent Business Growth (Positive Finding)

**Observation:**
Sales grew from $484,247 (2014) to $733,215 (2017); profit grew from $49,544 to $93,439. Profit grew even in 2015 when sales were flat/slightly down vs. 2014.

**Diagnosis:**
The business improved margin efficiency over time independent of revenue growth, particularly in 2015.

**Business Impact:**
A genuine strength — the business is improving profitability, not just chasing volume. Worth preserving as discount-policy recommendations are implemented.

**Recommendation:**
Investigate 2015's operational changes as a potential repeatable playbook for margin improvement.

---

## Finding 7: Seasonal Pattern — November/December Peaks, January Dips

**Observation:**
Every year shows a sales peak in Nov/Dec and a sharp drop in January.

**Diagnosis:**
Standard, predictable retail holiday-season effect.

**Business Impact:**
Predictable seasonality enables proactive inventory, staffing, and marketing planning.

**Recommendation:**
Align inventory and marketing budgets to the Nov/Dec peak; consider post-holiday promotions to smooth the January dip.

---

## Summary: The One Root Cause Behind Most Findings

Findings 1, 2, 3, and 5 — spanning category, customer, and geography — are all explained by the **same underlying issue**: discount rates substantially above the company average (15.62%). This should be positioned as the headline finding of the entire project: **uncontrolled discounting above ~30% is the single largest identifiable driver of losses across Superstore's business**, and a unified discount policy is the highest-leverage recommendation available.
