{{ config(
    materialized='table'
) }}

select 
    customers.company_name, 
    sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) as total,
    ntile(5) over (order by sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) desc) as group_number
from 
    {{ ref('int_customers') }} as customers
inner join 
    {{ ref('int_orders') }} as orders on customers.customer_id = orders.customer_id
group by 
    customers.company_name
order by 
    total desc