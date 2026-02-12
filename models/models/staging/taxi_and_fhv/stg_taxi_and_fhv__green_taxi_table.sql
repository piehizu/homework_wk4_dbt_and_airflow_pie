with 

source as (

    select * from {{ source('taxi_and_fhv', 'green_taxi_table') }}

),

renamed as (

    select
        vendorid as vendor_id,
        lpep_pickup_datetime as pickup_datetime_at,
        lpep_dropoff_datetime as dropoff_datetime_at,
        store_and_fwd_flag as ,
        ratecodeid as ratecode_id,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        ehail_fee,
        improvement_surcharge,
        total_amount,
        payment_type,
        trip_type,
        congestion_surcharge

    from source

)

select * from renamed