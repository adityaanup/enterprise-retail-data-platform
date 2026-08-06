# RetailPulse Architecture

## Overview

RetailPulse is an end-to-end cloud-native data engineering platform that demonstrates how retail customer data is generated, ingested, transformed, and exposed for analytics using modern data engineering technologies.

The platform follows the **Medallion Architecture** pattern, separating data into distinct layers to improve data quality, maintainability, and scalability.

---

# High-Level Architecture

```
                        RetailPulse CLI
                               │
                               ▼
                    Generate Customer Data
                               │
                               ▼
                   customers.parquet / csv
                               │
                               ▼
                         Amazon S3 Bucket
                               │
                               ▼
                 Snowflake Storage Integration
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
                               │
                               ▼
                    Dashboards / BI Tools
```

---

# Platform Components

## Python Data Generator

RetailPulse includes a Python-based synthetic data generator that creates realistic retail customer datasets.

Current capabilities:

- Customer data generation
- CSV export
- Parquet export
- Command Line Interface (CLI)

Technologies:

- Python
- Faker
- Pandas
- PyArrow
- Typer

---

## Amazon S3

Amazon S3 acts as the landing zone for generated datasets.

Current bucket structure:

```
retailpulse-dev/

└── bronze/
    └── customers/
        └── customers.parquet
```

Responsibilities:

- Store generated datasets
- Decouple data generation from ingestion
- Provide scalable object storage

---

## Snowflake

Snowflake serves as the cloud data warehouse for RetailPulse.

Current implementation includes:

- Database
- Warehouses
- Roles
- Schemas
- Storage Integration
- External Stage
- File Formats
- COPY INTO pipeline

---

# Medallion Architecture

RetailPulse follows a four-layer Medallion Architecture.

```
RAW
   │
   ▼
CURATED
   │
   ▼
CORE
   │
   ▼
ANALYTICS
```

Each layer has a single responsibility.

---

## RAW Layer

Schema:

```
RAW
```

Objects:

```
CUSTOMERS
```

Purpose:

Store data exactly as received from the source system.

Characteristics:

- No transformations
- Immutable landing zone
- Source of truth
- Mirrors source schema

---

## CURATED Layer

Schema:

```
CURATED
```

Objects:

```
CUSTOMERS
```

Purpose:

Clean and standardize raw data.

Responsibilities:

- Trim whitespace
- Normalize casing
- Standardize values
- Preserve business meaning
- Prepare data for business modeling

---

## CORE Layer

Schema:

```
CORE
```

Objects:

```
DIM_CUSTOMERS
```

Purpose:

Create business-ready dimensional models.

Business transformations include:

- Customer surrogate key
- Full customer name
- Active customer flag

The CORE layer provides stable, reusable business entities for downstream analytics.

---

## ANALYTICS Layer

Schema:

```
ANALYTICS
```

Objects:

```
VW_CUSTOMERS
```

Purpose:

Expose business-friendly datasets for reporting.

Responsibilities:

- Reporting views
- Derived attributes
- Analytics-ready schema

Example:

Customer age is calculated dynamically within the analytics layer instead of being persisted.

---

# Data Flow

The current customer pipeline follows this sequence.

```
Python Generator
        │
        ▼
customers.parquet
        │
        ▼
Amazon S3
        │
        ▼
External Stage
        │
        ▼
RAW.CUSTOMERS
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

# Repository Organization

```
snowflake/

├── setup/
│
├── raw/
│
├── curated/
│
├── core/
│
└── analytics/
```

Each directory contains:

- Object creation scripts
- Data loading scripts (where applicable)
- Validation scripts

---

# Validation Strategy

Every Medallion layer contains validation scripts.

Validation includes:

- Row counts
- Duplicate business keys
- Null checks
- Data distribution
- Timestamp validation

This ensures data quality throughout the pipeline.

---

# Technology Stack

| Component | Technology |
|-----------|------------|
| Programming Language | Python 3.14 |
| Data Warehouse | Snowflake |
| Cloud Storage | Amazon S3 |
| File Format | Parquet |
| Data Processing | Pandas |
| Columnar Storage | PyArrow |
| Synthetic Data | Faker |
| CLI | Typer |
| Testing | Pytest |
| Package Manager | uv |
| Version Control | Git & GitHub |

---

# Current Scope

Implemented

- Customer data generation
- Amazon S3 landing zone
- Snowflake ingestion pipeline
- Medallion Architecture
- Customer dimension
- Analytics view
- Validation framework

---

# Future Enhancements

Planned additions include:

- Product domain
- Store domain
- Order domain
- Fact Sales model
- Snowflake Streams
- Snowflake Tasks
- Dynamic Tables
- dbt
- Apache Airflow
- CI/CD
- Data Quality Framework