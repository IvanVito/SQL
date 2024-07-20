WITH good_dates AS (
  SELECT generate_series(date '2022-01-01', date '2022-01-10', interval '1 day') AS visit_date
), bad_dates AS (
  SELECT DISTINCT visit_date
  FROM person_visits
  WHERE person_id = 1 OR person_id = 2
)
SELECT good_dates.visit_date::date AS missing_date
FROM good_dates
LEFT JOIN bad_dates ON good_dates.visit_date = bad_dates.visit_date
WHERE bad_dates.visit_date IS NULL
ORDER BY missing_date;