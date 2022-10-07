SELECT
      b._awardID AS awards_key
    , b._playerID AS people_key
    , b._yearID AS year
FROM {{ source('mlb_data', 'contrib_AwardsManagers') }} b