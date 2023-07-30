
  
    

  create  table "worldbank_api_db"."public"."worldbank_api_metrics__dbt_tmp"
  as (
    

with filtered_data as (

    select 
        worldbank_api_country_value as country,
        worldbank_api_date as year,
        worldbank_api_value as gdp,
        lag(worldbank_api_date,1) over (
            PARTITION BY worldbank_api_country_value
		    ORDER BY worldbank_api_date ASC) as previous_year_gdb_date,
        lag(worldbank_api_value,1) over (
            PARTITION BY worldbank_api_country_value
		    ORDER BY worldbank_api_date ASC) as previous_year_gdb
    from worldbank_api_stg
    --where worldbank_api_date => 2000

),

calculated_gdb_metrics as (

    select
        country,
        year,
        gdp,
        previous_year_gdb_date,
        previous_year_gdb,
        1.0 * gdp / nullif(previous_year_gdb, 0) - 1 as gdp_growth,
        min(1.0 * gdp / nullif(previous_year_gdb, 0) - 1) over () as min_gdp_growth_since_2000,
        max(1.0 * gdp / nullif(previous_year_gdb, 0) - 1) over () as max_gdp_growth_since_2000
    from filtered_data
    GROUP BY 1,2,3,4,5,6
),

final as (

    select 
        country,
        year,
        gdp,
        round(cast(gdp_growth as numeric),3) as gdp_growth,
        round(cast(min_gdp_growth_since_2000 as numeric),3) as min_gdp_growth_since_2000,
        round(cast(max_gdp_growth_since_2000 as numeric),3) as max_gdp_growth_since_2000
    from calculated_gdb_metrics
)

select *
from final

where gdp is not null
  );
  