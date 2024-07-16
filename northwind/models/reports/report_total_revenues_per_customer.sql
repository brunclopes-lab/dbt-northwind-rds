-- models/reporting/view_total_revenues_per_customer.sql

{{ config(
    materialized='table'
) }}

select 
    customers.company_name, 
    sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) as total
from 
    {{ ref('int_customers') }} as customers
inner join 
    {{ ref('int_orders') }} as orders on customers.customer_id = orders.customer_id
group by 
    customers.company_name
order by 
    total desc