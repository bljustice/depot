{{ 
    config(
        materialized='ephemeral', 
        tags=['ynab_payees'],
    )
}}

select
    id as payee_id
    , name
from
    {{ source('ynab', 'ynab_payees') }}
