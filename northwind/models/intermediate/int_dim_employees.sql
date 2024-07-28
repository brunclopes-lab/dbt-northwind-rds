{{ config(
	alias='dim_employees',
    materialized='table'
) }}

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
	extension,
	photo,
	notes,
	reports_to
from
	{{ref('staging_dim_employees')}}