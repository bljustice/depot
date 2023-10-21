{{ 
    config(
        materialized='ephemeral',
        tags=['ynab_transactions'],
    )
}}

select
    id
    , date
    , account_id
    , payee_id
    , category_id
    , cleared
    , approved
    , amount as amount_usd_milliunits
    , round(amount / 1000., 2) as amount_usd
from 
    {{ source('ynab', 'ynab_transactions') }}
