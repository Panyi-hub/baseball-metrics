
SELECT
     cp._playerID AS people_key
    ,ccp._schoolID AS school_key
FROM {{ source('mlb_data', 'core_People') }} cp
LEFT JOIN {{ source('mlb_data', 'contrib_CollegePlaying') }} ccp ON cp._playerID = ccp._playerID