from datetime import date, datetime

from retailpulse.domain.customer import Customer


def test_customer_creation() -> None:
    customer = Customer(
        customer_id="CUST000001",
        first_name="John",
        last_name="Doe",
        email="john@example.com",
        phone="+1-555-1234",
        date_of_birth=date(1990, 1, 1),
        gender="Male",
        address_line1="123 Main Street",
        city="Dallas",
        state="Texas",
        postal_code="75001",
        country="USA",
        loyalty_tier="Gold",
        marketing_opt_in=True,
        registration_date=date.today(),
        status="ACTIVE",
        created_at=datetime.now(),
        updated_at=datetime.now(),
    )

    assert customer.customer_id == "CUST000001"
    assert customer.loyalty_tier == "Gold"
