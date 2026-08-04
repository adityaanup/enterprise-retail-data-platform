# Development Setup

## Prerequisites

- Python 3.14+
- Git
- uv
- Snowflake Account
- AWS Account

---

## Clone Repository

```bash
git clone <repository-url>
cd enterprise-retail-data-platform
```

## Create Virtual Environment

```bash
uv venv
source .venv/bin/activate
```

## Install Dependencies

```bash
uv sync
```

## Run Tests

```bash
uv run pytest
```

## Lint

```bash
uv run ruff check .
uv run ruff format .
```

## Generate Sample Data

```bash
uv run python -m data_generator --help
```

---

## Git Workflow

- Create feature branch from `develop`
- Open Pull Request
- Squash Merge into `develop`
- Merge `develop` into `main` for releases