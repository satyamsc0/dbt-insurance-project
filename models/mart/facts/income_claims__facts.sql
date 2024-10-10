with
    income_claims as (
        select
            incomelevel,
            count(claimhistory) as total_claims,
            round(avg(premiumamount), 2) as avg_premium,
            sum(premiumamount) as total_premium
        from {{ ref("cust_policy") }}
        group by incomelevel
    )
select *
from income_claims
