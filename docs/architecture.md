# Enterprise Retail Data Platform Architecture

## Overview

This project demonstrates an end-to-end modern data platform built using industry-standard tools and practices.

The platform simulates a retail organization by generating synthetic business data, ingesting it into Snowflake, transforming it with dbt, orchestrating workflows with Airflow, and exposing curated data for analytics.

---

## High-Level Architecture

```text
                  RetailNova

        +---------------------------+
        | Python Data Generator     |
        +------------+--------------+
                     |
                     v
              Parquet Files
                     |
                     v
                AWS S3 (Bronze)
                     |
                     v
        Snowflake External Stage
                     |
                     v
              Landing / Raw Layer
                     |
                     v
                  dbt Models
                     |
        +------------+------------+
        |                         |
   Dimension Tables         Fact Tables
        |                         |
        +------------+------------+
                     |
                     v
                 Power BI
```

---

## Technology Stack

| Layer | Technology |
|--------|------------|
| Language | Python 3.14 |
| Package Manager | uv |
| Data Generation | Faker |
| File Formats | CSV, Parquet |
| Cloud Storage | AWS S3 |
| Data Warehouse | Snowflake |
| Transformation | dbt |
| Orchestration | Airflow |
| CI/CD | GitHub Actions |
| Testing | Pytest |
| Linting | Ruff |

---

## Project Structure

```text
enterprise-retail-data-platform/

configs/
data_generator/
snowflake/
dbt/
airflow/
tests/
docs/
```

---

## Architecture Principles

- Configuration-driven
- Infrastructure as Code
- Immutable configuration
- Modular design
- Reusable components
- Automated testing
- Git Flow
- CI/CD
