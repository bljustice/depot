{{ config(materialized='table') }}

with date_list as (
	select s.a as dt
	from generate_series(
		'1970-01-01'::timestamp,
		'9999-12-31'::timestamp,
		'1 day'::interval
	) as s(a)
)

select 
	to_char(dt, 'yyyymmdd')::integer as dim_date_key
	, extract(year from dt) as year
	, to_char(dt, 'Month') as month
	, to_char(dt, 'Day') as day
	, to_char(dt, 'yyyy-mm-dd') as date
from date_list
