from pathlib import Path

from retailpulse.config import ConfigLoader


def test_load_configuration() -> None:
    loader = ConfigLoader(Path("configs/data_generator.yaml"))

    config = loader.load()

    assert config.project.name == "enterprise-retail-data-platform"
    assert config.entities.customers == 1000


def test_configuration_is_cached() -> None:
    loader = ConfigLoader(Path("configs/data_generator.yaml"))

    config1 = loader.load()
    config2 = loader.load()

    assert config1 is config2
