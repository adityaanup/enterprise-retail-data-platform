-- ============================================================================
-- Script      : vw_customers.sql
-- Layer       : ANALYTICS
-- Object      : ANALYTICS.VW_CUSTOMERS
-- Purpose     : Business-friendly customer view for reporting and analytics
--
-- Source      : CORE.DIM_CUSTOMERS
--
-- Description :
--   - Exposes customer attributes for reporting
--   - Calculates dynamic business metrics (e.g. AGE)
--   - Does not persist derived attributes
--
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA ANALYTICS;

CREATE OR REPLACE VIEW VW_CUSTOMERS AS

SELECT

    CUSTOMER_KEY,
    CUSTOMER_ID,

    FIRST_NAME,
    LAST_NAME,
    FULL_NAME,

    EMAIL,
    PHONE,

    DATE_OF_BIRTH,

    DATEDIFF(
        YEAR,
        DATE_OF_BIRTH,
        CURRENT_DATE()
    ) AS AGE,

    GENDER,

    ADDRESS_LINE1,
    ADDRESS_LINE2,

    CITY,
    STATE,
    POSTAL_CODE,
    COUNTRY,

    LOYALTY_TIER,
    MARKETING_OPT_IN,

    REGISTRATION_DATE,

    STATUS,
    IS_ACTIVE,

    CREATED_AT,
    UPDATED_AT

FROM CORE.DIM_CUSTOMERS;