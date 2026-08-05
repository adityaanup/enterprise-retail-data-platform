-- ============================================================================
-- Script      : 08_external_stage.sql
-- Purpose     : Create RetailPulse external stages
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE RETAILPULSE_DEV;
USE SCHEMA RAW;

CREATE STAGE IF NOT EXISTS RP_EXT_STAGE
    URL = 's3://retailpulse-dev/'
    STORAGE_INTEGRATION = RP_S3_INT
    COMMENT = 'RetailPulse external S3 stage';