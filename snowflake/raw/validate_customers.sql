-- ============================================================================
-- Script      : validate_customers.sql
-- Purpose     : Validate RAW.CUSTOMERS data after ingestion
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA RAW;

-- ============================================================================
-- Total Row Count
-- ============================================================================

SELECT
    COUNT(*) AS TOTAL_ROWS
FROM CUSTOMERS;

-- ============================================================================
-- Sample Data
-- ============================================================================

SELECT *
FROM CUSTOMERS
LIMIT 20;

-- ============================================================================
-- Duplicate Customer IDs
-- ============================================================================

SELECT
    CUSTOMER_ID,
    COUNT(*) AS RECORD_COUNT
FROM CUSTOMERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 1;

-- ============================================================================
-- Null Business Keys
-- ============================================================================

SELECT
    COUNT(*) AS NULL_CUSTOMER_IDS
FROM CUSTOMERS
WHERE CUSTOMER_ID IS NULL;

-- ============================================================================
-- Null Email Addresses
-- ============================================================================

SELECT
    COUNT(*) AS NULL_EMAILS
FROM CUSTOMERS
WHERE EMAIL IS NULL;

-- ============================================================================
-- Null Registration Dates
-- ============================================================================

SELECT
    COUNT(*) AS NULL_REGISTRATION_DATES
FROM CUSTOMERS
WHERE REGISTRATION_DATE IS NULL;

-- ============================================================================
-- Customer Status Distribution
-- ============================================================================

SELECT
    STATUS,
    COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY STATUS
ORDER BY CUSTOMER_COUNT DESC;

-- ============================================================================
-- Loyalty Tier Distribution
-- ============================================================================

SELECT
    LOYALTY_TIER,
    COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY LOYALTY_TIER
ORDER BY CUSTOMER_COUNT DESC;

-- ============================================================================
-- Registration Date Range
-- ============================================================================

SELECT
    MIN(REGISTRATION_DATE) AS MIN_REGISTRATION_DATE,
    MAX(REGISTRATION_DATE) AS MAX_REGISTRATION_DATE
FROM CUSTOMERS;

-- ============================================================================
-- Timestamp Validation
-- ============================================================================

SELECT
    MIN(CREATED_AT) AS FIRST_CREATED_AT,
    MAX(CREATED_AT) AS LAST_CREATED_AT,
    MIN(UPDATED_AT) AS FIRST_UPDATED_AT,
    MAX(UPDATED_AT) AS LAST_UPDATED_AT
FROM CUSTOMERS;