SELECT
date,
time,
hour,
minute,
hitnumBer,
isInteraction,
isExit,
type,
fullVisitorId,
visitStartTime,
  TIMESTAMP_SECONDS(visitStartTime) as starttime_UTC,
  DATETIME(TIMESTAMP_SECONDS(visitStartTime), "America/Sao_Paulo") as starttime_LOCAL,
totals.newVisits,
totals.timeOnSite,
totals.pageviews,
totals.timeOnScreen,
totals.screenviews,
totails
visitNumber,
page.pagePath,
page.hostname,
eventInfo.eventCategory,
eventInfo.eventAction,
eventInfo.eventLabel,
device.deviceCategory,
device.browser,
geoNetwork.region,
geoNetwork.country,
geoNetwork.city,
trafficSource.source
FROM
`GOOGLEZWK*`
CROSS JOIN UNNEST(hits)
WHERE page.hostname LIKE "domain" AND
date BETWEEN '20210809' AND '20210813'
GROUP BY
date, fullVisitorId,visitStartTime,isInteraction,isExit, starttime_LOCAL,time, hour, minute, hitnumBer,type,pagePath, hostname, pageviews,screenviews,timeOnScreen, newVisits, timeOnSite, visitNumber, deviceCategory, browser, region, country, city, source, eventCategory, eventAction, eventLabel
ORDER BY
date, visitStartTime desc, fullVisitorId
