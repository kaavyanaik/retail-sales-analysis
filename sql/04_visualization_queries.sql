-- File: 04_visualization_queries.sql
-- Purpose: SQL queries for charts (monthly revenue, product trends)
-- Author: Kavya Naik
-- Date: April 2025



-- Monthly sales trend
SELECT MONTH(invoice_date_only) AS month, SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY MONTH(invoice_date_only)
ORDER BY month;

-- Top 10 selling products by total amount
SELECT TOP 10 stock_code, product_description, SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY stock_code, product_description
ORDER BY total_sales DESC;

-- Sales by country
SELECT country, SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY country
ORDER BY total_sales DESC;

-- Customer segments by total spending
SELECT TOP 10 customer_id, SUM(total_amount) AS total_spending
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spending DESC;



