
SELECT
      _schoolID AS school_key
    , _name_full AS school_name
    , _city AS school_city
    , _state AS school_state
    , _country AS school_country
FROM {{ source('mlb_data', 'contrib_Schools') }}

