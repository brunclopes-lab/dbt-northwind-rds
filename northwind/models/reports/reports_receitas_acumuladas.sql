{{ config(
    materialized='table'
) }}

with receitas_mensais as (
    select
        extract(year from orders.order_date) as ano,
        extract(month from orders.order_date) as mes,
        sum(orders.unit_price * orders.quantity * (1.0 - orders.discount)) as receita_mensal
    from
        {{ ref('int_fact_orders') }} as orders
    group by
        extract(year from orders.order_date),
        extract(month from orders.order_date)
),
receitas_acumuladas as (
    select
        ano,
        mes,
        receita_mensal,
        sum(receita_mensal) over (partition by ano order by mes) as receita_ytd
    from
        receitas_mensais
)
select
    ano,
    mes,
    receita_mensal,
    receita_mensal - lag(receita_mensal) over (partition by ano order by mes) as diferenca_mensal,
    receita_ytd,
    (receita_mensal - lag(receita_mensal) over (partition by ano order by mes)) / lag(receita_mensal) over (partition by ano order by mes) * 100 as percentual_mudanca_mensal
from
    receitas_acumuladas
order by
    ano, mes