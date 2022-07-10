SELECT
  *
FROM
  {{ source('northwind', 'orders') }}
