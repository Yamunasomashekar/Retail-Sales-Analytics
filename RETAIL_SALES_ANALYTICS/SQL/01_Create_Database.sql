-- Create a dedicated database for the Retail Sales Analytics project

CREATE DATABASE RetailSalesAnalytics;
GO

-- Confirm it was created
SELECT name FROM sys.databases WHERE name = 'RetailSalesAnalytics';