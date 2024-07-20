SELECT pizza_name, name AS pizzeria_name, price
FROM(SELECT *
    FROM menu
    WHERE pizza_name ='mushroom pizza' OR pizza_name ='pepperoni pizza') AS cut
JOIN pizzeria ON cut.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name