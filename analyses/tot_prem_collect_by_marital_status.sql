-- This query gives insights into how much premium is collected based on the marital
-- status of customers.
select maritalstatus, sum(premiumamount) as total_premium_collected
from {{ ref("cust_policy") }}
group by maritalstatus
order by total_premium_collected desc
