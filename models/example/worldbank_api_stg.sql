{{ config(materialized='table') }}

with 

flattened_columns as (

    select
        worldbank_api_indicator->>'id' as worldbank_api_indicator_id,
        worldbank_api_indicator->>'value' as worldbank_api_indicator_value,
        worldbank_api_country->>'id' as worldbank_api_country_id,
        worldbank_api_country->>'value' as worldbank_api_country_value,
        worldbank_api_countryiso3code,
        worldbank_api_date,
        worldbank_api_value,
        worldbank_api_unit,
        worldbank_api_obs_status,
        worldbank_api_decimal
    from worldbank_api
),

final as (

    select
        *,
        {{ dbt_utils.generate_surrogate_key(['worldbank_api_indicator_id',
         'worldbank_api_indicator_value',
         'worldbank_api_country_id',
         'worldbank_api_country_value',
         'worldbank_api_countryiso3code',
         'worldbank_api_date',
         'worldbank_api_value',
         'worldbank_api_unit',
         'worldbank_api_obs_status',
         'worldbank_api_decimal']) }} as generated_id
    from flattened_columns

)

select *
from final
