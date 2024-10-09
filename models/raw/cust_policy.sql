with
    cust_policy as (
        select
            customerid,
            age::int as age,
            gender,
            maritalstatus,
            occupation,
            incomelevel,
            educationlevel,
            geographicinformation,
            location,
            behavioraldata,
            to_date(
                replace((purchasehistory), '/', '-'), 'mm-dd-yyyy'
            ) as purchasehistory,
            to_date(
                replace((policystartdate), '/', '-'), 'mm-dd-yyyy'
            ) as policystartdate,
            to_date(
                replace((policyrenewaldate), '/', '-'), 'mm-dd-yyyy'
            ) as policyrenewaldate,
            claimhistory,
            interactionswithcustomerservice,
            insuranceproductsowned,
            coverageamount,
            premiumamount,
            deductible,
            policytype,
            customerpreferences,
            preferredcommunicationchannel,
            preferredcontacttime,
            preferredlanguage,
            riskprofile,
            previousclaimshistory,
            creditscore,
            drivingrecord,
            lifeevents,
            segmentationgroup
        from {{ source("raw_insurance", "data_synthetic") }}

    )

select *
from cust_policy
