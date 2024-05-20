SET enable_seqscan = OFF;

CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYSE
SELECT discount
FROM person p
JOIN person_discounts pd ON p.id = pd.person_id