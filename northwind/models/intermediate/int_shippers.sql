{{ config(
    materialized='table'
) }}

select
	shipper_id,
	company_name,
	phone
from
	{{ref('staging_shippers')}}