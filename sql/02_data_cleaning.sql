-- File: 02_data_cleaning.sql
-- Purpose: Data cleaning and transformations
-- Author: Kavya Naik
-- Date: April 2025

-- Schema Recommendations:

use RetailSalesDB
go

-- Remove duplicate rows based on invoice and stock_code
DELETE FROM retail_sales
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM retail_sales
    GROUP BY invoice, stock_code
);

--1. Create a new column with only the date part of invoice_date
ALTER TABLE retail_sales
ADD invoice_date_only AS CAST(invoice_date AS DATE);

--2 Standardized column names to lowercase and underscore format
-- to avoid case sensitivity issues across platforms.

EXEC sp_rename 'retail_sales.Invoice', 'invoice', 'COLUMN';
EXEC sp_rename 'retail_sales.StockCode', 'stock_code', 'COLUMN';
EXEC sp_rename 'retail_sales.description', 'product_description', 'COLUMN';
EXEC sp_rename 'retail_sales.Price', 'price', 'COLUMN';
EXEC sp_rename 'retail_sales.Customer_ID', 'customer_id', 'COLUMN';
EXEC sp_rename 'retail_sales.Country', 'country', 'COLUMN';
EXEC sp_rename 'retail_sales.Quantity', 'quantity', 'COLUMN';
EXEC sp_rename 'retail_sales.InvoiceDate', 'invoice_date', 'COLUMN';



-- 4. Change 'price' column data type to DECIMAL(10,2) for precise monetary values.
 ALTER TABLE retail_sales 
 ALTER COLUMN price DECIMAL(10,2);

-- 5. Update 'customer_id' column data type to INT for consistency with integer IDs.
ALTER TABLE retail_sales 
ALTER COLUMN customer_id INT;

-- 6. Create a new column for total_amount as quantity*price.
ALTER TABLE retail_sales
ADD total_amount AS (quantity * price) PERSISTED;

-- Remove duplicate rows based on invoice and stock_code
WITH cte AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY invoice, stock_code ORDER BY invoice_date) AS row_num
    FROM retail_sales
)
DELETE FROM retail_sales
WHERE EXISTS (
    SELECT 1
    FROM cte
    WHERE retail_sales.invoice = cte.invoice
    AND retail_sales.stock_code = cte.stock_code
    AND cte.row_num > 1
);

-- Replace missing quantity with 0
UPDATE retail_sales
SET quantity = 0
WHERE quantity IS NULL;

-- Fill missing price with average price for that product (if price is missing)
WITH avg_price AS (
    SELECT stock_code, AVG(price) AS avg_price
    FROM retail_sales
    GROUP BY stock_code
)
UPDATE retail_sales 
SET price = ap.avg_price
FROM avg_price ap
WHERE retail_sales.stock_code = ap.stock_code
AND retail_sales.price IS NULL;


