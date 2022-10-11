SELECT
      _playerID AS people_key
    , _teamID AS team_key
    , _yearID AS season_key
    , _G AS games_played
    , _AB AS at_bat
    , _R AS run
    , _H AS hit
    , _2B AS double_base_hit
    , _3B AS triple_base_hit
    , _HR AS home_runs
    , _RBI AS run_batted_in
    , _SB AS stolen_bases
    , _BB AS base_walking
    , _SO AS strike_outs
FROM {{ source('mlb_data', 'core_Batting') }}