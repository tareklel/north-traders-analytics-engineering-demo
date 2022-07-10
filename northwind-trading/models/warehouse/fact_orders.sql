{{
  config(
    partition_by={
      "field": "order_date",
      "data_type": "date"
    }
  )
}}

WITH
source
AS
(
  SELECT
    id	as order_id,
    employee_id,
    customer_id,
    CAST(order_date AS DATE) AS order_date,
    shipped_date,
    shipper_id,
    ship_name,
    ship_address,
    ship_city,
    ship_state_province,
    ship_zip_postal_code,
    ship_country_region,
    shipping_fee,
    taxes
  FROM
    {{ ref('stg_orders') }}
),
unique_source AS
(
  SELECT *, ROW_NUMBER() OVER(PARTITION BY order_id, employee_id, customer_id) as _row
  FROM source
)

SELECT
  * EXCEPT (_row)
FROM
 unique_source
WHERE _row = 1
