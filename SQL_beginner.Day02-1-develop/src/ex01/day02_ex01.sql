SELECT good_dates::date AS missing_date
FROM (SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 or person_id = 2) AS bad_dates
RIGHT JOIN generate_series(date '2022-01-01', date '2022-01-10', interval '1 day') AS good_dates ON good_dates = bad_dates.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;

