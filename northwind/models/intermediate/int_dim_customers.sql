{{ config(
	alias='dim_customers',
    materialized='table'
) }}


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
	{{ref('staging_dim_customers')}}