# Retail Sales Analytics

An end-to-end data analytics portfolio project analyzing 4 years of retail sales data (2014–2017) using SQL Server, Python, and Power BI — from raw data to actionable business recommendations.

![Python](https://img.shields.io/badge/Python-Pandas%20%7C%20NumPy%20%7C%20Matplotlib%20%7C%20Seaborn-blue)
![SQL](https://img.shields.io/badge/SQL-SQL%20Server-red)
![Power BI](https://img.shields.io/badge/BI-Power%20BI-yellow)

---

## 📊 Business Problem

Superstore Retail Inc.'s management had access to raw transactional sales data but lacked a structured, data-driven understanding of sales performance, profitability, customer behavior, product performance, and regional performance. This project delivers that understanding — identifying not just *what* happened, but *why*, and *what to do about it*.

## 🎯 Objectives

- Measure overall sales and profitability performance
- Identify high-performing and underperforming products, categories, and sub-categories
- Understand customer behavior and value beyond raw sales volume
- Identify regional/state-level performance differences
- Detect and explain loss-making areas of the business
- Deliver evidence-based, prioritized business recommendations

## 📁 Dataset

**Source:** [Sample Superstore Dataset (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
**Size:** 9,994 rows × 21 columns
**Period:** January 2014 – December 2017
**Fields:** Order details, customer info, product info, geography, sales, quantity, discount, profit

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Database creation, cleaning, EDA, business analysis |
| Python (Pandas, NumPy) | Data cleaning, statistical analysis |
| Matplotlib, Seaborn | Data visualization |
| Power BI | Interactive dashboard, DAX measures, data modeling |
| Git/GitHub | Version control, portfolio presentation |

## 🏗️ Project Architecture

```
Raw Data → Data Quality Audit → Cleaning (SQL + Python) → EDA (SQL + Python)
→ Business Analysis → Power BI Dashboard → Insights → Recommendations
```

## 🧹 Data Cleaning

The dataset was audited before any cleaning was performed — every anomaly was evaluated individually rather than reflexively removed. Key decisions:

- **Retained** 1,871 negative-profit transactions (legitimate business losses)
- **Retained** statistical outliers in Sales and Profit (legitimate large orders/losses)
- **Fixed** 16 rows of whitespace in Product Name
- **Investigated and retained** 32 Product IDs mapped to multiple Product Names — found to be genuinely different products sharing a recycled ID (not a naming inconsistency), documented for downstream analysis rather than incorrectly merged
- **Converted** Order Date/Ship Date to proper date types

Full details: [`Dataset/data_dictionary/data_quality_report.md'](Dataset/data_dictionary/data_quality_report.md)
## 🗄️ SQL Analysis

Used SQL Server with CTEs, window functions (`RANK()`, `LAG()`, `SUM() OVER()`), and aggregate queries to calculate KPIs and analyze customers, products, categories, geography, and time trends.

Full details: [`Dataset/data_dictionary/sql_eda_report.md`](Dataset/data_dictionary/sql_eda_report.md) | Scripts: [`SQL/`](SQL/)

## 🐍 Python EDA

Univariate, bivariate, categorical, and time-series analysis using Pandas, Matplotlib, and Seaborn — including correlation analysis that quantified the relationship between discounting and profitability.

Full details: [`Dataset/data_dictionary/python_eda_report.md`](Dataset/data_dictionary/python_eda_report.md) | Notebooks: [`Python/`](Python/)

## 📈 Power BI Dashboard

A 5-page interactive dashboard:

1. **Executive Overview** — KPIs, trends, category/region breakdown
2. **Customer Analysis** — Top customers, repeat vs. one-time, segment performance
3. **Product Analysis** — Top/bottom products, category & sub-category performance
4. **Geographic Analysis** — Regional and state-level performance, map visual
5. **Profitability Analysis** — Sales vs. profit, discount vs. profit, loss-making products

Screenshots: [`PowerBI/Dashboard_Screenshots/`](PowerBI/Dashboard_Screenshots/) | File: [`PowerBI/Retail_Sales_Dashboard.pbix`](PowerBI/Retail_Sales_Dashboard.pbix)

## 💡 Key Insights

1. **A single root cause explains four separate problems.** Discount rates above ~30-40% independently explain losses in the Furniture category, the company's top-revenue customer, four specific states, and a specific product line.
2. **Sales rank ≠ value.** The #1 customer by sales revenue (Sean Miller, $25,043) is actually unprofitable (-$1,981), while the true top customer by profit (Tamara Chand) ranks 2nd in sales.
3. **Regional reporting hides state-level losses.** All 4 regions show positive margins, but Texas, Ohio, Pennsylvania, and Illinois are significantly loss-making — invisible at the regional aggregation level.
4. **Profit grew even in a flat-sales year.** 2015 saw roughly flat sales vs. 2014, yet profit grew — indicating margin efficiency improved independent of revenue growth.

Full report: 
<a href="https://github.com/Yamunasomashekar/Retail-Sales-Analytics/blob/main/RETAIL_SALES_ANALYTICS/Dataset/data_dictionary/data_quality_report.md">data_quality_report</a>

## ✅ Business Recommendations

1. Implement a company-wide discount approval policy (30%/40% thresholds)
2. Cap discounts specifically on Tables and Bookcases sub-categories
3. Shift customer prioritization from sales-based to profit-based ranking
4. Review the Cubify CubeX 3D Printer product line for repricing/discontinuation
5. Implement state-level discount monitoring for Texas, Ohio, Pennsylvania, Illinois

Full recommendations: [`Dataset/data_dictionary/final_business_recommendations.md`](Dataset/data_dictionary/final_business_recommendations.md)

## 📂 Project Structure

```
Retail-Sales-Analytics/
├── Dataset/
│   ├── raw_data/              # Original, unmodified source data
│   ├── cleaned/                # Cleaned dataset (Python output)
│   └── data_dictionary/        # All documentation & reports
├── SQL/                        # SQL scripts (numbered by phase)
├── Python/                     # Jupyter notebooks (numbered by phase)
├── PowerBI/                    # Dashboard file + screenshot                  workbook
├── README.md
└── .gitignore
```

## 🚀 How to Run This Project

1. **SQL:** Restore/create the database using scripts in `SQL/`, in numbered order (`01` through `07`)
2. **Python:** Open notebooks in `Python/` in numbered order; run `pip install pandas numpy matplotlib seaborn` first
3. **Power BI:** Open `PowerBI/Retail_Sales_Dashboard.pbix` in Power BI Desktop

## 📸 Dashboard Screenshots

See [`PowerBI/Dashboard_Screenshots/`](PowerBI/Dashboard_Screenshots/) for all 5 dashboard pages.

---

*This project was built as a comprehensive portfolio piece demonstrating the full data analyst workflow: from raw data through cleaning, exploratory analysis, business analysis, and interactive dashboarding, to evidence-based business recommendations.*
