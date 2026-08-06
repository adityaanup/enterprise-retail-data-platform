-- ============================================================================
-- Script      : customers.sql
-- Layer       : CURATED
-- Purpose     : Clean and standardize customer data from RAW layer
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA CURATED;

CREATE OR REPLACE TABLE CUSTOMERS AS

SELECT

    CUSTOMER_ID,

    UPPER(TRIM(FIRST_NAME))                AS FIRST_NAME,
    UPPER(TRIM(LAST_NAME))                 AS LAST_NAME,

    LOWER(TRIM(EMAIL))                     AS EMAIL,

    TRIM(PHONE)                            AS PHONE,

    DATE_OF_BIRTH,

    UPPER(TRIM(GENDER))                    AS GENDER,

    TRIM(ADDRESS_LINE1)                    AS ADDRESS_LINE1,
    TRIM(ADDRESS_LINE2)                    AS ADDRESS_LINE2,

    UPPER(TRIM(CITY))                      AS CITY,
    UPPER(TRIM(STATE))                     AS STATE,
    UPPER(TRIM(COUNTRY))                   AS COUNTRY,

    TRIM(POSTAL_CODE)                      AS POSTAL_CODE,

    UPPER(TRIM(LOYALTY_TIER))              AS LOYALTY_TIER,

    MARKETING_OPT_IN,

    REGISTRATION_DATE,

    UPPER(TRIM(STATUS))                    AS STATUS,

    CREATED_AT,
    UPDATED_AT

FROM RAW.CUSTOMERS;