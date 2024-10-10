with
    customer_demographics as (
        select
            customerid,
            age,
            gender,
            maritalstatus,
            occupation,
            educationlevel,
            location,
            segmentationgroup
        from {{ ref("cust_policy") }}
    )
select *
from customer_demographics
