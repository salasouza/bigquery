SELECT
  date,
  fullVisitorId,
  visitNumber,
  hostname,
  pagePath,
  hitNumber,
  time,
  nextTime,
  (nextTime - time) as timeOnPage,
FROM(
  SELECT
    date,
    fullVisitorId,
    visitNumber,
    page.hostname,
    page.pagePath,
    hitNumber,
    time,
    LEAD(hit.time, 1) OVER (PARTITION BY fullVisitorId, visitNumber ORDER BY hit.time ASC) as nextTime
FROM `GOOGLE*`
CROSS JOIN UNNEST(hits) AS hit, UNNEST(hit.customDimensions) AS customDimension
WHERE page.hostname LIKE "url" AND customDimension.index = 3 AND
date BETWEEN '20210816' AND '20210820'AND hit.type = "PAGE"
)
GROUP BY  date,
  fullVisitorId,
  visitNumber,
  hostname,
  pagePath,
  hitNumber,
  time,
  nextTime
ORDER BY date,fullVisitorId, hitNumber ASC
