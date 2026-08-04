"""Unit tests for Parquet writer."""

from __future__ import annotations

from datetime import date, datetime

import pandas as pd

from retailpulse.domain.customer import Customer
from retailpulse.writers.parquet_writer import ParquetWriter


def create_customer() -> Customer:
    """Create a sample customer."""

    return Customer(
        customer_id="CUST-2026-00000001",
        first_name="John",
        last_name="Doe",
        email="john@example.com",
        phone="+1-555-1234",
        date_of_birth=date(1990, 1, 1),
        gender="Male",
        address_line1="123 Main Street",
        city="Dallas",
        state="Texas",
        postal_code="75001",
        country="USA",
        loyalty_tier="Gold",
        marketing_opt_in=True,
        registration_date=date(2020, 1, 1),
        status="ACTIVE",
        created_at=datetime.now(),
        updated_at=datetime.now(),
    )


def test_parquet_file_creation(tmp_path) -> None:
    """Verify Parquet file is created."""

    output_file = tmp_path / "customers.parquet"

    ParquetWriter.write([create_customer()], output_file)

    assert output_file.exists()


def test_parquet_contains_data(tmp_path) -> None:
    """Verify Parquet contains expected data."""

    output_file = tmp_path / "customers.parquet"

    ParquetWriter.write([create_customer()], output_file)

    dataframe = pd.read_parquet(output_file)

    assert len(dataframe) == 1
    assert dataframe.iloc[0]["customer_id"] == "CUST-2026-00000001"
    assert dataframe.iloc[0]["first_name"] == "John"


def test_parquet_empty_list(tmp_path) -> None:
    """Verify empty record list creates no file."""

    output_file = tmp_path / "customers.parquet"

    ParquetWriter.write([], output_file)

    assert not output_file.exists()
