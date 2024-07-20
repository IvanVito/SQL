SELECT DISTINCT
    (SELECT p.name
     FROM person p
     WHERE o.person_id = p.id) AS NAME
FROM person_order o
WHERE (o.menu_id = 13 OR o.menu_id = 14 OR o.menu_id = 18)
  AND (o.order_date = '2022-01-07');