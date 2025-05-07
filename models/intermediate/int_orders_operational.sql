with op_cost as (

select *
from {{ref("int_orders_margin")}}
LEFT JOIN {{ref("stg_raw__ship")}}
USING (orders_id)

)

select *,
    ROUND(SAFE_SUBTRACT((margin + shipping_fee) - logcost, ship_cost), 2) AS operational_margin
from op_cost
ORDER BY orders_id DESC