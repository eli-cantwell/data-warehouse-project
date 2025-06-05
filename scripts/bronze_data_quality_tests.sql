/*
Data Quality Tests

Script Purpose:
    This script contains various quality checking queries for the bronze layer to identify required transformations and test data quality before
    inserting into the silver layer.
*/



-- ==========================================
-- Duplicates & NULL Values
-- ==========================================

-- Check for rows that have duplicate or NULL primary keys.
-- Expectation: No Results

SELECT cst_id, COUNT(*) 
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


-- ==========================================
-- Checking for spaces in string values
-- ==========================================

-- Check for unwanted spaces in cst_firstname
-- Expectation: No Results

SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Check for unwanted spaces in cst_lastname
-- Expectation: No Results

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Check for unwanted spaces in cst_gndr
-- Expectation: No Results

SELECT cst_gndr
FROM bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

-- ==========================================
-- Data Standardisation & Consistency
-- ==========================================

SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info