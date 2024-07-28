{{ config(
	alias='dim_shippers',
    materialized='table',
	unique_key='shipper_id'
) }}

with source as (
	select 
	* 
	from {{source('northwind_prod', 'shippers')}}
)
select
	shipper_id,
	company_name,
	phone
from
	source