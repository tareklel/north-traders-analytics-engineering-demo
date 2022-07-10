SELECT
  format_date('%F', CAST(d as DATE)) as id,
  d as fulldate,
  extract(YEAR from d) as year,
  extract(WEEK from d) as year_week,
  extract(DAY from d) as year_day,
  extract(YEAR from d) as fiscal_year,
  format_date('%Q', d) as fiscal_qtr,
  extract(MONTH from d) as month,
  format_date('%B', d) as month_name,
  format_date('%w', d) as week_day,
  format_date('%A', d) as day_name,
  CASE WHEN format_date('%A', d) in ('Saturday', 'Sunday') THEN 0 ELSE 1 END as day_is_weekday
FROM
  (
    SELECT * FROM unnest(generate_date_array('2014-01-01', '2050-01-01', interval 1 day))
  as d)
