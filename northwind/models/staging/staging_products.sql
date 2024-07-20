{{ config(
    materialized='table',
	unique_key='product_id'
) }}

with products as (
	select 
	* 
	from {{source('northwind_prod', 'products')}}
), 
categories as (
	select 
	* 
	from {{source('northwind_prod', 'categories')}}	
)

select
	p.product_id,
	p.product_name,
	p.supplier_id,
	p.category_id,
	p.quantity_per_unit,
	p.unit_price,
	p.units_in_stock,
	p.units_on_order,
	p.reorder_level,
	p.discontinued,
	c.category_name,
	c.description as category_description
from
	products p 
left join categories c 
on p.category_id = c.category_id