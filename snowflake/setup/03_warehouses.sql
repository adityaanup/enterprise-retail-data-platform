-- ============================================================================
-- Script      : 03_warehouses.sql
-- Purpose     : Create RetailPulse virtual warehouses
-- Author      : Anup Singh
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- ============================================================================
-- Loading Warehouse
-- Used for:
--   - COPY INTO
--   - Snowpipe
--   - Initial data ingestion
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS RP_WH_LOADING_XS
    WAREHOUSE_SIZE = 'XSMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'RetailPulse data loading warehouse';


-- ============================================================================
-- Transformation Warehouse
-- Used for:
--   - dbt
--   - Streams
--   - Tasks
--   - MERGE operations
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS RP_WH_TRANSFORM_SM
    WAREHOUSE_SIZE = 'SMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'RetailPulse transformation warehouse';


-- ============================================================================
-- Analytics Warehouse
-- Used for:
--   - Power BI
--   - Ad hoc SQL
--   - Reporting
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS RP_WH_ANALYTICS_SM
    WAREHOUSE_SIZE = 'SMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'RetailPulse analytics warehouse';
