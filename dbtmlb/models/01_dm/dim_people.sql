
SELECT
     cp._playerID AS people_key
    ,ccp._schoolID AS school_key
    ,cp._birthYear AS birth_year
    ,cp._birthMonth AS birth_month
    ,cp._birthDay AS birth_day
    ,cp._birthCountry AS birth_country
    ,cp._birthState AS birth_state
    ,cp._birthCity AS birth_city
    ,cp._deathYear AS death_year
    ,cp._deathMonth AS death_month
    ,cp._deathDay AS death_day
    ,cp._deathCountry AS death_country
    ,cp._deathState AS death_state
    ,cp._deathCity AS death_city
    ,cp._nameFirst AS name_first
    ,cp._nameLast AS name_last
    ,cp._nameGiven AS name_given
    ,cp._weight AS weight_in_lbs
    ,((CAST(cp._weight as INT64))*453.6)/1000 AS weight_in_kg
    ,cp._height AS height_in_inches
    ,(CAST(cp._height as INT64)* 2.54) AS height_in_cm
    ,cp._bats AS bats
    ,cp._throws AS throws
    ,cp._debut AS debut_date
    ,cp._finalGame AS final_game_date
FROM {{ source('mlb_data', 'core_People') }} cp
LEFT JOIN {{ source('mlb_data', 'contrib_CollegePlaying') }} ccp ON cp._playerID = ccp._playerID