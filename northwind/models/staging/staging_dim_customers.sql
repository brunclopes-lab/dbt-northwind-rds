{{ config(
	alias='dim_customers',
    materialized='table',
	unique_key='customer_id'
) }}

with source as (
	select 
	* 
	from {{source('northwind_prod', 'customers')}}
)

select
	customer_id,
	company_name,
	contact_name,
	contact_title,
	address,
	city,
	region,
	postal_code,
	country,
	phone,
	fax
from
	source