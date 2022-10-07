
SELECT 
    _franchID AS team_key 
    , _franchName AS franchise_name 
FROM {{ source('mlb_data', 'core_TeamsFranchises') }}