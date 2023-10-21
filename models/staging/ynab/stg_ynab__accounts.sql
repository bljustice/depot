{{
    config(
        materialized='ephemeral',
        tags=['ynab_accounts'],
    ) 
}}

select
    id as account_id
    , name as account_name
    , type as account_type
    , on_budget
    , closed
    , balance
    , cleared_balance
    , uncleared_balance
from
    {{ source('ynab', 'ynab_accounts') }}

