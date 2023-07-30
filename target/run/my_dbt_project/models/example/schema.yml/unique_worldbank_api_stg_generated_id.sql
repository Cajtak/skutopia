select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    generated_id as unique_field,
    count(*) as n_records

from "worldbank_api_db"."public"."worldbank_api_stg"
where generated_id is not null
group by generated_id
having count(*) > 1



      
    ) dbt_internal_test