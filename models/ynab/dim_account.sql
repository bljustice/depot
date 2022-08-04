{{ config(materialized='table') }}

select
    id as dim_account_key
    , name as account_name
    , type as account_type
    , on_budget
    , closed
    , balance
    , cleared_balance
    , uncleared_balance
    , deleted
from
    warehouse.ynab_accounts
