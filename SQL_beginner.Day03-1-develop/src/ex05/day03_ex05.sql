WITH cam AS (SELECT DISTINCT p.name AS name
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN  pizzeria p ON p.id = pizzeria_id
    WHERE person.name = 'Andrey'),
ord AS (SELECT DISTINCT p.name AS name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu m ON m.id = menu_id
    JOIN  pizzeria p ON p.id = pizzeria_id
    WHERE person.name = 'Andrey')

SELECT name AS pizzeria_name
    FROM cam
EXCEPT
SELECT name
    FROM ord
ORDER BY pizzeria_name