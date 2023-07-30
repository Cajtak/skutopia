
  
    

  create  table "worldbank_api_db"."public"."worldbank_api_stg__dbt_tmp"
  as (
    

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
        
    
md5(cast(coalesce(cast(worldbank_api_indicator_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_indicator_value as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_country_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_country_value as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_countryiso3code as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_date as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_value as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_unit as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_obs_status as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(worldbank_api_decimal as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as generated_id
    from flattened_columns

)

select *
from final
  );
  