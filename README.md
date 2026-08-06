# RetailPulse

> A modern enterprise retail data platform built with Python, Snowflake, AWS, and Medallion Architecture.

![Python](https://img.shields.io/badge/Python-3.14-blue)
![Snowflake](https://img.shields.io/badge/Snowflake-Data%20Platform-29B5E8)
![AWS](https://img.shields.io/badge/AWS-S3-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

# Overview

RetailPulse is an end-to-end data engineering project that demonstrates how customer data flows from generation to analytics using modern cloud technologies.

The project follows industry best practices, including:

- Medallion Architecture
- Synthetic data generation
- AWS S3 data lake
- Snowflake data warehouse
- Layered SQL transformations
- Validation at every stage
- GitHub Flow development workflow

Rather than focusing on isolated SQL scripts, RetailPulse models how production-grade data platforms are designed and implemented.

---

# Current Features

## Python

- Customer data generator
- CSV export
- Parquet export
- Command Line Interface (CLI)
- Unit tests

## AWS

- Amazon S3 landing zone
- Storage integration
- Secure IAM configuration

## Snowflake

- Database provisioning
- Warehouses
- Roles & Grants
- External Stage
- File Formats
- COPY INTO pipeline

## Medallion Architecture

- RAW Layer
- CURATED Layer
- CORE Layer
- ANALYTICS Layer

---

# Customer Data Pipeline

```
                RetailPulse CLI
                       │
                       ▼
              customers.parquet
                       │
                       ▼
                  Amazon S3
                       │
                       ▼
           Snowflake External Stage
                       │
                       ▼
               COPY INTO RAW.CUSTOMERS
                       │
                       ▼
              CURATED.CUSTOMERS
                       │
                       ▼
             CORE.DIM_CUSTOMERS
                       │
                       ▼
          ANALYTICS.VW_CUSTOMERS
```

---

# Medallion Architecture

## RAW

Stores the source data exactly as received.

Responsibilities:

- Landing zone
- No transformations
- Source of truth

---

## CURATED

Standardizes and cleans the data.

Responsibilities:

- Trim whitespace
- Normalize casing
- Standardize values
- Data quality validation

---

## CORE

Business-ready dimensional model.

Responsibilities:

- Surrogate keys
- Business attributes
- Business transformations
- Dimensional modeling

---

## ANALYTICS

Reporting and consumption layer.

Responsibilities:

- Analytics views
- Derived metrics
- Reporting-friendly schema

---

# Technology Stack

| Category | Technology |
|-----------|------------|
| Language | Python 3.14 |
| Data Warehouse | Snowflake |
| Cloud Storage | Amazon S3 |
| Data Format | Parquet / CSV |
| Data Generation | Faker |
| Data Processing | Pandas, PyArrow |
| CLI | Typer |
| Testing | Pytest |
| Package Manager | uv |
| Version Control | Git & GitHub |

---

# Repository Structure

```
enterprise-retail-data-platform/

├── retailpulse/          # Python application
├── snowflake/            # Snowflake SQL scripts
│   ├── setup/
│   ├── raw/
│   ├── curated/
│   ├── core/
│   └── analytics/
│
├── aws/                  # AWS configuration
├── docs/                 # Documentation
├── tests/                # Unit & integration tests
├── data/                 # Generated datasets
└── airflow/              # Future orchestration
```

---

# Getting Started

## 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/enterprise-retail-data-platform.git

cd enterprise-retail-data-platform
```

---

## 2. Install Dependencies

```bash
uv sync
```

---

## 3. Generate Sample Customer Data

Generate 1,000 customer records in Parquet format.

```bash
uv run retailpulse generate customers \
    --count 1000 \
    --output-format parquet
```

Generated output:

```
data/bronze/customers/customers.parquet
```

---

## 4. Upload the Parquet File to Amazon S3

Upload the generated dataset to the RetailPulse S3 landing zone.

```bash
aws s3 cp \
data/bronze/customers/customers.parquet \
s3://retailpulse-dev/bronze/customers/
```

Verify the upload:

```bash
aws s3 ls s3://retailpulse-dev/bronze/customers/
```

---

## 5. Execute Snowflake Infrastructure Scripts

Run the scripts in order:

```
snowflake/setup/
```

```
01_database.sql
02_schemas.sql
03_warehouses.sql
04_roles.sql
05_database_grants.sql
06_storage_integration.sql
07_file_formats.sql
08_external_stage.sql
```

---

## 6. Load the RAW Layer

Execute:

```
snowflake/raw/
```

```
customers.sql
load_customers.sql
validate_customers.sql
```

---

## 7. Build the CURATED Layer

Execute:

```
snowflake/curated/
```

```
customers.sql
validate_customers.sql
```

---

## 8. Build the CORE Layer

Execute:

```
snowflake/core/
```

```
dim_customers.sql
load_dim_customers.sql
validate_dim_customers.sql
```

---

## 9. Build the ANALYTICS Layer

Execute:

```
snowflake/analytics/
```

```
vw_customers.sql
validate_vw_customers.sql
```

---

## 10. Query the Analytics View

```sql
SELECT *
FROM ANALYTICS.VW_CUSTOMERS
LIMIT 20;
```

---

# Documentation

Additional documentation is available in the `docs/` directory.

- Architecture
- Setup Guide
- Demo Guide
- Architecture Decisions
- Roadmap

---

# Project Roadmap

## Completed

- Customer Generator
- CSV Writer
- Parquet Writer
- AWS S3 Integration
- Snowflake Foundation
- External Stage
- Customer Medallion Architecture

## Planned

- Product Domain
- Store Domain
- Order Domain
- Sales Fact Table
- Streams & Tasks
- Dynamic Tables
- dbt
- Apache Airflow
- CI/CD Pipeline
- Data Quality Framework

---

# Contributing

Contributions, ideas, and feedback are welcome.

Please open an issue before submitting significant changes.

---

# License

This project is licensed under the MIT License.

---

# Author

**Anup Singh**

Snowflake Data Engineer | Python | AWS | Data Engineering