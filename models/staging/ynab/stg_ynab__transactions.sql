{{ config(materialized='ephemeral') }}

select
    id as dim_transaction_key
    , date
    , account_id as dim_account_key
    , payee_id as dim_payee_key
    , category_id as dim_category_key
    , cleared
    , approved
    , amount as amount_usd_milliunits
    , round(amount / 1000., 2) as amount_usd
    , deleted
from 
    {{ source('ynab', 'ynab_transactions') }}
