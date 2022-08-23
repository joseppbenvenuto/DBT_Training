{%- set category = "Furniture" -%}

SELECT 
    orderid,
    CASE WHEN category = '{{category}}' THEN orderprofit END AS {{category}}_orderprofit
FROM {{ ref('stg_orders') }}