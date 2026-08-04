from pathlib import Path

import typer

from retailpulse.generators.customer_generator import CustomerGenerator
from retailpulse.writers.csv_writer import CsvWriter
from retailpulse.writers.parquet_writer import ParquetWriter

app = typer.Typer()


@app.command("customers")
def customers(
    count: int = 1000,
    output_format: str = "parquet",
):
    generator = CustomerGenerator()
    records = generator.generate_many(count)

    output_dir = Path("data/bronze/customers")
    output_dir.mkdir(parents=True, exist_ok=True)

    if output_format == "csv":
        CsvWriter.write(records, output_dir / "customers.csv")
    else:
        ParquetWriter.write(records, output_dir / "customers.parquet")
