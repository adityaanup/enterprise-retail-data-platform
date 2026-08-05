-- ============================================================================
-- Script      : 07_file_formats.sql
-- Purpose     : Create RetailPulse file formats
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA UTIL;

CREATE FILE FORMAT IF NOT EXISTS RP_FF_CSV
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '');

CREATE FILE FORMAT IF NOT EXISTS RP_FF_PARQUET
    TYPE = PARQUET
    USE_LOGICAL_TYPE = TRUE; -- Required to correctly interpret Parquet logical timestamp types