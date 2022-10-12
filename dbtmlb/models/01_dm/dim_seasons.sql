SELECT
    distinct b._yearID AS season_key
    , CASE WHEN b._yearID = 2020 THEN 60
        WHEN b._yearID = 1918 THEN 131
        WHEN b._yearID = 1919 THEN 140
        WHEN b._yearID NOT IN (1918, 1919) AND b._yearID < 1961 THEN 154
        ELSE 162
    END AS number_of_matches
FROM {{ source('mlb_data', 'contrib_AwardsSharePlayers') }} b