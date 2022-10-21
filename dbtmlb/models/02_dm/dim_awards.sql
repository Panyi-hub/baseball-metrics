SELECT
      CONCAT(m.awardID,"-",m.yearID,"-",m.playerID, "-managers") AS awards_key
    , m.playerID AS people_key
    , m.yearID AS year
    , NULL AS league
FROM {{ ref('ods_awardsmanagers') }} m

UNION ALL

SELECT
     CASE 
      WHEN p.playerID = 'martijd02' and p.awardID = 'Silver Slugger' and p.yearID = 2018 THEN CONCAT(p.awardID,"-",p.yearID, "-", p.playerID, "-", p.notes) 
      ELSE CONCAT(p.awardID,"-",p.yearID, "-", p.playerID, "-", p.lgID) 
     END AS awards_key
    , p.playerID AS people_key
    , p.yearID AS year
    , p.lgID AS league
FROM {{ ref('ods_awardsplayers') }} p
