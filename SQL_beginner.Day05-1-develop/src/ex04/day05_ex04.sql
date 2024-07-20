SET enable_seqscan = OFF;

CREATE UNIQUE INDEX idx_menu_unique
ON menu (pizzeria_id, pizza_name);

EXPLAIN ANALYSE
SELECT pizza_name
FROM menu;

