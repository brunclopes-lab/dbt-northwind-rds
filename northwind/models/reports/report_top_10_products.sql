{{ config(
    materialized='table'
) }}

select
    products.product_name, 
    sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) as sales
from 
    {{ ref('int_dim_products') }} as products
inner join 
    {{ ref('int_fact_orders') }} as orders on orders.product_id = products.product_id
group by 
    products.product_name
order by 
    sales desc
limit 10