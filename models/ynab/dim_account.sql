{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as dim_account_key
    , id as account_id
    , account_name
    , account_type
    , on_budget
    , closed
    , balance
    , cleared_balance
    , uncleared_balance
from
    {{ ref('stg_ynab__accounts') }}
