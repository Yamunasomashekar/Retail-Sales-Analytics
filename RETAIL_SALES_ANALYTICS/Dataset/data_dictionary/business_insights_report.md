# Business Insights Report — Retail Sales Analytics

**Project:** Retail Sales Analytics (Superstore Dataset)
**Analysis Period:** 2014–2017
**Sources:** SQL EDA, Python EDA, Power BI Dashboard, Business Analysis (Steps 7–12)

---

## Executive Summary

Superstore generated $2,297,200.86 in total sales and $286,397.02 in total profit over four years, at a 12.47% overall profit margin, with consistent year-over-year growth. However, this healthy top-line picture conceals a single systemic issue — **uncontrolled discounting above ~30-40%** — which independently explains poor performance across four different dimensions of the business: a product category (Furniture), a top customer (Sean Miller), four states (Texas, Ohio, Pennsylvania, Illinois), and a specific product line (Cubify CubeX 3D Printers). Addressing discount policy is the single highest-leverage recommendation in this report.

---

## 1. Sales Insights

**Evidence:** Total sales $2,297,200.86; Average Order Value $458.61; consistent YoY growth from $484,247 (2014) to $733,215 (2017).

**Business Meaning:** The business is growing steadily and predictably year over year.

**Possible Cause:** Organic growth combined with improving margin management (see Trend Insights below).

**Business Impact:** Positive — provides a stable foundation to invest in fixing the profitability issues identified in this report without risking overall business health.

**Recommendation:** Maintain current growth trajectory while implementing the profitability fixes below — the goal is to convert this consistent revenue growth into proportionally higher profit growth.

---

## 2. Customer Insights

**Evidence:** Sean Miller ranks #1 by sales ($25,043) but generates -$1,980.74 profit, driven by a 24.67% average discount rate (vs. 15.62% company average). Tamara Chand is the true #1 customer by profit ($8,981). 781 of 793 customers (98.5%) are repeat buyers.

**Business Meaning:** Sales-based customer ranking is misleading; profit-based ranking reveals a different, more actionable picture of customer value. Customer retention is excellent overall.

**Possible Cause:** Sean Miller's account likely receives non-standard discount terms, possibly due to order size or historical negotiation.

**Business Impact:** Risk of misallocating account management resources toward an unprofitable "top" customer while under-investing in genuinely valuable ones like Tamara Chand.

**Recommendation:** Adopt profit-based (not sales-based) customer prioritization for retention and account management programs. Review and renegotiate Sean Miller's discount terms specifically.

---

## 3. Product Insights

**Evidence:** Canon imageCLASS 2200 Advanced Copier is the top product by both sales ($61,600) and profit ($25,200). Cubify CubeX 3D Printer (Double Head) is the single largest loss-maker (-$8,880), nearly double the next-worst product (Lexmark MX611dhe, -$4,590). The Triple Head variant also appears among top loss-makers (-$3,840).

**Business Meaning:** High-value office equipment (copiers, binding systems) drives the most profit; 3D printers and select furniture/technology items drive disproportionate losses.

**Possible Cause:** Consistent with the discount-driven pattern — high-cost, likely low-demand items being discounted heavily to drive sales.

**Business Impact:** A small number of specific SKUs are responsible for a disproportionate share of total losses — a concentrated, addressable problem.

**Recommendation:** Apply discount caps or conduct pricing/discontinuation review specifically for the Cubify CubeX 3D Printer product line.

---

## 4. Geographic Insights

**Evidence:** All 4 regions show positive profit margins (7.92%–14.94%). At the state level, Texas (-$25,729, 37.0% avg discount), Ohio (-$16,971, 32.5% avg discount), Pennsylvania (-$15,560, 32.9% avg discount), and Illinois (-$12,608, 39.0% avg discount) are all significantly loss-making, with discount rates more than double the 15.62% company average.

**Business Meaning:** Region-level reporting conceals serious state-level profitability problems.

**Possible Cause:** Localized discounting practices (possibly sales-rep or regional-manager driven) in these four states specifically.

**Business Impact:** Approximately $70K in combined losses across four states goes unnoticed under standard regional reporting.

**Recommendation:** Implement state-level discount monitoring and approval limits, particularly for Texas, Ohio, Pennsylvania, and Illinois. Always pair regional KPI reporting with state-level drill-down views.

---

## 5. Profitability Insights

**Evidence:** Correlation between Discount and Profit is -0.22. Profit is predominantly positive at 0–20% discount, and predominantly negative from ~40% discount onward. Furniture category margin (2.49%) is 7x lower than Technology (17.40%) and Office Supplies (17.04%), driven specifically by Tables (-8.56% margin, 26.13% avg discount) and Bookcases (-3.02% margin, 21.11% avg discount).

**Business Meaning:** Discounting is a systemic, cross-cutting driver of losses — not isolated to one category, customer, or region, but a shared root cause appearing across all of them.

**Possible Cause:** Absence of a formal, enforced discount approval policy tied to profit impact.

**Business Impact:** This is the single highest-leverage issue identified in the entire analysis — a fix here could simultaneously improve category, customer, and geographic profitability.

**Recommendation:** Establish a company-wide discount policy: discounts above 30% require managerial approval; discounts above 40% require senior approval or are disallowed for high-cost items. Introduce ongoing discount-vs-margin monitoring as a standing KPI.

---

## 6. Trend Insights

**Evidence:** Profit grew every year 2014–2017, including 2015 when sales were flat/slightly down vs. 2014 ($470,533 vs. $484,247). Every year shows a November/December sales peak and a January sales drop (confirmed via SQL LAG() analysis).

**Business Meaning:** The business has improved margin efficiency independent of revenue growth in at least one period, and follows a predictable, recurring seasonal cycle.

**Possible Cause:** 2015's margin improvement may reflect a deliberate or incidental operational change; the seasonal pattern reflects standard holiday retail behavior.

**Business Impact:** The 2015 margin improvement suggests a repeatable playbook exists for improving profitability without needing sales growth. The seasonal pattern is predictable and plannable rather than a risk.

**Recommendation:** Investigate what changed operationally in 2015 to replicate it going forward. Align inventory and marketing budgets to anticipate the Nov/Dec peak and plan proactively for the January slowdown.

---

## Consolidated Recommendations (Ranked by Impact)

1. **Implement a company-wide discount approval policy** (30% managerial approval threshold, 40% senior approval or disallowed for high-cost items) — highest-leverage fix, addresses Furniture, Sean Miller, and the four loss-making states simultaneously.
2. **Review and cap discounts specifically on Tables and Bookcases** sub-categories.
3. **Shift customer prioritization to profit-based ranking**, not sales-based.
4. **Conduct SKU-level review of Cubify CubeX 3D Printer** product line (repricing or discontinuation).
5. **Implement state-level discount monitoring**, particularly for Texas, Ohio, Pennsylvania, and Illinois.
6. **Investigate 2015's margin improvement** as a potential repeatable strategy.
7. **Align inventory/marketing planning** to the recurring Nov/Dec peak and January dip.

---

## Supporting Documentation

- Data Dictionary: `Dataset/data_dictionary/data_dictionary.md`
- Data Quality Report: `Dataset/data_dictionary/data_quality_report.md`
- SQL EDA Report: `Dataset/data_dictionary/sql_eda_report.md`
- Python EDA Report: `Dataset/data_dictionary/python_eda_report.md`
- Business Analysis Report: `Dataset/data_dictionary/business_analysis_report.md`
- Power BI Dashboard: `PowerBI/Retail_Sales_Dashboard.pbix`
