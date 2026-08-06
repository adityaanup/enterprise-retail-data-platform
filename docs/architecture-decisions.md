# Architecture Decisions

This document captures the key architectural decisions made while designing and implementing the RetailPulse data platform.

The goal is to explain **why** each decision was made, the alternatives considered, and the expected benefits.

---

# ADR-001: Medallion Architecture

## Status

Accepted

## Decision

RetailPulse adopts the Medallion Architecture with four logical layers:

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

## Rationale

Separating data into layers improves:

- Data quality
- Maintainability
- Reusability
- Scalability
- Traceability

Each layer has a single responsibility.

| Layer | Responsibility |
|--------|----------------|
| RAW | Store source data |
| CURATED | Clean and standardize |
| CORE | Business modeling |
| ANALYTICS | Reporting and consumption |

## Alternatives Considered

- Single-layer warehouse
- Two-layer staging/reporting

## Consequences

Pros

- Clear separation of concerns
- Easier debugging
- Reusable transformations
- Production-ready architecture

Cons

- Additional SQL objects
- More scripts to maintain

---

# ADR-002: Python-Based Synthetic Data Generator

## Status

Accepted

## Decision

RetailPulse generates synthetic customer datasets using Python instead of relying on external sample data.

## Rationale

Synthetic data provides:

- Repeatable demonstrations
- Consistent testing
- Unlimited data generation
- No dependency on external APIs
- No sensitive production data

## Technologies

- Faker
- Dataclasses
- Pandas
- PyArrow

## Alternatives Considered

- Kaggle datasets
- Public retail datasets
- Database exports

## Consequences

Pros

- Fully reproducible
- Easily configurable
- Portfolio-friendly

Cons

- Requires ongoing maintenance as the domain model evolves

---

# ADR-003: Apache Parquet as the Primary File Format

## Status

Accepted

## Decision

RetailPulse uses Apache Parquet for data exchange between the Python generator and Snowflake.

## Rationale

Parquet offers:

- Columnar storage
- High compression
- Faster analytical reads
- Efficient Snowflake loading
- Native schema support

CSV is still generated for debugging and inspection purposes.

## Alternatives Considered

- CSV
- JSON
- Avro

## Consequences

Pros

- Smaller files
- Faster COPY INTO performance
- Better analytical workloads

Cons

- Not human-readable

---

# ADR-004: Amazon S3 as the Landing Zone

## Status

Accepted

## Decision

Generated datasets are uploaded to Amazon S3 before being loaded into Snowflake.

## Rationale

Using object storage decouples data generation from data ingestion and reflects common cloud data platform architectures.

Benefits include:

- Durable storage
- Scalable ingestion
- Decoupled processing
- Cloud-native design

## Alternatives Considered

- Local file system
- Direct Snowflake upload

## Consequences

Pros

- Production-aligned architecture
- Easy integration with Snowflake stages

Cons

- Additional infrastructure to manage

---

# ADR-005: Snowflake External Stage

## Status

Accepted

## Decision

RetailPulse loads data through a Snowflake External Stage backed by Amazon S3.

## Rationale

External stages provide:

- Secure access to cloud storage
- Reusable ingestion pipelines
- Separation between storage and compute

## Alternatives Considered

- PUT command
- Internal Snowflake stages

## Consequences

Pros

- Enterprise best practice
- Supports scalable ingestion

Cons

- Requires IAM role configuration

---

# ADR-006: Layer-Specific Validation

## Status

Accepted

## Decision

Every Medallion layer contains dedicated validation scripts.

Examples:

- Row count validation
- Duplicate detection
- Null checks
- Distribution checks
- Timestamp validation

## Rationale

Validation should occur at every stage rather than only after the final reporting layer.

## Benefits

- Faster issue detection
- Easier troubleshooting
- Higher data quality

---

# ADR-007: Dimensional Modeling

## Status

Accepted

## Decision

Business entities are modeled as dimensions in the CORE layer.

Example:

```
CORE.DIM_CUSTOMERS
```

Business attributes include:

- CUSTOMER_KEY
- FULL_NAME
- IS_ACTIVE

## Rationale

Dimensions provide stable business entities that can be reused by multiple analytical models.

## Alternatives Considered

- Direct reporting from CURATED

## Consequences

Pros

- Reusable business model
- Consistent analytics
- Easier star schema design

Cons

- Additional transformation step

---

# ADR-008: Derived Attributes in the Analytics Layer

## Status

Accepted

## Decision

Derived values that change over time are calculated in the ANALYTICS layer rather than stored in CORE.

Example:

```
AGE
```

is calculated dynamically from:

```
DATE_OF_BIRTH
```

## Rationale

Age changes every year and should not be persisted.

Calculating it dynamically ensures the value remains accurate without updating every customer record.

## Alternatives Considered

Persist AGE in the dimension table.

## Consequences

Pros

- Always accurate
- No maintenance required

Cons

- Slightly more computation during query execution

---

# ADR-009: SQL Organization

## Status

Accepted

## Decision

SQL scripts are organized by architectural layer.

```
snowflake/

setup/

raw/

curated/

core/

analytics/
```

Each layer contains:

- Object creation scripts
- Load scripts
- Validation scripts

## Rationale

Grouping scripts by responsibility improves maintainability and scalability as new domains are added.

---

# Future Decisions

Additional Architecture Decision Records (ADRs) will be created as RetailPulse evolves.

Planned topics include:

- Apache Airflow orchestration
- dbt transformations
- Snowflake Streams
- Snowflake Tasks
- Dynamic Tables
- CI/CD pipelines
- Data Quality Framework
- Infrastructure as Code
- Monitoring and Observability