SELECT
  *
FROM
  {{ source('northwind', 'employees') }}
