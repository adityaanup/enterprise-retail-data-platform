-- ============================================================================
-- Script      : customers.sql
-- Layer       : RAW
-- Purpose     : Create RAW.CUSTOMERS table
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE CUSTOMERS (

    CUSTOMER_ID         STRING NOT NULL,

    FIRST_NAME          STRING,
    LAST_NAME           STRING,

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

    CREATED_AT          TIMESTAMP_NTZ,
    UPDATED_AT          TIMESTAMP_NTZ

);