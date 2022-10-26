WITH added_row_number AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY _playerID, _yearID) AS row_number
  FROM {{ source('mlb_data', 'contrib_AwardsPlayers') }} 
GROUP BY 1,2,3,4,5,6
ORDER BY 7 DESC
),

first_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 1),

second_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 2),

third_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 3),

fourth_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 4),

fifth_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 5),

sixth_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 6),

seventh_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 7),

eight_yearly_award_winning AS (SELECT
  *
FROM added_row_number
WHERE row_number = 8)


SELECT
      fi._playerID AS playerID
    , fi._yearID AS yearID
    , CASE 
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID,fo._awardID,fif._awardID,si._awardID,sev._awardID,ei._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID,"-",fo._awardID,"-",fif._awardID,"-",si._awardID,"-",sev._awardID,"-",ei._awardID)
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID,fo._awardID,fif._awardID,si._awardID,sev._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID,"-",fo._awardID,"-",fif._awardID,"-",si._awardID,"-",sev._awardID)
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID,fo._awardID,fif._awardID,si._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID,"-",fo._awardID,"-",fif._awardID,"-",si._awardID)
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID,fo._awardID,fif._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID,"-",fo._awardID,"-",fif._awardID)
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID,fo._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID,"-",fo._awardID)
        WHEN CONCAT(fi._awardID,se._awardID,th._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID,"-",th._awardID)
        WHEN CONCAT(fi._awardID,se._awardID) IS NOT NULL THEN CONCAT(fi._awardID,"-",se._awardID)
        ELSE fi._awardID
      END AS awardID
FROM first_yearly_award_winning fi
LEFT JOIN second_yearly_award_winning se ON fi._playerID = se._playerID AND fi._yearID = se._yearID
LEFT JOIN third_yearly_award_winning th ON fi._playerID = th._playerID AND fi._yearID = th._yearID
LEFT JOIN fourth_yearly_award_winning fo ON fi._playerID = fo._playerID AND fi._yearID = fo._yearID
LEFT JOIN fifth_yearly_award_winning fif ON fi._playerID = fif._playerID AND fi._yearID = fif._yearID
LEFT JOIN sixth_yearly_award_winning si ON fi._playerID = si._playerID AND fi._yearID = si._yearID
LEFT JOIN seventh_yearly_award_winning sev ON fi._playerID = sev._playerID AND fi._yearID = sev._yearID
LEFT JOIN eight_yearly_award_winning ei ON fi._playerID = ei._playerID AND fi._yearID = ei._yearID
ORDER BY 2 ASC