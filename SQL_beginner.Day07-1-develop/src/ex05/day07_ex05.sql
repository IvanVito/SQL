SELECT name
FROM person
WHERE id IN (SELECT DISTINCT person_id FROM person_order)
ORDER BY name
