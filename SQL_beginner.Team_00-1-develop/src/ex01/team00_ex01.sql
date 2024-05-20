CREATE VIEW ex01 AS (
    SELECT *
    FROM done_tour
    WHERE total_cost = (SELECT MAX(total_cost) FROM done_tour)
    UNION
    SELECT *
    FROM ex00
    ORDER BY total_cost, tour);