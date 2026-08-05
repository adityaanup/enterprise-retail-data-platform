-- ============================================================================
-- Script      : 09_raw_customers.sql
-- Purpose     : Create RAW.CUSTOMERS table
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE CUSTOMERS (

    CUSTOMER_ID         STRING,

    FIRST_NAME         STRING,
    LAST_NAME          STRING,

    EMAIL              STRING,
    PHONE              STRING,

    DATE_OF_BIRTH      DATE,
    GENDER             STRING,

    ADDRESS_LINE1      STRING,
    ADDRESS_LINE2      STRING,

    CITY               STRING,
    STATE              STRING,
    COUNTRY            STRING,
    POSTAL_CODE        STRING,

    CREATED_AT         TIMESTAMP_NTZ,
    UPDATED_AT         TIMESTAMP_NTZ

);