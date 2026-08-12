# Final Business Recommendations — Retail Sales Analytics

**Project:** Retail Sales Analytics (Superstore Dataset)
**Based on:** SQL EDA, Python EDA, Power BI Dashboard, Business Analysis (Steps 7–13)

Each recommendation below is directly tied to a specific, evidence-backed finding from this project — none are speculative.

---

## 1. Pricing & Discounting

### 1.1 Establish a Company-Wide Discount Approval Policy
**Tied to finding:** Discount-Profit correlation of -0.22; profit turns predominantly negative above ~40% discount; company average discount is 15.62%, while all major loss-making segments (Sean Miller: 24.67%, Texas: 37.0%, Ohio: 32.5%, Pennsylvania: 32.9%, Illinois: 39.0%, Tables: 26.13%, Bookcases: 21.11%) sit well above this baseline.

**Recommendation:** Require managerial approval for discounts above 30%, and senior/executive approval (or outright restriction) for discounts above 40% on high-cost items. This is the single highest-leverage recommendation in the entire project.

### 1.2 Cap Discounts on Specific Loss-Making Sub-Categories
**Tied to finding:** Tables (-8.56% margin) and Bookcases (-3.02% margin) are the only two sub-categories operating at a loss, both carrying above-average discount rates.

**Recommendation:** Set a hard discount ceiling (e.g., 15%) specifically for Tables and Bookcases, given their high per-unit cost makes them especially sensitive to percentage-based discounting.

---

## 2. Product Portfolio

### 2.1 Review the Cubify CubeX 3D Printer Product Line
**Tied to finding:** Cubify CubeX 3D Printer (Double Head) is the single largest loss-making product (-$8,880); the Triple Head variant is also a top loss-maker (-$3,840). Combined, these two SKUs account for over $12,700 in losses.

**Recommendation:** Conduct a SKU-level review — evaluate repricing, discount restriction, or discontinuation for this specific product line.

### 2.2 Protect and Promote High-Margin Product Lines
**Tied to finding:** Canon imageCLASS 2200 Advanced Copier leads in both sales ($61,600) and profit ($25,200); Technology (17.40%) and Office Supplies (17.04%) categories substantially outperform Furniture (2.49%) in margin.

**Recommendation:** Prioritize marketing spend and inventory investment toward Technology and Office Supplies categories, which deliver proportionally more profit per sales dollar than Furniture.

---

## 3. Customer Retention & Account Management

### 3.1 Shift Customer Prioritization from Sales-Based to Profit-Based
**Tied to finding:** Sean Miller ranks #1 by sales ($25,043) but generates -$1,980.74 profit; Tamara Chand is the true #1 customer by profit ($8,981).

**Recommendation:** Update account management and loyalty program criteria to rank and prioritize customers by profit contribution, not sales volume, to avoid over-investing in unprofitable "top" accounts.

### 3.2 Maintain Strong Retention Practices
**Tied to finding:** 781 of 793 customers (98.5%) are repeat buyers — a strong retention signal.

**Recommendation:** Document and preserve whatever current practices are driving this high repeat rate; treat this as a competitive strength when evaluating changes to customer-facing policy (e.g., discount caps) to ensure retention isn't inadvertently harmed.

---

## 4. Regional Expansion & Geographic Strategy

### 4.1 Implement State-Level Discount Monitoring
**Tied to finding:** Texas (-$25,729), Ohio (-$16,971), Pennsylvania (-$15,560), and Illinois (-$12,608) are all significantly loss-making despite their parent regions showing positive profit margins — masked by regional-level aggregation.

**Recommendation:** Introduce state-level discount approval limits or monitoring, particularly for these four states. Update standard management reporting to always include a state-level drill-down alongside regional totals.

### 4.2 Study New York City as a Model Market
**Tied to finding:** New York City is the single highest profit-generating city ($62,037).

**Recommendation:** Analyze what customer segment, product mix, or sales practices differentiate NYC's performance, and evaluate whether these practices can be replicated in underperforming markets.

---

## 5. Inventory & Seasonal Planning

### 5.1 Align Inventory and Marketing Budgets to Seasonal Patterns
**Tied to finding:** Every year in the dataset shows a sales peak in November/December and a sharp drop in January (confirmed via SQL LAG() analysis and Python trend visualization).

**Recommendation:** Proactively scale inventory and marketing spend ahead of the Nov/Dec peak. Consider post-holiday promotions in January to smooth the seasonal dip rather than treating it as an unplanned slowdown.

---

## 6. Profitability & Margin Management

### 6.1 Investigate 2015's Margin Improvement as a Repeatable Strategy
**Tied to finding:** Profit grew from $49,544 (2014) to $61,619 (2015) even though sales were flat/slightly down over the same period ($484,247 to $470,533) — indicating margin efficiency improved independent of revenue growth.

**Recommendation:** Investigate what operational or pricing changes occurred in 2015 that may have driven this margin improvement, and evaluate whether those practices can be intentionally reapplied.

### 6.2 Introduce Ongoing Discount-vs-Margin Monitoring as a Standing KPI
**Tied to finding:** The discount-profit relationship was only surfaced through a dedicated one-time analysis; there is no evidence of ongoing monitoring.

**Recommendation:** Add a "Discount Rate vs. Profit Margin" view to standard recurring reporting (e.g., monthly), rather than relying on periodic ad-hoc analysis to catch these patterns going forward.

---

## Summary Table

| # | Recommendation | Business Function | Priority |
|---|---|---|---|
| 1.1 | Company-wide discount approval policy | Pricing & Discounting | **Highest** |
| 1.2 | Discount cap on Tables/Bookcases | Pricing & Discounting | High |
| 2.1 | Review Cubify CubeX 3D Printer line | Product Portfolio | High |
| 3.1 | Profit-based customer prioritization | Customer Retention | High |
| 4.1 | State-level discount monitoring | Regional Strategy | High |
| 2.2 | Protect high-margin product lines | Product Portfolio | Medium |
| 4.2 | Study NYC as a model market | Regional Strategy | Medium |
| 5.1 | Seasonal inventory/marketing planning | Inventory Planning | Medium |
| 6.1 | Investigate 2015 margin improvement | Profitability Management | Medium |
| 6.2 | Ongoing discount-vs-margin KPI monitoring | Profitability Management | Medium |
| 3.2 | Maintain retention practices | Customer Retention | Low (preserve, don't change) |
