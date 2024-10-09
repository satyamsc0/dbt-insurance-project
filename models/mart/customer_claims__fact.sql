with
    customer_claims as (
        select
            customerid,
            count(claimhistory) as total_claims,
            sum(claimhistory) as total_claim_amount,
            round(avg(premiumamount), 2) as avg_premium,
            sum(premiumamount) as total_premium
        from {{ ref("cust_policy") }}
        group by customerid
    )
select *
from customer_claims
