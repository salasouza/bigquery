CASE
    WHEN REGEXP_MATCH(Event Label,"string") THEN "String"  
    ELSE 'other'
END

CASE
WHEN Event Action ="stringA" AND Event Label = "stringB" THEN 'stringC'
ELSE "other"
END