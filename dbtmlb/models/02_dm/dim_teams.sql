with added_row_number as (SELECT 
      ct._franchID AS team_key
    , ct._name AS franchise_name
    , cp._park_name AS ballpark
    , cp._city as team_city
    , cp._state AS team_state
    , cp._country AS team_country
    , ROW_NUMBER() OVER(PARTITION BY ct._franchID ORDER BY ct._name DESC) AS row_number
FROM {{ source('mlb_data', 'upstream_Teams') }} ct
LEFT JOIN {{ source('mlb_data', 'core_Parks') }} cp ON ct._park = COALESCE(cp._park_alias, cp._park_name)
ORDER BY 1,2,3)

SELECT
  *
FROM added_row_number
WHERE row_number = 1