COMMENT ON TABLE person_discounts IS 'Таблица с персональными скидками для клиентов в конкретных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор для каждой записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Процентное значение скидки от 0 до 100';