WITH counter AS (SELECT pizzeria_id, person_id, COUNT(*) AS amount_of_order
FROM person_order po
JOIN menu m ON po.menu_id = m.id
GROUP BY person_id, pizzeria_id
ORDER BY person_id)

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() over () AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN amount_of_order = 1 THEN 10.5
        WHEN amount_of_order = 2 THEN 22
        ELSE 30
    END AS discount
FROM counter
