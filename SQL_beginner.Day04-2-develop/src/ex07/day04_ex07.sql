INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT MIN(pizzeria.id)
         FROM pizzeria
         JOIN menu ON pizzeria.id = menu.pizzeria_id
         WHERE price < 800 AND name != 'Papa Johns'),
        '2022-01-08'::DATE);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats