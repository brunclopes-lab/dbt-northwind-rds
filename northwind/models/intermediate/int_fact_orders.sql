{{ config(
	alias='fact_orders',
    materialized='table'
) }}

select
	order_id,
	customer_id,
	employee_id,
	order_date,
	required_date,
	shipped_date,
	ship_via,
	freight,
	ship_name,
	ship_address,
	ship_city,
	ship_region,
	ship_postal_code,
	ship_country,
	product_id,
	unit_price,
	quantity,
	discount
from
	{{ref('staging_fact_orders')}}