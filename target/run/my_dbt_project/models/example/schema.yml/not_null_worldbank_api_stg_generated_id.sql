select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select generated_id
from "worldbank_api_db"."public"."worldbank_api_stg"
where generated_id is null



      
    ) dbt_internal_test