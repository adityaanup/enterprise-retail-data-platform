-- ============================================================================
-- Script      : 06_storage_integration.sql
-- Purpose     : Create S3 storage integration
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

CREATE STORAGE INTEGRATION IF NOT EXISTS RP_S3_INT
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<AWS-ACCOUNT-ID>:role/RetailPulseSnowflakeRole'
    ENABLED = TRUE
    STORAGE_ALLOWED_LOCATIONS = (
        's3://retailpulse-dev/'
    )
    COMMENT = 'RetailPulse S3 Storage Integration';