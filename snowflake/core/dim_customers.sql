-- ============================================================================
-- Script      : dim_customers.sql
-- Layer       : CORE
-- Purpose     : Create Customer Dimension
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA CORE;

CREATE OR REPLACE TABLE DIM_CUSTOMERS (

    CUSTOMER_KEY        NUMBER IDENTITY(1,1),

    CUSTOMER_ID         STRING,

    FIRST_NAME          STRING,
    LAST_NAME           STRING,
    FULL_NAME           STRING,

    EMAIL               STRING,
    PHONE               STRING,

    DATE_OF_BIRTH       DATE,
    GENDER              STRING,

    ADDRESS_LINE1       STRING,
    ADDRESS_LINE2       STRING,

    CITY                STRING,
    STATE               STRING,
    POSTAL_CODE         STRING,
    COUNTRY             STRING,

    LOYALTY_TIER        STRING,
    MARKETING_OPT_IN    BOOLEAN,

    REGISTRATION_DATE   DATE,

    STATUS              STRING,
    IS_ACTIVE           BOOLEAN,

    CREATED_AT          TIMESTAMP_NTZ,
    UPDATED_AT          TIMESTAMP_NTZ

);