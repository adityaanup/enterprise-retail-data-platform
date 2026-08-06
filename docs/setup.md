# Local Development Setup

This guide walks through setting up the RetailPulse project from scratch, including Python, AWS, and Snowflake.

---

# Prerequisites

Before starting, ensure the following software is installed.

| Software | Version |
|-----------|----------|
| Python | 3.14+ |
| uv | Latest |
| Git | Latest |
| AWS CLI | v2 |
| Snowflake Account | Enterprise Edition (or Trial) |

---

# Clone the Repository

```bash
git clone https://github.com/<your-github-username>/enterprise-retail-data-platform.git

cd enterprise-retail-data-platform
```

---

# Install Dependencies

RetailPulse uses **uv** for dependency management.

Install all project dependencies.

```bash
uv sync
```

Verify the installation.

```bash
uv run python --version
```

---

# Environment Configuration

Copy the example environment file.

```bash
cp .env.example .env
```

Update the values as required.

Example:

```text
AWS_REGION=us-west-2

AWS_BUCKET_NAME=retailpulse-dev

SNOWFLAKE_ACCOUNT=<account>

SNOWFLAKE_USER=<user>

SNOWFLAKE_PASSWORD=<password>

SNOWFLAKE_DATABASE=RETAILPULSE_DEV

SNOWFLAKE_WAREHOUSE=COMPUTE_WH

SNOWFLAKE_ROLE=ACCOUNTADMIN
```

> **Note**
>
> Never commit `.env` to source control.

---

# Generate Sample Customer Data

Generate 1,000 customer records.

```bash
uv run retailpulse generate customers \
    --count 1000 \
    --output-format parquet
```

Generated files:

```text
data/
└── bronze/
    └── customers/
        ├── customers.csv
        └── customers.parquet
```

---

# Upload Data to Amazon S3

Upload the generated Parquet file.

```bash
aws s3 cp \
data/bronze/customers/customers.parquet \
s3://retailpulse-dev/bronze/customers/
```

Verify the upload.

```bash
aws s3 ls s3://retailpulse-dev/bronze/customers/
```

Expected output:

```text
customers.parquet
```

---

# Configure Snowflake

Execute the setup scripts in the following order.

## Infrastructure

```
snowflake/setup/

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

# Build the RAW Layer

Execute:

```
snowflake/raw/

customers.sql

load_customers.sql

validate_customers.sql
```

This creates:

- RAW.CUSTOMERS

and loads customer data from Amazon S3.

---

# Build the CURATED Layer

Execute:

```
snowflake/curated/

customers.sql

validate_customers.sql
```

This standardizes and validates customer data.

---

# Build the CORE Layer

Execute:

```
snowflake/core/

dim_customers.sql

load_dim_customers.sql

validate_dim_customers.sql
```

This creates the customer dimension.

---

# Build the ANALYTICS Layer

Execute:

```
snowflake/analytics/

vw_customers.sql

validate_vw_customers.sql
```

This creates the reporting view.

---

# Verify the Deployment

Run:

```sql
SELECT COUNT(*)
FROM ANALYTICS.VW_CUSTOMERS;
```

View sample data.

```sql
SELECT *
FROM ANALYTICS.VW_CUSTOMERS
LIMIT 20;
```

---

# Execute Unit Tests

Run all unit tests.

```bash
uv run pytest
```

Run a specific test.

```bash
uv run pytest tests/unit/test_customer_generator.py
```

---

# Project Structure

```
enterprise-retail-data-platform/

├── retailpulse/
├── snowflake/
├── aws/
├── docs/
├── tests/
└── data/
```

---

# Troubleshooting

## AWS CLI

Verify installation.

```bash
aws --version
```

Verify S3 access.

```bash
aws s3 ls
```

---

## Snowflake

Verify database.

```sql
SHOW DATABASES;
```

Verify schemas.

```sql
SHOW SCHEMAS;
```

Verify stage.

```sql
LIST @RP_EXT_STAGE/bronze/customers;
```

---

## Data Validation

Verify the RAW layer.

```sql
SELECT COUNT(*)
FROM RAW.CUSTOMERS;
```

Verify the CURATED layer.

```sql
SELECT COUNT(*)
FROM CURATED.CUSTOMERS;
```

Verify the CORE layer.

```sql
SELECT COUNT(*)
FROM CORE.DIM_CUSTOMERS;
```

Verify the ANALYTICS layer.

```sql
SELECT COUNT(*)
FROM ANALYTICS.VW_CUSTOMERS;
```

---

# Next Steps

After successfully completing the setup:

- Generate larger customer datasets.
- Explore the Customer Medallion Architecture.
- Review the project documentation.
- Build additional retail domains such as Products, Orders, and Stores.