-- File: 02_data_cleaning.sql
-- Purpose: Data cleaning and transformations
-- Author: Kavya Naik
-- Date: April 2025


-- Create a new column with only the date part of invoice_date
ALTER TABLE retail_sales
ADD invoice_date_only AS CAST(invoice_date AS DATE);

-- Standardized column names to lowercase and underscore format
-- to avoid case sensitivity issues across platforms.

EXEC sp_rename 'retail_sales.Invoice', 'invoice', 'COLUMN';
EXEC sp_rename 'retail_sales.StockCode', 'stock_code', 'COLUMN';
EXEC sp_rename 'retail_sales.Description', 'description', 'COLUMN';
EXEC sp_rename 'retail_sales.Price', 'price', 'COLUMN';
EXEC sp_rename 'retail_sales.Customer_ID', 'customer_id', 'COLUMN';
EXEC sp_rename 'retail_sales.Country', 'country', 'COLUMN';
EXEC sp_rename 'retail_sales.Quantity', 'quantity', 'COLUMN';
EXEC sp_rename 'retail_sales.InvoiceDate', 'invoice_date', 'COLUMN';