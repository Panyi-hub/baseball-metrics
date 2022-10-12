SELECT
      m._awardID AS awards_key
    , m._playerID AS people_key
    , m._yearID AS year
    , NULL AS league
FROM {{ source('mlb_data', 'contrib_AwardsManagers') }} m

UNION ALL

SELECT
      p._awardID AS awards_key
    , p._playerID AS people_key
    , p._yearID AS year
    , p._lgID AS league
FROM {{ source('mlb_data', 'contrib_AwardsPlayers') }} p
