select
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(AVG(revenue), 1) AS average_basket,
    ROUND(SUM(margin),2) AS margin,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS shipping_fees,
    ROUND(SUM(logcost), 2) AS logcost,
    ROUND(SUM(ship_cost),2) AS ship_cost,
    ROUND(SUM(quantity), 2) AS quantity,
from {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC