
{{ config(materialized='table') }}

select
    dim_payee_key
    , name
    , deleted
from
    {{ ref('stg_ynab__payees') }}
