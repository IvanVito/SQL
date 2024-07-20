SELECT object_name
FROM (
  SELECT name AS object_name, 'person' AS table_name
  FROM person
  UNION ALL
  SELECT pizza_name, 'menu'
  FROM menu
) AS subquery
ORDER BY table_name DESC, object_name