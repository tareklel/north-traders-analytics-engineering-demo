SELECT
  o.order_id,
  o.order_date,
  o.shipped_date,
  o.shipper_id,
  o.ship_name,
  o.ship_address,
  o.ship_city,
  o.ship_state_province,
  o.ship_zip_postal_code,
  o.ship_country_region,
  o.shipping_fee,
  o.taxes,
  c.company as customer_company,
  c.last_name as customer_last_name,
  c.first_name as customer_first_name,
  c.email_address as customer_email_address,
  c.job_title as customer_job_title,
  c.business_phone as customer_business_phone,
  c.home_phone as customer_home_phone,
  c.mobile_phone as customer_mobile_phone,
  c.fax_number as customer_fax_number,
  c.address as customer_address,
  c.city as customer_city,
  c.state_province as customer_state_province,
  c.zip_postal_code as customer_zip_postal_code,
  e.company as employee_company,
  e.last_name as employee_last_name,
  e.first_name as employee_first_name,
  e.email_address as employee_email_address,
  e.job_title as employee_job_title,
  e.business_phone as employee_business_phone,
  e.home_phone as employee_home_phone,
  e.mobile_phone as employee_mobile_phone,
  e.fax_number as employee_fax_number,
  e.address as employee_address,
  e.city as employee_city,
  e.state_province as employee_state_province,
  e.zip_postal_code as employee_zip_postal_code
FROM
  {{ref('fact_orders')}} o
LEFT JOIN
  {{ref('dim_customer')}} c
ON
  o.customer_id = c.customer_id
LEFT JOIN
  {{ref('dim_employees')}} e
ON
  o.employee_id = e.employee_id
