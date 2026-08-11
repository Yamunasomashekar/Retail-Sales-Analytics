----Verification 1: Is Sean Miller's discount rate abnormally high?----

USE RetailSalesAnalytics;
GO

-- Sean Miller's average discount vs. company-wide average
SELECT
    'Sean Miller' AS Comparison,
    AVG(Discount) AS AvgDiscount
FROM SuperstoreSales
WHERE Customer_Name = 'Sean Miller'

UNION ALL

SELECT
    'Company Average' AS Comparison,
    AVG(Discount) AS AvgDiscount
FROM SuperstoreSales;

-----Verification 2: Is Furniture (Tables/Bookcases) getting heavier discounts than other sub-categories?----

SELECT
    Category,
    Sub_Category,
    AVG(Discount) AS AvgDiscount,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY Category, Sub_Category
ORDER BY AvgDiscount DESC;

----Verification 3: Are the loss-making states (Texas, Ohio, Pennsylvania, Illinois) getting heavier discounts?---

SELECT
    State,
    AVG(Discount) AS AvgDiscount,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
WHERE State IN ('Texas', 'Ohio', 'Pennsylvania', 'Illinois')
GROUP BY State
ORDER BY TotalProfit ASC;

---to see the company-wide average for context:----

SELECT AVG(Discount) AS CompanyAvgDiscount FROM SuperstoreSales;