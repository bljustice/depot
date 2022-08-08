{{ config(materialized='table') }}

select 
	to_char(dt, 'yyyymmdd')::integer as dim_date_key
	, extract(year from dt) as year
	, to_char(dt, 'Month') as month
	, to_char(dt, 'Day') as day
	, to_char(dt, 'yyyy-mm-dd') as date
from 
	{{ ref('all_dates') }}
