-- ============================================================================
-- Script      : load_dim_customers.sql
-- Layer       : CORE
-- Purpose     : Load Customer Dimension
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA CORE;

TRUNCATE TABLE DIM_CUSTOMERS;

INSERT INTO DIM_CUSTOMERS (

    CUSTOMER_ID,

    FIRST_NAME,
    LAST_NAME,
    FULL_NAME,

    EMAIL,
    PHONE,

    DATE_OF_BIRTH,
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

)

SELECT

    CUSTOMER_ID,

    FIRST_NAME,
    LAST_NAME,
    FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,

    EMAIL,
    PHONE,

    DATE_OF_BIRTH,
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

    CASE
        WHEN STATUS = 'ACTIVE' THEN TRUE
        ELSE FALSE
    END AS IS_ACTIVE,

    CREATED_AT,
    UPDATED_AT

FROM CURATED.CUSTOMERS;