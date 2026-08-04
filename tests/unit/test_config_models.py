"""Unit tests for configuration models."""

from data_generator.config import (
    AppConfig,
    EntityConfig,
    GenerationConfig,
    ProjectConfig,
)


def test_app_config_creation() -> None:
    project = ProjectConfig(
        name="enterprise-retail-data-platform",
        environment="development",
    )

    generation = GenerationConfig(
        random_seed=42,
        output_format="csv",
        output_directory="data_generator/output",
    )

    entities = EntityConfig(
        customers=1000,
        products=500,
        stores=25,
        employees=200,
        orders=10000,
        payments=10000,
        inventory=5000,
    )

    config = AppConfig(
        project=project,
        generation=generation,
        entities=entities,
    )

    assert config.project.name == "enterprise-retail-data-platform"
    assert config.entities.orders == 10000
