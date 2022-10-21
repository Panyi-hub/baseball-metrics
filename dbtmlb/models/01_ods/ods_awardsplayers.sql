SELECT
      p._playerID AS playerID
    , p._awardID AS awardID
    , p._yearID AS yearID
    , p._lgID AS lgID
    , p._tie AS tie
    , p._notes AS notes
FROM {{ source('mlb_data', 'contrib_AwardsPlayers') }} p