SELECT
date,
fullVisitorId AS id,
totals.hits AS total_hit,
page.hostname,
FROM `googleXYZ`
CROSS JOIN UNNEST(hits)
WHERE page.hostname LIKE "domain"
GROUP BY date,id, total_hit, hostname
ORDER BY id
