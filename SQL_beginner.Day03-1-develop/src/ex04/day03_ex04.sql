WITH fem_id AS (SELECT DISTINCT p.name AS woman_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu m ON menu_id = m.id
    JOIN  pizzeria p ON p.id = m.pizzeria_id
    WHERE person.gender = 'female'),
male_id AS (SELECT DISTINCT p.name AS man_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu m ON menu_id = m.id
    JOIN  pizzeria p ON p.id = m.pizzeria_id
    WHERE person.gender = 'male')

SELECT woman_name AS pizzeria_name
    FROM (SELECT woman_name
        FROM fem_id
    EXCEPT
        SELECT man_name
        FROM male_id) AS wom
UNION
SELECT *
    FROM (SELECT man_name
        FROM male_id
    EXCEPT
        SELECT woman_name
        FROM fem_id) AS mom
ORDER BY pizzeria_name