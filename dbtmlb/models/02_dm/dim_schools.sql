
SELECT
      cs._schoolID AS school_key
    , cs._name_full AS school_name
    , cs._city AS school_city
    , cs._state AS school_state
    , cs._country AS school_country
FROM {{ source('mlb_data', 'contrib_Schools') }} cs

