{{ config(location="us-east1", materialized='table') }}


with fct_trip as (

    select * from {{ ref('int_trips_unioned') }} 
)

select 

abs(farm_fingerprint (concat (
cast(vendor_id as string)
, cast(pu_location_id as string) 
, cast(do_location_id as string)
)
)) as trip_id
, case when _dbt_source_relation = '`learning-terraform-pie`.`homework_wk_4_airflow_and_dbt`.`stg_taxi_and_fhv__yellow_taxi_table`'
then "yellow"
when _dbt_source_relation = '`learning-terraform-pie`.`homework_wk_4_airflow_and_dbt`.`stg_taxi_and_fhv__green_taxi_table`'
then "green" end as service_type
, int.pu_location_id
, int.pickup_datetime_at
, int.dropoff_datetime_at
, int.fare_amount
, int.tip_amount
, int.total_amount
, int.passenger_count
, int.trip_distance

from fct_trip int