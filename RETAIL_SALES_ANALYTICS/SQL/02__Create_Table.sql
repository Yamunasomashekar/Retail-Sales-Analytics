-- Switch to our project database before creating anything inside it
USE RetailSalesAnalytics;
GO

-- Create the main table to hold raw Superstore sales data
CREATE TABLE SuperstoreSales (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(20),
    Order_Date VARCHAR(20),      -- kept as text for now, converted to DATE during cleaning
    Ship_Date VARCHAR(20),       -- kept as text for now, converted to DATE during cleaning
    ShipMode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),     -- kept as text; postal codes are identifiers, not numbers to calculate with
    Region VARCHAR(50),
    Product_ID VARCHAR(30),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(500),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);
GO

-- Confirm table was created and check its structure
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SuperstoreSales';



USE RetailSalesAnalytics;
GO

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(*) AS TotalRows FROM SuperstoreSales;