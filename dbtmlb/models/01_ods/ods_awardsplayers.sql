SELECT
      p._playerID AS playerID
    , p._awardID AS awardID
    , p._yearID AS yearID
    , CASE 
        WHEN p._lgID IS NULL THEN "NULL"
        ELSE p._lgID
    END AS lgID
    , p._tie AS tie
    , CASE 
        WHEN p._notes IS NULL THEN "NULL"
        ELSE p._notes
    END AS notes
FROM {{ source('mlb_data', 'contrib_AwardsPlayers') }} p