
  create view "worldbank_api_db"."public"."selected_rows__dbt_tmp" as (
    /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with 

data_since_2000 as (

    select *
    from worldbank_api
    --WHERE worldbank_api_date => 2000

),

selected_columns as (

    select
        worldbank_api_indicator as gdp,
        worldbank_api_date as worldbank_api_date
    from data_since_2000
)

select *
from selected_columns

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
  );