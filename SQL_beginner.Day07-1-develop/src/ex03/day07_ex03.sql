SELECT name, SUM(count) AS total_count
FROM(
    (SELECT name, COUNT(*) AS count
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria ON pizzeria.id = m.pizzeria_id
    GROUP BY name)
    UNION
    (SELECT name, COUNT(*) AS count
    FROM person_visits pv
    JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
    GROUP BY name)
         ) AS total_visits
GROUP BY name
ORDER BY total_count DESC, name