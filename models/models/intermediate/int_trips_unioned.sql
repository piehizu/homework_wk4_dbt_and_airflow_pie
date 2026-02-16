{{ config(materialized='table') }}

with unioned as (
    {{ dbt_utils.union_relations(
        relations=[ref('stg_taxi_and_fhv__yellow_taxi_table'), ref('stg_taxi_and_fhv__green_taxi_table') ]
    ) }}
)
{#
/*
{{ dbt_utils.union_relations(
    relations=[ref('my_model'), source('my_source', 'my_table')],
    exclude=["_loaded_at"]
) }}
*/
#}
select
    *
from unioned