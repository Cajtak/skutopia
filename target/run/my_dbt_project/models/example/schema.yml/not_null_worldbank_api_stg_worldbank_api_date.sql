select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select worldbank_api_date
from "worldbank_api_db"."public"."worldbank_api_stg"
where worldbank_api_date is null



      
    ) dbt_internal_test