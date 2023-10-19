{{ config(materialized='table') }}

select
    dim_category_key
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
