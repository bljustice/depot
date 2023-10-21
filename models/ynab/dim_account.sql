{{ config(materialized='table') }}

with clean_account as (
    select
        {{ dbt_utils.generate_surrogate_key(['account_id']) }} as dim_account_key
        , account_id
        , account_name
        , account_type
        , on_budget
        , closed
        , balance
        , cleared_balance
        , uncleared_balance
    from
        {{ ref('stg_ynab__accounts') }}
)

select * from clean_account
