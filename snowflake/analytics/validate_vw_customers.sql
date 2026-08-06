-- ============================================================================
-- Script      : validate_vw_customers.sql
-- Layer       : ANALYTICS
-- Object      : ANALYTICS.VW_CUSTOMERS
-- Purpose     : Validate analytics customer view
--
-- Validation  :
--   - Row count
--   - Duplicate business keys
--   - Null checks
--   - Customer status distribution
--   - Loyalty tier distribution
--   - Country distribution
--
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA ANALYTICS;

-- ============================================================================
-- Row Count
-- ============================================================================

SELECT
    COUNT(*) AS TOTAL_ROWS
FROM VW_CUSTOMERS;

-- ============================================================================
-- Sample Data
-- ============================================================================

SELECT *
FROM VW_CUSTOMERS
LIMIT 20;

-- ============================================================================
-- Duplicate Customer IDs
-- ============================================================================

SELECT
    CUSTOMER_ID,
    COUNT(*) AS RECORD_COUNT
FROM VW_CUSTOMERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 1;

-- ============================================================================
-- Null Customer IDs
-- ============================================================================

SELECT
    COUNT(*) AS NULL_CUSTOMER_IDS
FROM VW_CUSTOMERS
WHERE CUSTOMER_ID IS NULL;

-- ============================================================================
-- Customer Status Distribution
-- ============================================================================

SELECT
    STATUS,
    COUNT(*) AS CUSTOMER_COUNT
FROM VW_CUSTOMERS
GROUP BY STATUS
ORDER BY CUSTOMER_COUNT DESC;

-- ============================================================================
-- Active vs Inactive Customers
-- ============================================================================

SELECT
    IS_ACTIVE,
    COUNT(*) AS CUSTOMER_COUNT
FROM VW_CUSTOMERS
GROUP BY IS_ACTIVE;

-- ============================================================================
-- Loyalty Tier Distribution
-- ============================================================================

SELECT
    LOYALTY_TIER,
    COUNT(*) AS CUSTOMER_COUNT
FROM VW_CUSTOMERS
GROUP BY LOYALTY_TIER
ORDER BY CUSTOMER_COUNT DESC;

-- ============================================================================
-- Country Distribution
-- ============================================================================

SELECT
    COUNTRY,
    COUNT(*) AS CUSTOMER_COUNT
FROM VW_CUSTOMERS
GROUP BY COUNTRY
ORDER BY CUSTOMER_COUNT DESC;