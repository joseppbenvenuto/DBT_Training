-- Config to set as table and not view
{{
    config(
        materialized='table'
    )
}}

SELECT * 
-- FROM RAW.GLOBAL_MART.CUSTOMER
FROM {{ source('global_mart', 'customer') }}