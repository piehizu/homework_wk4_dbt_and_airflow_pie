with 

source as (

    select * from {{ source('taxi_and_fhv', 'yellow_taxi_table') }}

),

renamed as (

    select
        vendorid as vendor_id,
        tpep_pickup_datetime as pickup_datetime_at,
        tpep_dropoff_datetime as dropoff_datetime_at,
        passenger_count,
        trip_distance,
        ratecodeid as ratecode_id,
        store_and_fwd_flag as has_store_and_fwd_flag,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        airport_fee

    from source

)

select * from renamed