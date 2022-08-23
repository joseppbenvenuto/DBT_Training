{%- set tabletype = "orders" -%}

select 
orderid,
'{{tabletype}}' AS tablesource
FROM {{ ref('stg_orders') }}