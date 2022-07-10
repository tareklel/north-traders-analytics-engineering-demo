WITH
  source
AS
(
SELECT
  *
FROM
  {{ ref('stg_employees') }}
),

unique_source as
(
 SELECT *, ROW_NUMBER() OVER(PARTITION BY id) AS _row
 FROM
 source
)

SELECT
  id AS employee_id,
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
  unique_source
WHERE
  _row = 1
