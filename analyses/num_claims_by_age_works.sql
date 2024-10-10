-- This query breaks down the number of claims made by different age groups.
with
    age_groups as (
        select
            case
                when age < 25
                then 'Under 25'
                when age between 25 and 40
                then '25-40'
                when age between 40 and 60
                then '40-60'
                else '60+'
            end as age_group,
            count(claimhistory) as total_claims
        from {{ ref("cust_policy") }}
        group by age_group
    )
select *
from age_groups
order by total_claims desc
