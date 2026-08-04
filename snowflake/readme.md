# Snowflake Infrastructure

This directory contains all Snowflake infrastructure as code.

## Goals

- No manual object creation
- Version controlled SQL
- Idempotent scripts
- Environment independent

## Execution Order

01_database.sql

02_schemas.sql

03_warehouses.sql

04_roles.sql

05_grants.sql

06_file_formats.sql

07_stages.sql

08_tables.sql

09_copy_into.sql

10_streams.sql

11_tasks.sql