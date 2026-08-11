--Part 1: KPIs (Executive Summary Numbers)--

SELECT
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    COUNT(DISTINCT Customer_ID) AS TotalCustomers,
    COUNT(DISTINCT Product_ID) AS TotalProducts,
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS AvgOrderValue,
    SUM(Profit) / COUNT(DISTINCT Order_ID) AS AvgProfitPerOrder,
    (SUM(Profit) / SUM(Sales)) * 100 AS ProfitMarginPercent
FROM SuperstoreSales;

---Part 2: Customer Analysis---

---Top 10 Customers by Sales---
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    COUNT(DISTINCT Order_ID) AS NumOrders
FROM SuperstoreSales
GROUP BY Customer_ID, Customer_Name
ORDER BY TotalSales DESC;

---Top 10 Customers by Profit---
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Profit) AS TotalProfit,
    SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Customer_ID, Customer_Name
ORDER BY TotalProfit DESC;

---Repeat vs. One-Time Customers---
WITH CustomerOrderCounts AS (
    SELECT
        Customer_ID,
        Customer_Name,
        COUNT(DISTINCT Order_ID) AS OrderCount
    FROM SuperstoreSales
    GROUP BY Customer_ID, Customer_Name
)
SELECT
    CASE WHEN OrderCount = 1 THEN 'One-Time Customer' ELSE 'Repeat Customer' END AS CustomerType,
    COUNT(*) AS NumCustomers
FROM CustomerOrderCounts
GROUP BY CASE WHEN OrderCount = 1 THEN 'One-Time Customer' ELSE 'Repeat Customer' END;

---Part 3: Product Analysis--

-----Top 10 Products by Sales---
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM SuperstoreSales
GROUP BY Product_ID, Product_Name
ORDER BY TotalSales DESC;

---Top 10 Products by Profit---
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Profit) AS TotalProfit,
    SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Product_ID, Product_Name
ORDER BY TotalProfit DESC;

---Loss-Making Products (Bottom 10 by Profit)---
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Profit) AS TotalProfit,
    SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Product_ID, Product_Name
ORDER BY TotalProfit ASC;

---Category & Sub-Category Performance----
SELECT
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    (SUM(Profit)/SUM(Sales))*100 AS ProfitMarginPercent
FROM SuperstoreSales
GROUP BY Category
ORDER BY TotalSales DESC;

SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    (SUM(Profit)/SUM(Sales))*100 AS ProfitMarginPercent
FROM SuperstoreSales
GROUP BY Category, Sub_Category
ORDER BY TotalProfit ASC;

---Part 4: Geography---
SELECT
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    (SUM(Profit)/SUM(Sales))*100 AS ProfitMarginPercent
FROM SuperstoreSales
GROUP BY Region
ORDER BY TotalProfit DESC;


SELECT TOP 10
    State,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    (SUM(Profit)/SUM(Sales))*100 AS ProfitMarginPercent
FROM SuperstoreSales
GROUP BY State
ORDER BY TotalProfit ASC;


SELECT TOP 10
    City,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY City
ORDER BY TotalProfit DESC;

--Part 5: Time Trends---

SELECT
    YEAR(Order_Date) AS OrderYear,
    MONTH(Order_Date) AS OrderMonth,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY OrderYear, OrderMonth;

SELECT
    YEAR(Order_Date) AS OrderYear,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY YEAR(Order_Date)
ORDER BY OrderYear;

---geography---
SELECT TOP 10
    City,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY City
ORDER BY TotalProfit DESC;

---Part 6: Advanced SQL----

----Rank customers by profit (using RANK/DENSE_RANK)----
SELECT
    Customer_Name,
    SUM(Profit) AS TotalProfit,
    RANK() OVER (ORDER BY SUM(Profit) DESC) AS ProfitRank
FROM SuperstoreSales
GROUP BY Customer_Name
ORDER BY ProfitRank
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

----Month-over-month sales growth using LAG()----
WITH MonthlySales AS (
    SELECT
        YEAR(Order_Date) AS OrderYear,
        MONTH(Order_Date) AS OrderMonth,
        SUM(Sales) AS TotalSales
    FROM SuperstoreSales
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
)
SELECT
    OrderYear,
    OrderMonth,
    TotalSales,
    LAG(TotalSales) OVER (ORDER BY OrderYear, OrderMonth) AS PreviousMonthSales,
    TotalSales - LAG(TotalSales) OVER (ORDER BY OrderYear, OrderMonth) AS SalesChange
FROM MonthlySales
ORDER BY OrderYear, OrderMonth;

----Running total of sales using SUM() OVER()----
WITH MonthlySales AS (
    SELECT
        YEAR(Order_Date) AS OrderYear,
        MONTH(Order_Date) AS OrderMonth,
        SUM(Sales) AS TotalSales
    FROM SuperstoreSales
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
)
SELECT
    OrderYear,
    OrderMonth,
    TotalSales,
    SUM(TotalSales) OVER (ORDER BY OrderYear, OrderMonth ROWS UNBOUNDED PRECEDING) AS RunningTotalSales
FROM MonthlySales
ORDER BY OrderYear, OrderMonth;


