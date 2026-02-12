with 

source as (

    select * from {{ source('taxi_and_fhv', 'fhv_uber_table') }}

),

renamed as (

    select
        dispatching_base_num as dispatching_base_number,
        pickup_datetime as pickup_datetime_at,
        dropoff_datetime as dropoff_datetime_at,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        sr_flag as has_sr_flag,
        affiliated_base_number

    from source

)

select * from renamed