CREATE SEQUENCE seq_person_discounts;

SELECT SETVAL('seq_person_discounts', COALESCE((SELECT MAX(id) FROM person_discounts), 0));

ALTER TABLE person_discounts
ALTER column id SET DEFAULT nextval('seq_person_discounts');
