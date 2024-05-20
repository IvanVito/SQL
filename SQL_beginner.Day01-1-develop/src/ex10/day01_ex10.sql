SELECT p.name AS person_name, pizza_name, pi.name AS pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria pi ON pi.id = menu.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;