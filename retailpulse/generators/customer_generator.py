"""Customer generator."""

from __future__ import annotations

from datetime import datetime
from random import Random

from faker import Faker

from retailpulse.domain.customer import Customer


class CustomerGenerator:
    """Generates realistic customer records."""

    LOYALTY_TIERS = ["Bronze", "Silver", "Gold", "Platinum"]
    STATUSES = ["ACTIVE", "INACTIVE"]

    def __init__(self, seed: int = 42) -> None:
        self.fake = Faker()
        self.fake.seed_instance(seed)
        self.random = Random(seed)

    def generate(self, customer_number: int) -> Customer:
        """Generate a single customer."""

        first_name = self.fake.first_name()
        last_name = self.fake.last_name()

        return Customer(
            customer_id=f"CUST-2026-{customer_number:08d}",
            first_name=first_name,
            last_name=last_name,
            email=self.fake.email(),
            phone=self.fake.phone_number(),
            date_of_birth=self.fake.date_of_birth(
                minimum_age=18,
                maximum_age=80,
            ),
            gender=self.random.choice(["Male", "Female"]),
            address_line1=self.fake.street_address(),
            city=self.fake.city(),
            state=self.fake.state(),
            postal_code=self.fake.postcode(),
            country="USA",
            loyalty_tier=self.random.choice(self.LOYALTY_TIERS),
            marketing_opt_in=self.random.choice([True, False]),
            registration_date=self.fake.date_between(
                start_date="-10y",
                end_date="today",
            ),
            status=self.random.choice(self.STATUSES),
            created_at=datetime.now(),
            updated_at=datetime.now(),
        )

    def generate_many(
        self,
        count: int,
    ) -> list[Customer]:
        """Generate multiple customers."""

        return [self.generate(i) for i in range(1, count + 1)]
