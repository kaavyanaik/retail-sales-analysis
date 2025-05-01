# 🛍️ Retail Sales Data Analysis

## 🔍 Objective
Analyze online retail sales data to uncover key insights such as sales trends, product performance, customer behavior, and regional contributions using **SQL**, **Python**, and **Power BI**.

---

## 📁 Dataset
- **Source**: [Online Retail II Dataset - Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)
- Contains transactional data including invoices, products, customers, and purchase details from a UK-based online retailer.

---

## ⚙️ Tools Used
- **SQL Server** – Data cleaning, exploration, and analytical queries
- **Python (pandas, matplotlib, seaborn)** – Visual analysis and chart generation
- **Power BI** – Interactive dashboard for business insights
- **Git & GitHub** – Version control and collaboration

---

## 📊 Key Insights
- 📈 **December** had the highest revenue and order volume
- 🇬🇧 **UK** accounted for over **65%** of total revenue
- 🔝 **Top 20%** of products contributed to **80%** of total sales (Pareto Principle)
- ⏰ Peak purchases occurred between **10 AM to 1 PM**
- 🔁 Most returns were linked to a small number of specific items

---

## 🧠 Questions Answered
1. What are total monthly sales?
2. Which are the top-selling products?
3. Which countries generate the most revenue?
4. What is the average number of purchases per customer?
5. What are the most returned items?
6. What are the peak sales hours or days?

---

## 📂 Project Structure

```
retail-sales-analysis/
│
├── data/                    
│   └── retail_sales.csv                  # Original dataset
│
├── sql/                     
│   ├── 01_data_exploration.sql           # Schema checks, nulls, samples
│   ├── 02_data_cleaning.sql              # Column renaming, type casting
│   ├── 03_analysis_queries.sql           # Business KPIs and insights
│   └── 04_visualization_queries.sql      # SQL for charts
│
├── charts/                  
│   ├── sales_by_country.png
│   ├── sales_by_month.png
│   ├── top_10_products.png
│   └── top_customers.png
│
├── notebook/                
│   └── retail_sales_analysis.ipynb       # Python code for data viz
│
├── visual/                 
│   └── retail_sales_dashboard.pbix       # Power BI dashboard
│
└── README.md               
```

---

## 📈 Power BI Dashboard

The `.pbix` file includes:
- Revenue by Month (line chart)
- Top 10 Products by Revenue
- Top Customers by Spend
- Sales by Country (map/bar)
- Peak Sales Hours (bar)
- Returns Overview

Filters:
- Date Range
- Country
- Product Description
- Customer ID

---

## 📌 Status
✅ SQL cleaning & analysis completed  
✅ Python visualizations created  
✅ Power BI dashboard built  
🚀 Ready for presentation or portfolio showcase

---

## 🧑‍💻 Author

**Kavya Naik**  
*Data Analyst | SQL & Python Enthusiast*  
