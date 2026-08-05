"""Parquet writer."""

from __future__ import annotations

from dataclasses import asdict
from pathlib import Path

import pandas as pd


class ParquetWriter:
    """Writes dataclass objects to Parquet."""

    @staticmethod
    def write(records: list[object], output_file: Path) -> None:
        """Write records to Parquet."""

        if not records:
            return

        output_file.parent.mkdir(
            parents=True,
            exist_ok=True,
        )

        dataframe = pd.DataFrame([asdict(record) for record in records])
        print(dataframe.dtypes)
        print(dataframe[["created_at", "updated_at"]].head())

        dataframe.to_parquet(
            output_file,
            index=False,
        )
