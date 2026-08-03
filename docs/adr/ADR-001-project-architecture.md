# ADR-001

## Title

Project Architecture

## Status

Accepted

## Context

The project will grow to include data generation, ingestion, PySpark,
Snowflake, dbt, Airflow, CI/CD, monitoring, and dashboards.

A scalable architecture is required.

## Decision

Adopt a modular package structure with clear separation of concerns.

## Consequences

Positive

- Easier testing
- Better maintainability
- Reusable components
- Clear ownership

Negative

- Slightly more boilerplate