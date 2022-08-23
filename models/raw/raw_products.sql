-- Config to set as table and not view
{{
    config(
        materialized='table'
    )
}}

SELECT * 
-- FROM RAW.GLOBAL_MART.PRODUCT
FROM {{ source('global_mart', 'product') }}