"""Application logging configuration."""

from __future__ import annotations

import logging


def configure_logging() -> None:
    """Configure application logging."""

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s | %(levelname)-8s | %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )
