-- ============================================================================
-- Script      : 01_database.sql
-- Purpose     : Create RetailPulse databases
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

CREATE DATABASE IF NOT EXISTS RETAILPULSE_DEV
    COMMENT = 'Development environment for RetailPulse';

CREATE DATABASE IF NOT EXISTS RETAILPULSE_TEST
    COMMENT = 'Testing environment for RetailPulse';

CREATE DATABASE IF NOT EXISTS RETAILPULSE_PROD
    COMMENT = 'Production environment for RetailPulse';