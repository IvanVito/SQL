SELECT a.name AS person1, b.name AS person2, a.address
FROM person a
JOIN person b ON a.address = b.address AND a.id > b.id
ORDER BY a.name, b.name, a.address