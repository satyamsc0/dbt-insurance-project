-- This query analyzes the relationship between claim amounts and income levels.
select
    incomelevel,
    sum(claimhistory) as total_claim_amount,
    avg(claimhistory) as avg_claim_amount
from {{ ref("cust_policy") }}
group by incomelevel
order by total_claim_amount desc
