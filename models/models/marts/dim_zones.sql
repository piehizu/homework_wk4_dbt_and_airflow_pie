{{ config(location="us-east1", materialized='table') }}

with dim_zones as (

    select * from {{ ref('taxi_zone_lookup') }}
)

select 

    locationid as location_id
    , borough
    , dzone.zone
    , service_zone


 from dim_zones dzone