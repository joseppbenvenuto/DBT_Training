-- Config to set as table and not view
{{
    config(
        materialized='table'
    )
}}

SELECT * 
-- FROM RAW.GLOBAL_MART.ORDERS
FROM {{ source('global_mart', 'orders') }}