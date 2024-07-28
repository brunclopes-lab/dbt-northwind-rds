{{ config(
	alias='fact_orders',
    materialized='table'
) }}

with orders as (
	select 
	*
	from {{source('northwind_prod', 'orders')}}
),
order_details as (
	select 
	* 
	from {{source('northwind_prod', 'order_details')}}
	)

select
	o.order_id,
	o.customer_id,
	o.employee_id,
	o.order_date,
	o.required_date,
	o.shipped_date,
	o.ship_via,
	o.freight,
	o.ship_name,
	o.ship_address,
	o.ship_city,
	o.ship_region,
	o.ship_postal_code,
	o.ship_country,
	od.product_id,
	od.unit_price,
	od.quantity,
	od.discount
from
	orders o 
left join order_details od 
on o.order_id = od.order_id