
{{ config(materialized='table') }}

select
    dim_payee_key
    , name
from
    {{ ref('stg_ynab__payees') }}
