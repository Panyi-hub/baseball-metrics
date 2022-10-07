SELECT
    b._yearID AS season_key
    , CASE WHEN b._yearID = 2020 THEN 60
        ELSE 162
    END AS number_of_matches
FROM {{ source('mlb_data', 'AwardsSharePlayers') }} b