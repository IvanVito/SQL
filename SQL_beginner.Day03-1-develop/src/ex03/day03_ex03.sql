SELECT name AS pizzeria_name
FROM ( SELECT pizzeria_id, COUNT(*) as num_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'female'
    GROUP BY pizzeria_id
    EXCEPT ALL
    SELECT pizzeria_id, COUNT(*) as num_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'male'
    GROUP BY pizzeria_id) AS num_visits
JOIN pizzeria p ON num_visits.pizzeria_id = p.id
ORDER BY name