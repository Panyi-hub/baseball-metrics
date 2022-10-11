SELECT
    *
FROM {{ source('mlb_data', 'core_Batting') }}