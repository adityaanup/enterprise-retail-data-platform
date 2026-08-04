"""CSV writer."""

from __future__ import annotations

import csv
from dataclasses import asdict
from pathlib import Path


class CsvWriter:
    """Writes dataclass objects to CSV."""

    @staticmethod
    def write(records: list[object], output_file: Path) -> None:
        """Write records to CSV."""

        if not records:
            return

        output_file.parent.mkdir(parents=True, exist_ok=True)

        with output_file.open(
            "w",
            newline="",
            encoding="utf-8",
        ) as csv_file:
            writer = csv.DictWriter(
                csv_file,
                fieldnames=asdict(records[0]).keys(),
            )

            writer.writeheader()

            for record in records:
                writer.writerow(asdict(record))
