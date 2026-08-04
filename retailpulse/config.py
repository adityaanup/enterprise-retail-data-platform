"""Configuration loader for the Enterprise Retail Data Platform."""

from __future__ import annotations

import logging
from dataclasses import dataclass
from pathlib import Path

import yaml

from retailpulse.exceptions import (
    ConfigurationFileNotFoundError,
    ConfigurationParseError,
    ConfigurationValidationError,
)

logger = logging.getLogger(__name__)


# ------------------------------------------------------------------
# Configuration Models
# ------------------------------------------------------------------


@dataclass(slots=True, frozen=True)
class ProjectConfig:
    """Project metadata."""

    name: str
    environment: str


@dataclass(slots=True, frozen=True)
class GenerationConfig:
    """Synthetic data generation settings."""

    random_seed: int
    output_format: str
    output_directory: str


@dataclass(slots=True, frozen=True)
class EntityConfig:
    """Number of records to generate."""

    customers: int
    products: int
    stores: int
    employees: int
    orders: int
    payments: int
    inventory: int


@dataclass(slots=True, frozen=True)
class AppConfig:
    """Root configuration."""

    project: ProjectConfig
    generation: GenerationConfig
    entities: EntityConfig


# ------------------------------------------------------------------
# Config Loader
# ------------------------------------------------------------------


class ConfigLoader:
    """Loads application configuration from YAML."""

    REQUIRED_SECTIONS = (
        "project",
        "generation",
        "entities",
    )

    def __init__(self, config_path: Path) -> None:
        self._config_path = config_path
        self._config: AppConfig | None = None

    @property
    def config_path(self) -> Path:
        """Return the configuration path."""
        return self._config_path

    def load(self) -> AppConfig:
        """Load configuration from disk or return cached config."""

        if self._config is not None:
            logger.info("Using cached configuration.")
            return self._config

        logger.info("Loading configuration from %s", self._config_path)

        raw = self._read_yaml()

        self._validate(raw)

        self._config = self._build_app_config(raw)

        logger.info("Configuration loaded successfully.")

        return self._config

    def reload(self) -> AppConfig:
        """Force configuration reload."""

        logger.info("Reloading configuration.")

        self._config = None

        return self.load()

    def _read_yaml(self) -> dict:
        """Read YAML configuration."""

        if not self._config_path.exists():
            raise ConfigurationFileNotFoundError(
                f"Configuration file not found: {self._config_path}"
            )

        try:
            with self._config_path.open("r", encoding="utf-8") as file:
                return yaml.safe_load(file) or {}

        except yaml.YAMLError as exc:
            raise ConfigurationParseError(str(exc)) from exc

    def _validate(self, config: dict) -> None:
        """Validate configuration."""

        for section in self.REQUIRED_SECTIONS:
            if section not in config:
                raise ConfigurationValidationError(
                    f"Missing required section '{section}'"
                )

    def _build_app_config(self, config: dict) -> AppConfig:
        """Convert dictionary into dataclasses."""

        return AppConfig(
            project=ProjectConfig(**config["project"]),
            generation=GenerationConfig(**config["generation"]),
            entities=EntityConfig(**config["entities"]),
        )
