
select
      _schoolID as school_key
    , _name_full as school_name
    , _city as school_city
    , _state as school_state
    , _country as school_country
from {{ source('mlb_data', 'contrib_Schools') }}

