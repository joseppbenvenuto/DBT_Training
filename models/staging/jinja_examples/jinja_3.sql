{%- set category_list = ["Furniture","Office","Technology"] -%}

SELECT 
    orderid,
    {% for category in category_list %}
    sum(CASE WHEN category = '{{category}}' THEN orderprofit END) AS {{category}}_orderprofit
    {% if not loop.last %}, {% endif %} {% endfor %}
FROM {{ ref('stg_orders') }}
GROUP BY 1