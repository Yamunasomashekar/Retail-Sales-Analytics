# Python Data Cleaning Report — Retail Sales Analytics

**Notebook:** `Python/03_Data_Cleaning.ipynb`
**Input:** `Dataset/raw_data/Sample - Superstore.csv`
**Output:** `Dataset/cleaned/superstore_cleaned.csv`
**Tool:** Python (Pandas)

---

## Purpose

This step applies the cleaning decisions documented in the Data Quality Report (Step 4) using Python/Pandas, independently of the SQL cleaning performed in Step 5. This ensures the cleaned dataset is available in a format ready for Python-based EDA, statistical analysis, and visualization (Steps 8+), and demonstrates the same data process reproduced across two different tools.

---

## Cleaning Actions Performed

### 1. Date Column Conversion

**Issue:** `Order Date` and `Ship Date` were loaded as text (`object` dtype), not usable for date-based calculations (trends, day-of-week analysis, shipping duration, etc.)

**Action:**
```python
df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')
```

**Result:** Both columns converted from `object` to `datetime64[ns]`.

---

### 2. Product Name Whitespace Trim

**Issue:** 16 rows in `Product Name` had leading/trailing whitespace, which would cause the same product to be treated as multiple distinct values during grouping/aggregation.

**Action:**
```python
df['Product Name'] = df['Product Name'].str.strip()
```

**Result:** Whitespace issues reduced from 16 rows to 0.

---

### 3. Product_ID → Product_Name Mismatch — Investigated, Not Modified

**Issue:** 32 `Product_ID`s were found mapped to more than one `Product_Name`.

**Investigation finding:** These are genuinely different, unrelated products sharing a recycled `Product_ID` (e.g., a bookcase and a library shelf sharing one ID; a VoIP phone and a Samsung Galaxy Note 2 sharing another). This is a known limitation in the source dataset, not an inconsistent naming issue.

**Decision:** **Retained as-is.** No renaming or merging performed. Standardizing to a single name per Product_ID would have misattributed sales between unrelated products.

**Downstream guidance:** For any product-level analysis (Steps 8, 9, 12), group by `Product_ID` + `Product_Name` together, not `Product_ID` alone, to avoid conflating unrelated products.

---

### 4. Explicitly Retained (Not Treated as Errors)

Consistent with the Data Quality Report decisions:
- **Negative Profit values** (1,871 rows) — legitimate business losses, retained for profitability analysis.
- **Statistical outliers in Sales and Profit** — legitimate large orders/losses, retained for analysis.
- **Duplicate Order IDs** (4,985 instances) — normal multi-line-item order structure, retained.

---

## Before vs. After Summary

| Metric | Before (Raw) | After (Cleaned) |
|---|---|---|
| Rows | 9,994 | 9,994 |
| Columns | 21 | 21 |
| Missing values | 0 | 0 |
| Duplicate rows | 0 | 0 |
| Order Date / Ship Date dtype | object (text) | datetime64[ns] |
| Product Name whitespace issues | 16 | 0 |
| Product_ID/Name mismatches | 32 (documented) | 32 (documented, unchanged) |
| Negative Profit rows | 1,871 (retained) | 1,871 (retained) |

**No rows were added or removed during cleaning.** The cleaning process focused solely on data type correction and text formatting — not data removal — consistent with the principle established in the Data Quality Audit: only fix genuine errors, retain legitimate business signal.

---

## Consistency Check with SQL Cleaning (Step 5)

| Check | SQL Result | Python Result | Match |
|---|---|---|---|
| Total rows | 9,994 | 9,994 | ✅ |
| Product_ID/Name mismatches | 32 | 32 | ✅ |
| Missing values | 0 | 0 | ✅ |
| Date columns properly typed | Yes (auto by import wizard) | Yes (via pd.to_datetime) | ✅ |

Both tools arrive at a consistent, verified clean dataset via independent processes.
