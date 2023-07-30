
  create view "worldbank_api_db"."public"."my_first_dbt_model copy__dbt_tmp" as (
    /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with selected_rows as (

    select *
    from worldbank_api
    limit 10

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
  );