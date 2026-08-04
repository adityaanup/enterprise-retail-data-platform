"""Custom exceptions for the configuration system."""


class ConfigurationError(Exception):
    """Base exception for configuration errors."""


class ConfigurationFileNotFoundError(ConfigurationError):
    """Raised when the configuration file cannot be found."""


class ConfigurationParseError(ConfigurationError):
    """Raised when the configuration file cannot be parsed."""


class ConfigurationValidationError(ConfigurationError):
    """Raised when the configuration is invalid."""
