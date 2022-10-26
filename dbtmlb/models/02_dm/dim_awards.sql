SELECT
      CONCAT(m.playerID,m.yearID,m.awardID) AS awards_key
    , m.awardID AS award
    , m.playerID AS people_key
    , m.yearID AS year
FROM {{ ref('ods_awardsmanagers') }} m

UNION ALL

SELECT
      CONCAT(p.playerID,p.yearID,p.awardID) AS awards_key
    , p.awardID AS award  
    , p.playerID AS people_key
    , p.yearID AS year
FROM {{ ref('ods_awardsplayers') }} p
