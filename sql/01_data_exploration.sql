use RetailSalesDB
go

select * from retail_sales;

-- File: 01_data_exploration.sql
-- Purpose: Initial data checks and exploration
-- Author: Kavya Naik
-- Date: April 2025

-- All column names have been standardized (lowercase + underscores) for consistency.


--Total Number of Records
SELECT COUNT(*) as total_count
FROM retail_sales;

-- View column names and data types for the retail_sales table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'retail_sales';


--Date Range of Sales
SELECT MIN(invoice_date) as startdate, MAX(invoice_date) as enddate
FROM retail_sales;


-- Sample Data
SELECT TOP 20 * 
FROM retail_sales;

-- Check missing values in key columns
SELECT 
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS missing_description,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id
FROM retail_sales;



