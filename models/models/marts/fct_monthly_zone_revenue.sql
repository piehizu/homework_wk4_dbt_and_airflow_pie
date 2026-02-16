{{ config(location="us-east1") }}

with fct_monthly_zone_revenue as (

    select * from {{ ref('fct_trip') }} ftrip
    join {{ ref('dim_zones') }} dzone_pu on ftrip.pu_location_id = dzone_pu.location_id

) 

select

    fmzrev.service_type
    , fmzrev.zone as pickup_zone
    , date_trunc(fmzrev.pickup_datetime_at, month) as revenue_month
    , sum(fmzrev.total_amount) as revenue_monthly_total_amount
    , count(distinct fmzrev.trip_id) as total_monthly_trips --potential failure point for counts
    --, AVG(fmzrev.tip_amount) OVER (PARTITION BY fmzrev.service_type, fmzrev.zone, date_trunc(fmzrev.pickup_datetime_at, month) 
    --                                ORDER BY fmzrev.service_type) AS avg_tip_amount_by_zone

from fct_monthly_zone_revenue fmzrev

group by 
    fmzrev.service_type
    , fmzrev.zone
    , date_trunc(fmzrev.pickup_datetime_at, month)



