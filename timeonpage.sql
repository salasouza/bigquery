SELECT
  date,
  fullVisitorId,
  index,
  value,
  visitNumber,
  hostname,
  pagePath,
  pageviews,
  eventCategory,
  eventAction,
  eventLabel,
  region,
  city,
  hitNumber,
  time,
  nextTime,
  (nextTime - time) as timeOnPage,
FROM(
  SELECT
    date,
    fullVisitorId,
    customDimension.index,
    customDimension.value,
    visitNumber,
    page.hostname,
    page.pagePath,
    totals.pageviews,
    eventInfo.eventCategory,
    eventInfo.eventAction,
    eventInfo.eventLabel,
    geoNetwork.region,
    geoNetwork.city,
    hitNumber,
    time,
    LEAD(hit.time, 1) OVER (PARTITION BY fullVisitorId, visitNumber ORDER BY hit.time ASC) as nextTime
FROM `Google_2021*`
CROSS JOIN UNNEST(hits) AS hit, UNNEST(hit.customDimensions) AS customDimension
WHERE page.hostname LIKE "url" AND customDimension.index = 3 AND
date BETWEEN '20210901' AND '20210910'
)
GROUP BY  date,
  fullVisitorId,
  index,
  value,
  visitNumber,
  hostname,
  pagePath,
  pageviews,
  eventCategory,
  eventAction,
  eventLabel,
  region,
  city,
  hitNumber,
  time,
  nextTime
ORDER BY date,fullVisitorId, hitNumber ASC
