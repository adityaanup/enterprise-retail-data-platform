from data_generator.generators.customer_generator import CustomerGenerator


def test_generate_customer() -> None:
    generator = CustomerGenerator()

    customer = generator.generate(1)

    assert customer.customer_id == "CUST-2026-00000001"
    assert customer.country == "USA"
    assert customer.first_name
    assert customer.email
