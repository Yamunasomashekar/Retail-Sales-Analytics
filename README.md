# Retail-Sales-Analytics
An end-to-end data analytics portfolio project analyzing 4 years of retail sales data (2014–2017) using SQL Server, Python, and Power BI  from raw data to actionable business recommendations.

## Business Problem

The company had a large amount of raw sales data but lacked clear insights into sales, profit, customers, products, and regional performance. The goal of this project was to analyze the data, find the main reasons behind losses, and provide useful insights for better business decisions.

## Objectives

- Analyze overall sales and profit performance
- Identify top and low-performing products and categories
- Understand customer behavior and value
- Compare performance across regions and states
- Identify loss-making products, customers, and locations
- Find the key factors affecting profitability
- Provide data-driven business recommendations

## Dataset 
<a href="https://github.com/Yamunasomashekar/Retail-Sales-Analytics/blob/main/RETAIL_SALES_ANALYTICS/Dataset/raw_data/SuperstoreSales.csv">Dataset</a>

## Data Cleaning

- Checked the dataset for missing values, duplicates, incorrect formats, and unusual records.
- Kept 1,871 negative-profit transactions because they represented real business losses.
- Kept genuine high-value and low-profit outliers instead of removing them.
- Cleaned 16 Product Name records containing extra spaces.
- Investigated 32 Product IDs with multiple product names and confirmed they represented  
  different products
- Converted Order Date and Ship Date into proper date formats.
<a href="https://github.com/Yamunasomashekar/Retail-Sales-Analytics/blob/main/RETAIL_SALES_ANALYTICS/Dataset/data_dictionary/cleaned_data_quality_report.md">cleaned data quality report </a>

## SQL Analysis

- Used SQL Server to analyze the retail sales data.
- Calculated important KPIs such as Sales, Profit, Orders, Customers, and Average Order Value.
- Analyzed customers, products, categories, regions, states, and sales trends.
- Used advanced SQL concepts including CTEs, RANK(), LAG(), and Window Functions.
  <a href="https://github.com/Yamunasomashekar/Retail-Sales-Analytics/blob/main/RETAIL_SALES_ANALYTICS/Dataset/data_dictionary/sql_eda_report.md">sql eda report</a>

  
