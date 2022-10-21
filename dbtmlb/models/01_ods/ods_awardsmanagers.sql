SELECT
      m._playerID AS playerID
    , m._awardID AS awardID
    , m._yearID AS yearID
    , m._lgID AS lgID
    , m._tie AS tie
    , m._notes AS notes
FROM {{ source('mlb_data', 'contrib_AwardsManagers') }} m