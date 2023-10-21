{{ config(materialized='ephemeral') }}

with date_range as (
  select
     generate_series as start_timestamp,
     '2050-01-01'::date as stop_timestamp
  from
     generate_series(timestamp '2012-01-01', timestamp '2049-12-31', interval '37 years')
),

dt as (
select
  date_trunc('day', unnest(generate_series(start_timestamp, stop_timestamp, interval '1 day')))::date as dt,
from
  date_range
)

select * from dt
