# Insurance Data Analytics with dbt and Snowflake

## Overview

This project performs **Insurance Data Analytics** using **dbt** (Data Build Tool) and **Snowflake** as the underlying data warehouse. The primary goal is to perform data profiling, create aggregated data models and conduct exploratory data analysis (EDA) on insurance claims and policy data stored in two Snowflake tables: `DATA_SYNTHETIC` and `INSURANCE_DATA`. 

The project focuses on:
- Data profiling of customer policies and claims.
- Creating fact and dimension tables for deeper insights.
- Performing EDA to reveal key metrics and trends within the insurance domain.
  
## Project Structure

```bash
├── models/
│   ├── raw/
│   │   ├── cust_policy.sql         # Raw data model for the DATA_SYNTHETIC table
│   │   ├── insurance_data.sql      # Raw data model for the INSURANCE_DATA table
│   │   ├── schema.yml              # Schema file for documenting models, columns and tests
│   │   ├── source_config.yml       # Schema file for documenting sources
│   ├── marts/
│   │   ├── facts/
│   │   │   ├── customer_claims__facts.sql  # Aggregated customer claims data
│   │   │   ├── policy_summary__facts.sql   # Summary of policy types and premiums
│   │   │   ├── income_claims__facts.sql    # Claims data aggregated by income level
│   │   ├── dimensions/
│   │   │   ├── customer_demographics_dim.sql  # Customer demographics information
│   │   │   ├── insurance_products_dim.sql     # Information about insurance products owned
├── analyses/
│   ├── exploratory_analysis.sql        # Analytical queries for EDA
└── README.md                           # Project README file
```

## Data Sources

This project relies on two tables in Snowflake:

- **DATA_SYNTHETIC:** This table contains comprehensive customer policy and claims data, including customer demographics, behavioral data, insurance products owned, and claims history.
- **INSURANCE_DATA:** This table focuses on the financial aspects of insurance, including claim amounts, income, and occupation.

### Sample Schema

| Column Name                | Description                               |
|----------------------------|-------------------------------------------|
| CUSTOMERID                 | Unique identifier for each customer       |
| AGE                        | Age of the customer                       |
| GENDER                     | Gender of the customer                    |
| MARITALSTATUS              | Marital status of the customer            |
| INCOMELEVEL                | Income level of the customer              |
| CLAIMHISTORY               | Number of claims made by the customer     |
| PREMIUMAMOUNT              | Premium paid by the customer              |
| INSURANCEPRODUCTSOWNED      | Types of insurance products owned        |

## Models

### 1. Fact Tables
- **customer_claims_facts.sql**: Aggregates claims data by customer, providing metrics such as total claim amount, total number of claims, and average premiums paid.
- **policy_summary_facts.sql**: Summarizes policy details, calculating total coverage, premiums, and deductibles by policy type.
- **income_claims_facts.sql**: Aggregates claims data based on the income level of customers, providing insights into how income impacts claim behavior.

### 2. Dimension Tables
- **customer_demographics_dim.sql**: Provides demographic information about the customers, such as age, gender, marital status, occupation, and segmentation group.
- **insurance_products_dim.sql**: Groups information about the insurance products owned by each customer and their communication preferences.

### 3. Analytical Queries
- **exploratory_analysis.sql**: Contains SQL queries for exploratory data analysis (EDA), including calculations for average claim amounts by occupation, total premiums collected by marital status, and the relationship between income levels and claims.

## How to Run the Project

### Prerequisites
- **dbt Cloud** or **dbt Core** installed locally.
- A **Snowflake** account with credentials to access the `DATA_SYNTHETIC` and `INSURANCE_DATA` tables.
- The dbt project should be already configured with a connection to your Snowflake instance.

### Steps to Run

1. **Install dbt** (if you haven't already):
   ```bash
   pip install dbt-snowflake
   ```

2. **Configure dbt**:
   Update the `profiles.yml` file with your Snowflake credentials.
   ```yaml
   my_project:
     target: dev
     outputs:
       dev:
         type: snowflake
         account: <your_snowflake_account>
         user: <your_username>
         password: <your_password>
         role: <your_role>
         database: <your_database>
         schema: <your_schema>
         warehouse: <your_warehouse>
   ```

3. **Run the dbt models**:
   To create and update the models in Snowflake, run:
   ```bash
   dbt run
   ```

4. **Run tests**:
   To ensure data quality with predefined tests, run:
   ```bash
   dbt test
   ```

5. **Perform exploratory data analysis**:
   You can run analytical queries directly from dbt by executing:
   ```bash
   dbt run-operation run_eda_queries
   ```

### Documentation and Lineage

To generate and view project documentation, including the lineage of models and dependencies:
```bash
dbt docs generate
dbt docs serve
```

This will open a local web server to explore the project documentation.

## Data Quality Testing

In the `schema.yml` file, data quality tests are defined to ensure the integrity of critical columns such as `CUSTOMERID`, `AGE`, `GENDER`, and `CLAIMHISTORY`. These tests check for:
- **Uniqueness**: Ensuring unique values in key fields like `CUSTOMERID`.
- **Non-null constraints**: Ensuring that critical fields are not empty.
- **Data consistency**: Checking if values like claim amounts or premiums fall within expected ranges.

## Future Enhancements

Some future directions to enhance this project:
- Create more advanced analytics models for fraud detection or risk profiling.
- Implement machine learning models using the aggregated fact tables to predict customer churn, high-risk customers, or likely claim amounts.
- Use dbt macros to automate custom data transformations and validations.

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## License

This project is open-source and free to use for educational or personal projects. However, the data used is synthetic and should not be used in real-world applications without modification.

