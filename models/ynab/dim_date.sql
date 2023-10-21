{{ config(materialized='table') }}

with clean as (
	select 
		strftime(dt, '%Y%m%d')::integer as dim_date_key
		, date_trunc('year', dt) as year
		, date_trunc('month', dt) as month
		, date_trunc('day', dt) as day
		, dt as date
	from 
		{{ ref('all_dates') }}
)

select
	distinct dim_date_key
	, year
	, month
	, day	
from clean
