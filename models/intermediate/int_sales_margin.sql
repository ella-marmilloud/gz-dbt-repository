with sales_margin AS (

select * from 
{{ref("stg_raw__sales")}}
LEFT JOIN
{{ref("stg_raw__product")}}
USING (products_id)
)

select *,
    ROUND(SAFE_MULTIPLY(quantity, purchase_price), 2) AS purchase_cost,
    ROUND(SAFE_SUBTRACT(revenue, SAFE_MULTIPLY(quantity, purchase_price)), 2) AS margin
from sales_margin