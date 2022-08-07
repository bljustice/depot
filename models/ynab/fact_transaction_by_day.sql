{{ config(materialized='table') }}

select
    dim_transaction_key
    , dim_date_key
    , dim_account_key
    , dim_payee_key
    , dim_category_key
    , cleared
    , approved
    , amount_usd_milliunits
    , amount_usd
    , yt.deleted
from
    {{ ref('stg_ynab__transactions') }} yt
join
    {{ ref('dim_date') }} dd
    using (date)
join
    {{ ref('dim_account') }} da
    using (dim_account_key)
join
    {{ ref('dim_category') }} dc 
    using (dim_category_key)
join
    {{ ref('dim_payee') }} dp
    using (dim_payee_key)
