-- ============================================================================
-- Script      : validate_dim_customers.sql
-- Layer       : CORE
-- Purpose     : Validate Customer Dimension
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA CORE;

-- Total Rows
SELECT COUNT(*) AS TOTAL_ROWS
FROM DIM_CUSTOMERS;

-- Sample Data
SELECT *
FROM DIM_CUSTOMERS
LIMIT 20;

-- Duplicate Business Keys
SELECT
    CUSTOMER_ID,
    COUNT(*) AS RECORD_COUNT
FROM DIM_CUSTOMERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 1;

-- Active vs Inactive
SELECT
    IS_ACTIVE,
    COUNT(*) AS CUSTOMER_COUNT
FROM DIM_CUSTOMERS
GROUP BY IS_ACTIVE;

-- Loyalty Tier Distribution
SELECT
    LOYALTY_TIER,
    COUNT(*) AS CUSTOMER_COUNT
FROM DIM_CUSTOMERS
GROUP BY LOYALTY_TIER
ORDER BY CUSTOMER_COUNT DESC;

-- Null Customer IDs
SELECT COUNT(*) AS NULL_CUSTOMER_IDS
FROM DIM_CUSTOMERS
WHERE CUSTOMER_ID IS NULL;

-- Timestamp Range
SELECT
    MIN(CREATED_AT) AS FIRST_CREATED_AT,
    MAX(CREATED_AT) AS LAST_CREATED_AT,
    MIN(UPDATED_AT) AS FIRST_UPDATED_AT,
    MAX(UPDATED_AT) AS LAST_UPDATED_AT
FROM DIM_CUSTOMERS;