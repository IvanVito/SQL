SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT pizza_name, name AS pizzeria_name
FROM menu
JOIN pizzeria p ON pizzeria_id = p.id;

