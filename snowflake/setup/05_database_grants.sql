-- ============================================================================
-- Script      : 05_database_grants.sql
-- Purpose     : Grant database privileges to RetailPulse roles
-- Author      : Anup Singh
-- ============================================================================

USE ROLE SECURITYADMIN;

-- ============================================================================
-- Database Usage
-- ============================================================================

GRANT USAGE ON DATABASE RETAILPULSE_DEV TO ROLE RP_ETL;
GRANT USAGE ON DATABASE RETAILPULSE_DEV TO ROLE RP_DBT;
GRANT USAGE ON DATABASE RETAILPULSE_DEV TO ROLE RP_AIRFLOW;
GRANT USAGE ON DATABASE RETAILPULSE_DEV TO ROLE RP_ANALYST;
GRANT USAGE ON DATABASE RETAILPULSE_DEV TO ROLE RP_READONLY;

-- ============================================================================
-- Administrative Control
-- ============================================================================

GRANT ALL PRIVILEGES ON DATABASE RETAILPULSE_DEV TO ROLE RP_ADMIN;