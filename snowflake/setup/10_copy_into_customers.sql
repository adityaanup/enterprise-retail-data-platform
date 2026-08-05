-- ============================================================================
-- Script      : 10_copy_into_customers.sql
-- Purpose     : Load customer data into RAW.CUSTOMERS
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA RAW;

COPY INTO CUSTOMERS
FROM @RP_EXT_STAGE/bronze/customers/
FILE_FORMAT = (
    FORMAT_NAME = RETAILPULSE_DEV.UTIL.RP_FF_PARQUET
)
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;