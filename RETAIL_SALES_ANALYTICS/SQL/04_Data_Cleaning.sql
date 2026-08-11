-- ============================================================
-- 04_Data_Cleaning.sql
-- Purpose: Apply cleaning fixes identified in Data Quality Report
-- ============================================================

USE RetailSalesAnalytics;
GO

-- ------------------------------------------------------------
-- CHECK 1: Date columns
-- Result: Order_Date and Ship_Date already stored as DATE type
-- (handled automatically during import). No action needed.
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CHECK 2: Product_Name whitespace
-- Result: 0 rows with leading/trailing whitespace found.
-- No action needed.
-- ------------------------------------------------------------
SELECT COUNT(*) AS RowsWithWhitespace
FROM SuperstoreSales
WHERE Product_Name != TRIM(Product_Name);
-- Expected: 0

-- ------------------------------------------------------------
-- CHECK 3: Product_ID mapping to multiple Product_Names
-- Investigation revealed these are genuinely DIFFERENT products
-- sharing a recycled Product_ID (known dataset quirk), not naming
-- inconsistency. DECISION: Retain as-is. Do NOT merge/rename.
-- For product-level analysis, use Product_ID + Product_Name together
-- as the unique product key.
-- ------------------------------------------------------------
SELECT Product_ID, Product_Name, COUNT(*) AS TimesUsed
FROM SuperstoreSales
WHERE Product_ID IN (
    SELECT Product_ID
    FROM SuperstoreSales
    GROUP BY Product_ID
    HAVING COUNT(DISTINCT Product_Name) > 1
)
GROUP BY Product_ID, Product_Name
ORDER BY Product_ID, TimesUsed DESC;
-- Result: 32 Product_IDs confirmed as genuinely different products
-- sharing a recycled ID. Documented, not modified.

-- ------------------------------------------------------------
-- SUMMARY: This dataset required minimal cleaning. Most flagged
-- items in the Data Quality Audit (negative profit, statistical
-- outliers, duplicate Order IDs, Product_ID reuse) were investigated
-- and confirmed as legitimate data, not errors, and were retained.
-- ------------------------------------------------------------