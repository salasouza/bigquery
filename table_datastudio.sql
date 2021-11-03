CASE
    WHEN REGEXP_MATCH(Event Label,"string") THEN "String"  
    ELSE 'other'
END

