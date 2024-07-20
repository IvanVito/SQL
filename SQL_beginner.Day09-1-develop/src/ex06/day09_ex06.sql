CREATE OR REPLACE FUNCTION  fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice INTEGER DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT DISTINCT pz.name
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id
    JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    WHERE p.name = pperson AND price < pprice
    AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
