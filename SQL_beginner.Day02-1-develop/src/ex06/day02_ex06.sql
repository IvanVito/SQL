SELECT  pizza_name, pizzeria.name as pizzeria_name
FROM (SELECT *
    FROM person
    WHERE name = 'Anna' or name = 'Denis') as persons
JOIN person_order ON persons.id = person_order.person_id
JOIN (
    SELECT pizza_name, pizzeria_id, id
    FROM menu
) AS new_menu ON new_menu.id = menu_id
JOIN pizzeria ON pizzeria.id = pizzeria_id
ORDER BY  pizza_name, pizzeria_name
