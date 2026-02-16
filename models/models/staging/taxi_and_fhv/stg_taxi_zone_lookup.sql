with taxi_zone_lookup as(

    select * from {{ ref('taxi_zone_lookup') }}

)

select 

    locationid as location_id
    , borough
    , tzl.zone as zone
    , service_zone

 from taxi_zone_lookup tzl 