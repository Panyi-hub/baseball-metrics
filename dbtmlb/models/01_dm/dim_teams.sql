
SELECT 
      distinct ct._franchID AS team_key 
    , ct._name AS franchise_name 
    , cp._park_name AS ballpark
    , cp._city as team_city 
    , cp._state AS team_state  
    , cp._country AS team_country
FROM {{ source('mlb_data', 'upstream_Teams') }} ct
LEFT JOIN {{ source('mlb_data', 'core_Parks') }} cp ON ct._park = cp._park_alias