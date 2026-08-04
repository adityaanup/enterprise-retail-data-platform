-- ============================================================================
-- Script      : 02_schemas.sql
-- Purpose     : Create RetailPulse schemas
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;

CREATE SCHEMA IF NOT EXISTS RAW
    COMMENT = 'Raw data loaded from source systems';

CREATE SCHEMA IF NOT EXISTS STAGE
    COMMENT = 'Standardized and validated data';

CREATE SCHEMA IF NOT EXISTS CORE
    COMMENT = 'Business-ready data models';

CREATE SCHEMA IF NOT EXISTS ANALYTICS
    COMMENT = 'Reporting and analytics objects';

CREATE SCHEMA IF NOT EXISTS UTIL
    COMMENT = 'Utility objects, procedures, metadata and helper tables';