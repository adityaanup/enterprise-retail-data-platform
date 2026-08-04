-- ============================================================================
-- Script      : 04_roles.sql
-- Purpose     : Create RetailPulse project roles
-- Author      : Anup Singh
-- ============================================================================

USE ROLE SECURITYADMIN;

-- ============================================================================
-- Project Administrator
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_ADMIN
    COMMENT = 'RetailPulse platform administrator';

-- ============================================================================
-- Data Ingestion
-- Used by:
--   - RetailPulse CLI
--   - Snowpipe
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_ETL
    COMMENT = 'RetailPulse data ingestion role';

-- ============================================================================
-- Data Transformation
-- Used by:
--   - dbt
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_DBT
    COMMENT = 'RetailPulse transformation role';

-- ============================================================================
-- Workflow Orchestration
-- Used by:
--   - Apache Airflow
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_AIRFLOW
    COMMENT = 'RetailPulse orchestration role';

-- ============================================================================
-- Analytics
-- Used by:
--   - Power BI
--   - Business Analysts
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_ANALYST
    COMMENT = 'RetailPulse analytics role';

-- ============================================================================
-- Read-only Access
-- ============================================================================

CREATE ROLE IF NOT EXISTS RP_READONLY
    COMMENT = 'RetailPulse read-only role';