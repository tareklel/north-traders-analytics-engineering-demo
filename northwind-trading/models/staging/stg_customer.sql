SELECT
  id,
  company,
  last_name,
  first_name,
  email_address,
  job_title,
  business_phone,
  home_phone,
  mobile_phone,
  fax_number,
  address,
  city,
  state_province,
  zip_postal_code
FROM
  {{ source('northwind', 'customer') }}
