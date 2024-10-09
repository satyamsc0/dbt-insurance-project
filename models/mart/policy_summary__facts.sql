with
    policy_summary as (
        select
            policytype,
            count(policytype) as total_policies,
            sum(coverageamount) as total_coverage,
            sum(premiumamount) as total_premiums,
            round(avg(premiumamount), 2) as avg_premium,
            round(avg(deductible), 2) as avg_deductible
        from {{ ref("cust_policy") }}
        group by policytype
    )
select *
from policy_summary