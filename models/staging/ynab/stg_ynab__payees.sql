{{ 
    config(
        materialized='ephemeral', 
        tags=['ynab_payees'],
    )
}}

select
    id as dim_payee_key
    , name
from
    {{ source('ynab', 'ynab_payees') }}
