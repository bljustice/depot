{{ config(materialized='table') }}

select
    dim_account_key
    , account_name
    , account_type
    , on_budget
    , closed
    , balance
    , cleared_balance
    , uncleared_balance
    , deleted
from
    {{ ref('stg_ynab__accounts') }}
