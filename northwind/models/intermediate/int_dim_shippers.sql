{{ config(
	alias='dim_shippers',
    materialized='table'
) }}

select
	shipper_id,
	company_name,
	phone
from
	{{ref('staging_dim_shippers')}}