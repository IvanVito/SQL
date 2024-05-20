SELECT p.name AS name, m.pizza_name AS pizza_name, price, price -(discount/100 * price) AS discount_price, pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON m.id = menu_id
JOIN pizzeria pz ON pz.id = pizzeria_id
JOIN person_discounts pd ON po.person_id = pd.person_id AND pd.pizzeria_id = m.pizzeria_id
ORDER BY name, pizza_name
