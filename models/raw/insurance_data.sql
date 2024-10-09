with
    insurance_data as (
        select
            age::int as age,
            gender,
            income::number(38, 0) as income,
            marital_status,
            education,
            occupation,
            claim_amount::number(38, 0) as claim_amount
        from {{ source("raw_insurance", "insurance_data") }}

    )

select *
from insurance_data
