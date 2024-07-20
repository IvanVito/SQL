SELECT DISTINCT name
FROM (SELECT name, id
FROM person
WHERE gender = 'male' AND (address ='Moscow' or address ='Samara')) AS per_date
JOIN person_order ON per_date.id = person_order.person_id
JOIN menu ON menu_id = menu.id
WHERE pizza_name ='mushroom pizza' or pizza_name ='pepperoni pizza'
ORDER BY name DESC