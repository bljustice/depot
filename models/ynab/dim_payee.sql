
{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as dim_payee_key
    , id as payee_id
    , name
from
    {{ ref('stg_ynab__payees') }}
