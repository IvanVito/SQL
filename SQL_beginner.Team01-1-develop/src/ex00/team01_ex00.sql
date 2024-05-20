WITH max_id AS (
SELECT ID, MAX(updated) AS max_updated FROM currency GROUP BY ID
)

SELECT
    COALESCE (u.name, 'not defined') AS name,
    COALESCE (u.lastname, 'not defined') AS lastname,
    b.type,
    SUM(b.money) AS volume,
    COALESCE (c.name, 'not defined') AS currency_name,
    COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(b.money) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM balance b
LEFT JOIN "user" u ON b.user_id = u.id
LEFT JOIN currency c ON b.currency_id = c.id
LEFT JOIN max_id ON c.id = max_id.id AND c.updated = max_id.max_updated
WHERE max_updated IS NOT NULL OR c.updated IS NULL
GROUP BY
u.id, b.type, c.name, c.rate_to_usd
ORDER BY
name DESC, lastname, type;