
SELECT 
      distinct ct._franchID AS team_key 
    , ct._franchName AS franchise_name 
    , cp._park_name AS ballpark
    , cp._city as team_city 
    , cp._state AS team_state  
    , cp._country AS team_country
FROM {{ source('mlb_data', 'core_TeamsFranchises') }} ct
LEFT JOIN {{ source('mlb_data', 'upstream_Teams') }} ut ON ct._franchID = ut._franchID
LEFT JOIN {{ source('mlb_data', 'core_Parks') }} cp ON ut._park = COALESCE(cp._park_alias, cp._park_name)