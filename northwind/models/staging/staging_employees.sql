{{ config(
    materialized='table',
	unique_key='employee_id'
) }}

with source as (
	select 
	* 
	from {{source('northwind_prod', 'employees')}}
)

select
	employee_id,
	last_name,
	first_name,
	title,
	title_of_courtesy,
	birth_date,
	hire_date,
	address,
	city,
	region,
	postal_code,
	country,
	home_phone,
	"extension" as extension,
	photo,
	notes,
	reports_to,
	photo_path
from
	source