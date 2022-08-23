WITH 
orders AS (
    SELECT * 
    FROM {{ ref('raw_orders') }}
)

SELECT 
    orderid,
    sum(ordersellingprice) AS total_sp
FROM orders
GROUP BY orderid
HAVING total_sp < 0 