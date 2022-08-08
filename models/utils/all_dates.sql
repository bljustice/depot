{{ config(materialized='ephemeral') }}


select
    s.a as dt
from 
    generate_series(
		'1970-01-01'::timestamp,
		'9999-12-31'::timestamp,
		'1 day'::interval
	) as s(a)
