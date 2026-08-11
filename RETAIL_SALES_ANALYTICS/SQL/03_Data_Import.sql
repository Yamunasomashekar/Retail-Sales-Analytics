-- ============================================================
-- 03_Data_Import.sql
-- Purpose: Import raw Superstore CSV data into SQL Server
-- Source File: Dataset/raw_data/Sample - Superstore.csv
-- Method: SSMS "Import Flat File" Wizard
-- ============================================================

USE RetailSalesAnalytics;
GO

-- ------------------------------------------------------------
-- NOTE ON METHOD:
-- Data was imported using SSMS's "Import Flat File" wizard
-- (Right-click RetailSalesAnalytics database > Tasks > Import Flat File)
-- Table name specified during import: SuperstoreSales
-- Column settings used:
--   - Allow Nulls: checked for all columns (safety net; source data
--     itself has zero missing values, confirmed in Python Step 3/4)
--   - Product_Name data type: changed to nvarchar(500) to avoid truncation
--   - Order_Date / Ship_Date: auto-detected as DATE type by wizard
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- VERIFICATION: Confirm table exists and row count matches source
-- Expected: 9994 rows (matches original CSV row count)
-- ------------------------------------------------------------

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(*) AS TotalRows 
FROM SuperstoreSales;  
-- Result: 9994 (matches source CSV) - CONFIRMED

-- ------------------------------------------------------------
-- ISSUE FOUND DURING IMPORT:
-- Wizard warning: "Up to 1 cell of data may have been dropped 
-- from column: Profit"
-- Row affected: RowID = 7345 (Order ID: CA-2017-168389)
-- Cause: Likely a floating-point/negative-value edge case during 
-- the wizard's automatic type conversion (not a source data error - 
-- confirmed the CSV has zero missing values in Python Step 3/4)
-- ------------------------------------------------------------

-- Check for any NULL Profit values post-import
SELECT * FROM SuperstoreSales WHERE Profit IS NULL;

-- Confirmed correct value from source CSV (Python cross-check): -420.0
-- Applying the fix:
UPDATE SuperstoreSales
SET Profit = -420.0
WHERE Row_ID = 7345;

-- ------------------------------------------------------------
-- FINAL VERIFICATION
-- ------------------------------------------------------------

-- Confirm the fix applied correctly
SELECT * FROM SuperstoreSales WHERE Row_ID = 7345;

-- Confirm zero remaining nulls in Profit
SELECT COUNT(*) AS RemainingNullProfit 
FROM SuperstoreSales 
WHERE Profit IS NULL;  
-- Expected: 0

-- Final row count re-check
SELECT COUNT(*) AS FinalTotalRows 
FROM SuperstoreSales;  
-- Expected: 9994


-----explanation----

----finding table name----
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

----how many rows are there in table---
SELECT COUNT(*) AS TotalRows FROM SuperstoreSales;

----finding which row is null---
SELECT * FROM SuperstoreSales WHERE Profit IS NULL;
/*conclusion 
row_id 7345 is null*/

/* in python data_understanding file 
excute df[df['Row ID'] == 7345]
finding 'Row ID' ==7345 actual profit value ,profit =-420*/

---update it---
UPDATE SuperstoreSales
SET Profit = -420.0
WHERE Row_ID = 7345;

SELECT * FROM SuperstoreSales WHERE Row_ID = 7345;

