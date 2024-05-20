SELECT name, COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY person_id, name
ORDER BY count_of_visits DESC, person_id
LIMIT 4