{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['transaction_id', 'dim_date_key', 'dim_account_key', 'dim_payee_key', 'dim_category_key']) }} as fact_transaction_by_day_key
    , transaction_id
    , dim_date_key
    , dim_account_key
    , dim_payee_key
    , dim_category_key
    , cleared
    , approved
    , amount_usd_milliunits
    , amount_usd
from
    {{ ref('stg_ynab__transactions') }} yt
join
    {{ ref('dim_date') }} dd
    on strftime(date::date, '%Y%m%d')::integer = dd.dim_date_key
join
    {{ ref('dim_account') }} da
    using (account_id)
left join
    {{ ref('dim_category') }} dc 
    using (category_id)
left join
    {{ ref('dim_payee') }} dp
    using (payee_id)
