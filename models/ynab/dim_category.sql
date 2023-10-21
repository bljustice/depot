{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['category_id']) }} as dim_category_key
    , category_id
    , category_name
    , hidden
    , amount_budgeted
    , spend_activity
    , balance
    , goal_type
    , goal_creation_month
    , goal_target
    , goal_target_month
    , goal_percentage_complete
from
    {{ ref('stg_ynab__categories') }}
