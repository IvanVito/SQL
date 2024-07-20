SELECT pizza_name, price, p.name AS pizzeria_name, visit_date
FROM(SELECT name, id FROM person WHERE name = 'Kate') AS Kate
JOIN person_visits pv ON person_id = Kate.id
JOIN menu ON menu.pizzeria_id = pv.pizzeria_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, p.name