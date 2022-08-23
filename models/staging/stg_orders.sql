-- SELECT *, ORDERSELLINGPRICE - ORDERCOSTPRICE AS ORDERPROFIT
-- FROM ANALYTICS.DBT_JBENVENUTO.RAW_ORDERS

-- Reference from the models table instead of SFDB
SELECT
-- From raw_orders
{{ dbt_utils.surrogate_key(['ord.ORDERID','cus.CUSTOMERID','prod.PRODUCTID']) }} AS sk_orders,
    ord.ORDERID,
    ord.ORDERDATE,
    ord.SHIPDATE,
    ord.SHIPMODE,
    ord.ORDERSELLINGPRICE - ORDERCOSTPRICE AS ORDERPROFIT,
    ord.ORDERCOSTPRICE,
    ord.ORDERSELLINGPRICE,
-- From raw_customers
    cus.CUSTOMERID,
    cus.CUSTOMERNAME,
    cus.SEGMENT,
    cus.COUNTRY,
-- From raw_product
    prod.PRODUCTID,
    prod.CATEGORY,
    prod.PRODUCTNAME,
    prod.SUBCATEGORY,
    {{ markup('ORDERSELLINGPRICE','ORDERCOSTPRICE') }} AS MARKUP
FROM {{ ref('raw_orders') }} as ord
LEFT JOIN  {{ ref('raw_customers') }} AS cus
ON ord.CUSTOMERID = cus.CUSTOMERID
LEFT JOIN {{ ref('raw_products') }} AS prod
ON ord.PRODUCTID = prod.PRODUCTID