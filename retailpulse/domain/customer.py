"""Customer domain model."""

from __future__ import annotations

from dataclasses import dataclass
from datetime import date, datetime


@dataclass(slots=True, frozen=True)
class Customer:
    """Represents a customer in the RetailNova platform."""

    customer_id: str
    first_name: str
    last_name: str
    email: str
    phone: str

    date_of_birth: date
    gender: str

    address_line1: str
    address_line2: str | None
    city: str
    state: str
    postal_code: str
    country: str

    loyalty_tier: str
    marketing_opt_in: bool

    registration_date: date
    status: str

    created_at: datetime
    updated_at: datetime
