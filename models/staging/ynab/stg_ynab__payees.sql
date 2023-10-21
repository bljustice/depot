{{ 
    config(
        materialized='ephemeral', 
        tags=['ynab_payees'],
    )
}}

select
    id
    , name
from
    {{ source('ynab', 'ynab_payees') }}
