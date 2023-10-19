{{ 
    config(
        materialized='ephemeral',
        tags=['ynab_categories'],
    )
}}

select
    id as dim_category_key
    , name as category_name
    , hidden
    , budgeted as amount_budgeted
    , activity as spend_activity
    , balance
    , goal_type
    , goal_creation_month
    , goal_target
    , goal_target_month
    , goal_percentage_complete
    , deleted
from
    {{ source('ynab', 'ynab_categories') }}
