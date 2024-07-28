{{ config(
    materialized='table'
) }}

select * from {{ref('int_dim_customers')}}