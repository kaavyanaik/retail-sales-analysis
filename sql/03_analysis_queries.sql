-- File: 03_analysis_queries.sql
-- Purpose: Core analysis queries for business insights
-- Author: Kavya Naik
-- Date: April 2025


-- What are the total sales by month?
  SELECT 
      FORMAT(invoice_date_only, 'yyyy-MM') AS month,
      SUM(total_amount) as total_sales
  FROM retail_sales
  GROUP BY FORMAT(invoice_date_only, 'yyyy-MM')
  ORDER BY month;


-- What are the top 10 selling products by revenue?

SELECT TOP 10 
	product_description, 
	SUM(total_amount) AS revenue
FROM retail_sales
GROUP BY product_description
ORDER BY revenue DESC ;


-- Which countries generate the most revenue?
SELECT 
	country,
	sum(total_amount) as revenue
FROM retail_sales
GROUP BY country
ORDER BY revenue DESC;

-- What is the average number of purchases per customer?
SELECT
	COUNT(DISTINCT(invoice))/COUNT(DISTINCT(customer_id)) as avg_purchase
FROM retail_sales
WHERE customer_id IS NOT NULL;


-- What are the top 5 most returned items?
SELECT TOP 5
	product_description,
	COUNT(DISTINCT invoice) as returned_count
FROM retail_sales
WHERE invoice like 'C%'
GROUP BY product_description
ORDER BY returned_count DESC;


-- What is the average order value per country?

select * from retail_sales;
SELECT 
	country,
	ROUND(SUM(total_amount)/COUNT(DISTINCT invoice),2) AS avg_order
FROM retail_sales
WHERE country IS NOT NULL
GROUP BY country 
ORDER BY avg_order DESC;

-- What are the peak hours or days for sales?
SELECT
	DATEPART(HOUR, invoice_date_only) as peak_hour,
	COUNT(*) AS number_of_sales
FROM retail_sales
GROUP BY DATEPART(HOUR, invoice_date_only)
ORDER BY number_of_sales DESC;





