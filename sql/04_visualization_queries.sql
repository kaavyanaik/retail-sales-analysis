-- File: 04_visualization_queries.sql
-- Purpose: SQL queries for charts (monthly revenue, product trends)
-- Author: Kavya Naik
-- Date: April 2025

use RetailSalesDB
go

-- Revenue by month for chart
SELECT 
	  FORMAT(invoice_date_only, 'yyyy-MM') AS month,
      SUM(total_amount) as revenue
FROM retail_sales
GROUP BY FORMAT(invoice_date_only, 'yyyy-MM')
ORDER BY month;


-- Top 5 countries by revenue
SELECT TOP 5
	country,
	SUM(total_amount) as revenue
FROM retail_sales
GROUP BY country
ORDER BY country DESC;



