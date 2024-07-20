(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria ON pizzeria.id = m.pizzeria_id
GROUP BY name
ORDER BY action_type, count DESC
LIMIT 3)
UNION
(SELECT name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
GROUP BY name
ORDER BY action_type, count DESC
LIMIT 3)
ORDER BY action_type, count DESC
