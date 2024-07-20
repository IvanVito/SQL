INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series (((SELECT MAX(id) FROM person_order) + 1), (SELECT MAX(id) FROM person_order) + (SELECT MAX(id) FROM person)) AS id,
       generate_series (1, (SELECT MAX(id) FROM person)) AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'Greek pizza') AS menu_id,
       '2022-02-25' AS order_date
ORDER BY id


