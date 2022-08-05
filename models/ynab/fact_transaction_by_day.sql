{{ config(materialized='table') }}

select
    id as dim_transaction_key
    , dim_date_key
    , dim_account_key
    , dim_payee_key
    , dim_category_key
    , cleared
    , approved
    , amount
    , yt.deleted
from 
    warehouse.ynab_transactions yt
join
    warehouse.dim_date dd
    using (date)
join
    warehouse.dim_account da
    on yt.account_id = da.dim_account_key
join
    warehouse.dim_category dc 
    on yt.category_id = dc.dim_category_key
join
    warehouse.dim_payee dp
    on yt.payee_id = dp.dim_payee_key
