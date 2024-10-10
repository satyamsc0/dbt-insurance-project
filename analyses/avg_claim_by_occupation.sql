-- This query calculates the average claims based on a customer's occupation.
select occupation, round(avg(claimhistory)) as avg_claims
from {{ ref("cust_policy") }}
group by occupation
order by avg_claims desc
