
{{ config(materialized='table') }}

select
    id as dim_payee_key
    , name
    , deleted
from
    warehouse.ynab_payees
