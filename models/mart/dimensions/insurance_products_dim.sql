with
    insurance_products as (
        select
            customerid,
            insuranceproductsowned,
            policytype,
            preferredcommunicationchannel
        from {{ ref("cust_policy") }}
    )
select *
from insurance_products
