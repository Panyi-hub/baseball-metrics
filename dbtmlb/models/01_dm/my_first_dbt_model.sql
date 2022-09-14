
select *
from {{ source('mlb_data', 'contrib_AwardsManagers') }}

