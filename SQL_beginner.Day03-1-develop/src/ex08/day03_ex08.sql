INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT MAX(menu.id) + 1, pizzeria_id,'Sicilian pizza', 900
    FROM menu
    JOIN pizzeria p ON menu.pizzeria_id = p.id
    WHERE name = 'Dominos'
GROUP BY pizzeria_id