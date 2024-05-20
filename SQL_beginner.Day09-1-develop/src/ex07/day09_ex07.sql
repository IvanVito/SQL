CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC [])
RETURNS NUMERIC AS $$
    SELECT MIN(value) FROM unnest(arr) AS value;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0001, 5.0, -1.01, -0.9, -1.1]);