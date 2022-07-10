SELECT
  id	as order_id,
  employee_id,
  customer_id,
  order_date,
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
