
{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['payee_id']) }} as dim_payee_key
    , payee_id
    , name
from
    {{ ref('stg_ynab__payees') }}
