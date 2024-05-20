SELECT visit_date AS action_date, name AS person_name
FROM person_visits
JOIN person ON person_id = person.id
INTERSECT ALL
SELECT order_date, name
FROM person_order
JOIN person ON person_id = person.id
ORDER BY action_date, person_name DESC;