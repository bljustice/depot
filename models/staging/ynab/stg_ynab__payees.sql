{{ 
    config(
        materialized='ephemeral', 
        tags=['ynab_payees'],
    )
}}

select
    id as dim_payee_key
    , name
    , deleted
from
    {{ source('ynab', 'ynab_payees') }}
