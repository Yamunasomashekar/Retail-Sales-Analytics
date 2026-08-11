# Data Quality Report — Retail Sales Analytics (Superstore Dataset)

**Dataset:** Sample - Superstore.csv
**Rows Audited:** 9,994
**Audit Date Phase:** Step 4 — Data Quality Audit

---

## Summary

This dataset is structurally very clean. No missing values, no fully duplicate rows, no invalid date logic, no out-of-range numeric values. The only issues found are minor formatting inconsistencies in the `Product Name` field. All "unusual" values (negative profit, statistical outliers) were investigated and confirmed to be legitimate business data, not errors — they are retained for analysis rather than removed.

---

## Detailed Findings & Decisions

| # | Check | Result | Decision | Rationale |
|---|---|---|---|---|
| 1 | Ship Date before Order Date | 0 rows | No action | Logically valid |
| 2 | Sales <= 0 | 0 rows | No action | All valid |
| 3 | Quantity <= 0 | 0 rows | No action | All valid |
| 4 | Discount outside 0-1 | 0 rows | No action | All valid |
| 5 | Negative Profit | 1,871 rows | **Retain** | Real business losses; core to loss analysis in Phase 10 |
| 6 | Whitespace — Ship Mode, Segment, Country, City, State, Region, Category, Sub-Category, Customer Name | 0 issues | No action | Clean |
| 7 | Whitespace — Product Name | 16 values | **Fix** | Trim leading/trailing spaces to prevent duplicate grouping in analysis |
| 8 | Casing consistency (categorical columns) | Consistent | No action | No case-based duplicate categories found |
| 9 | Customer ID → Customer Name mapping | 0 mismatches | No action | Fully consistent |
| 10 | Product ID → Product Name mapping | 32 mismatches | **Transform** | Standardize each Product ID to a single consistent name (known dataset quirk) |
| 11 | Sales outliers (IQR method) | 1,167 rows | **Retain** | Legitimate high-value orders; important for revenue analysis |
| 12 | Profit outliers (IQR method) | 1,881 rows | **Retain** | Legitimate high-profit and high-loss transactions; core to profitability analysis |
| 13 | Fully duplicate rows | 0 | No action | None found |
| 14 | Duplicate Order IDs | 4,985 (expected) | No action | Normal — multi-line-item orders |
| 15 | Missing values (all columns) | 0 | No action | Fully complete dataset |

---

## Cleaning Actions Required (carried into Step 5 & Step 6)

1. **Trim whitespace** in `Product Name`.
2. **Standardize Product ID → Product Name** mapping (pick one consistent name per Product ID).
3. **Convert `Order Date` and `Ship Date`** from text to proper date format.
4. **Do NOT** remove negative profit values.
5. **Do NOT** remove statistical outliers in Sales or Profit.

## Explicitly Retained (Not Treated as Errors)

- Negative Profit values (1,871 rows) — real losses.
- Sales outliers (1,167 rows) — large legitimate orders.
- Profit outliers (1,881 rows) — large legitimate gains/losses.
- Duplicate Order IDs (4,985) — normal multi-item order structure.
- Single-value Country column — retained for completeness despite low analytical value.
