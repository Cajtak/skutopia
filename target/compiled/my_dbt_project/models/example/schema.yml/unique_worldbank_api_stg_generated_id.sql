
    
    

select
    generated_id as unique_field,
    count(*) as n_records

from "worldbank_api_db"."public"."worldbank_api_stg"
where generated_id is not null
group by generated_id
having count(*) > 1


