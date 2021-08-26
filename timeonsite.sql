SELECT
date,
fullVisitorId AS id,
visitNumber AS number_session,
totals.newVisits As new_visit,
totals.hits AS total_hit,
hit.time/1000 AS hits_time,
totals.timeOnSite,
totals.pageviews AS pageviews,
hit.isExit AS exit,
hit.page.pagePath,
customDimension.index,
customDimension.value,
page.hostname,
hit.eventInfo.eventCategory AS eventCategory,
hit.eventInfo.eventAction AS eventAction,
hit.eventInfo.eventLabel AS eventLabel,
FROM `GOOGLE DATE 08*`
CROSS JOIN UNNEST(hits) AS hit, UNNEST(hit.customDimensions) AS customDimension
WHERE page.hostname LIKE "target" AND customDimension.index = 3
GROUP BY date,id, total_hit,number_session, hostname, index,value, hits_time, pagePath, timeOnSite, pageviews, exit,eventCategory, eventAction, eventLabel,  new_visit
ORDER BY id,hits_time DESC
