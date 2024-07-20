SELECT pi.name
FROM (SELECT person_id, pizzeria_id FROM person_visits WHERE visit_date = '2022-01-08') AS date
JOIN person p ON date.person_id = p.id
JOIN pizzeria pi ON date.pizzeria_id = pi.id
JOIN menu m ON pi.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND m.price < 800
