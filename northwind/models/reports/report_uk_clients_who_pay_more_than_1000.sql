{{ config(
    materialized='table'
) }}

select 
    customers.contact_name, 
    sum(orders.unit_price * orders.quantity * (1.0 - orders.discount) * 100) / 100 as payments
from 
    {{ ref('int_dim_customers') }} as customers
inner join 
    {{ ref('int_fact_orders') }} as orders on orders.customer_id = customers.customer_id
where 
    lower(customers.country) = 'uk'
group by 
    customers.contact_name
having 
    sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) > 1000