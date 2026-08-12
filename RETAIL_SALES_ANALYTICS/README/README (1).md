# Retail Sales Analytics

An end-to-end data analytics portfolio project analyzing 4 years of retail sales data (2014–2017) using SQL Server, Python, and Power BI — from raw data to actionable business recommendations.

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


##  Dataset

**Source:** [Sample Superstore Dataset (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
**Size:** 9,994 rows × 21 columns
**Period:** January 2014 – December 2017
**Fields:** Order details, customer info, product info, geography, sales, quantity, discount, profit

##  Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Database creation, cleaning, EDA, business analysis |
| Python (Pandas, NumPy) | Data cleaning, statistical analysis |
| Matplotlib, Seaborn | Data visualization |
| Power BI | Interactive dashboard, DAX measures, data modeling |
| Git/GitHub | Version control, portfolio presentation |

##  Project Architecture

```
Raw Data → Data Quality Audit → Cleaning (SQL + Python) → EDA (SQL + Python)
→ Business Analysis → Power BI Dashboard → Insights → Recommendations
```

## Data Cleaning

- Checked the dataset for missing values, duplicates, incorrect formats, and unusual records.
- Kept 1,871 negative-profit transactions because they represented real business losses.
- Kept genuine high-value and low-profit outliers instead of removing them.
- Cleaned 16 Product Name records containing extra spaces.
- Investigated 32 Product IDs with multiple product names and confirmed they represented  
  different products
- Converted Order Date and Ship Date into proper date formats.



## SQL Analysis

- Used SQL Server to analyze the retail sales data.
- Calculated important KPIs such as Sales, Profit, Orders, Customers, and Average Order Value.
- Analyzed customers, products, categories, regions, states, and sales trends.
- Used advanced SQL concepts including CTEs, RANK(), LAG(), and Window Functions.

##  Python EDA

- Used Pandas to explore and analyze the dataset.
- Performed analysis of sales, profit, customers, products, and time-based trends.
- Used Matplotlib and Seaborn to create visualizations.
- Analyzed the relationship between discounts and profit.

##  Power BI Dashboard

Created a 5-page interactive Power BI dashboard:

1. Executive Overview – KPIs, sales trends, categories, and regions.
2. Customer Analysis – Top customers, repeat customers, and segments.
3. Product Analysis – Top and low-performing products and categories.
4. Geographic Analysis – Regional, state, and city-level performance.
5. Profitability Analysis – Sales vs. profit, discounts vs. profit, and loss-making products.


##  Key Insights

1. High discounts were strongly linked to lower profits and business losses.
2. The customer with the highest sales was actually making a loss, showing that high sales do not   
   always mean high profit.
3. Texas, Ohio, Pennsylvania, and Illinois were loss-making even though their overall regions were 
   profitable.
4. Profit increased in 2015 even though sales remained almost flat, showing improved profitability.
5. Detailed analysis at the state, customer, and product level revealed problems that were hidden  
   in overall sales numbers.

## Business Recommendations

1. Implement a company-wide discount approval policy (30%/40% thresholds)
2. Cap discounts specifically on Tables and Bookcases sub-categories
3. Shift customer prioritization from sales-based to profit-based ranking
4. Review the Cubify CubeX 3D Printer product line for repricing/discontinuation
5. Implement state-level discount monitoring for Texas, Ohio, Pennsylvania, Illinois

## Conclusion

This project demonstrates how SQL, Python, and Power BI can be used together to turn raw retail data into useful business insights. The analysis helped identify profitable and loss-making areas and highlighted the impact of discounting on profitability.
