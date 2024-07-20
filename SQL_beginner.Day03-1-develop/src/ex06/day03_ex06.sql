SELECT pizza_name, piz_name_1 AS pizzeria_name_1, name AS pizzeria_name_2, price
FROM(
    SELECT a.pizza_name AS pizza_name, a.price AS price, b.pizzeria_id, name AS piz_name_1
    FROM menu a
    JOIN menu b ON a.pizza_name = b.pizza_name AND a.price = b.price AND
    a.pizzeria_id != b.pizzeria_id AND a.pizzeria_id > b.pizzeria_id
    JOIN pizzeria p ON a.pizzeria_id = p.id) AS name_1
JOIN pizzeria p ON name_1.pizzeria_id = p.id
ORDER BY pizza_name;