SELECT pizza_name, price, name AS pizzeria_name
FROM (SELECT id AS menu_id FROM menu
EXCEPT
SELECT menu_id
FROM person_order
ORDER BY menu_id) AS piz_id
JOIN menu m ON m.id = piz_id.menu_id
JOIN pizzeria p ON pizzeria_id  = p.id
ORDER BY pizza_name, price;
