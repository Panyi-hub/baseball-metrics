SELECT
      cb._playerID AS people_key
    , CONCAT(cb._teamID,"-",cb._yearID) AS team_key
    , cb._yearID AS season_key
    , ccp._schoolID AS school_key
    , cap._awardID AS awards_key
    , cb._G AS games_played
    , cb._AB AS at_bat
    , cb._R AS run
    , cb._H AS hit
    , cb._2B AS double_base_hit
    , cb._3B AS triple_base_hit
    , cb._HR AS home_runs
    , cb._RBI AS run_batted_in
    , cb._SB AS stolen_bases
    , cb._BB AS base_walking
    , cb._SO AS strike_outs
FROM {{ source('mlb_data', 'core_Batting') }} cb
LEFT JOIN {{ source('mlb_data', 'contrib_CollegePlaying') }} ccp ON cb._playerID = ccp._playerID
LEFT JOIN {{ source('mlb_data', 'contrib_AwardsPlayers') }} cap ON cb._playerID = cap._playerID