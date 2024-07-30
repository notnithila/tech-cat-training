**DRAFT MODE**

### Data Engineering Capstone Project Instructions

#### Project Overview

In this capstone project, you will work with High Volume For-Hire Vehicle (HVFHV) data, Yellow Taxi Data, and Green Taxi Data. Your objective is to extract this data from AWS S3 (Raw), perform necessary transformations, and load it into a Conformed S3 bucket, and finally into a Transformed S3 bucket before importing it into Snowflake for final analysis using Tableau or Thoughtspot. You will leverage various AWS services and tools, including AWS Lambda, Python/Jupyter Notebook, Databricks/PySpark, AWS Glue Studio or AWS Glue Databrew, AWS Glue Crawler and Catalog, AWS Athena, Snowflake, and Tableau.

Before beginning the project, you must select a specific use-case to focus on. You will assume the role of a consultant, using a data-driven approach to highlight your findings and provide actionable recommendations where appropriate. Your task is to employ your Data Engineering skills to transform the data from its RAW state into a format that facilitates in-depth analysis.

You will work with the provided datasets, which include data dictionary files and additional lookup tables. Additionally, you are encouraged to incorporate other data sources to enrich the existing data, thereby enhancing your analysis and providing deeper insights. This project is designed to be case study-driven, allowing you to explore real-world scenarios and solve tangible problems using data engineering techniques.

#### Data Description

- **Yellow Taxi Data**: 9 files (September 2023 to May 2024)
- **Green Taxi Data**: 9 files (September 2023 to May 2024)
- **High Volume For-Hire Vehicle (HVFHV) Data**: 5 large files (January 2024 to May 2024)

#### Requirements

1. **Data Extraction and Loading to S3 Raw**
   - Extract and examine all provided datasets from the S3 Raw  bucket in their respective folders.
   
     - **Yellow Taxi Data**: `s3://capstone-techcatalyst-raw/yellow_taxi/`
     - **Green Taxi Data**: `s3://capstone-techcatalyst-raw/green_taxi/`
     - **HVFHV Data**: `s3://capstone-techcatalyst-raw/hvfhv/`
   
2. **Data Transformation and Loading to S3 Conformed** 
   - Combine Yellow and Green Taxi datasets.
   
     - Remove duplicate records.
     - Distinguish between Yellow and Green Taxi data by adding a `Taxi_Type` column.
     - Add additional date features such as: Month, Year, Weekday/Weekend, Day of Week Name.
     - Check for data quality issues 
   
   - For HVFHV data:
   
     - Combine the datasets.
     - Add additional date features similar to Yellow and Green Taxi data.
     - Check for data quality issues
   
   - Store the transformed data into the S3 Conformed bucket.
   
     - Yellow/Green Taxi Data: Partitioned by Year/Month/Taxi_Type (Yellow/Green)
   
       - Example: `s3://capstone-techcatalyst-conformed/<YOURNAME>/taxi_data/year=2024/month=05/taxi_type=yellow/`
     
     - HVFHV Data: Partitioned by Year/Month/Day
   
       - Example: `s3://capstone-techcatalyst-conformed/<YOURNAME>/hvfhv_data/year=2024/month=05/day=01/`
   
3. **Additional Transformations**
   - Calculate Trip Duration.
   - Calculate Trip Distance % of Total Trip Distance for the day.
   - Calculate Trip Duration % of Total Time Spent Active for the day.
   - Any additional transformation to support the use-case selected 
   
4. **Data Loading to S3 Transformed**
   - Perform all final transformations and load the data into the S3 Transformed bucket.
   
     - Ensure the data is clean, partitioned correctly, and optimized for loading into Snowflake.
   
5. **Data Loading to Snowflake**
   - Create Snowflake stages and transient tables for the files you need to load from S3 into Snowflake.
   - Load data from `S3 Transformed` bucket into Snowflake.
   - Create Snowflake views for analysis.
   - Include additional lookup tables based on the `Data Dictionary` files provided, for example:
     - RateCodeId
     - Payment_Type
     - Store_and_fwd_flag
     - Trip_type
     - VendorID
   - Perform necessary joins and **add meaning to the data** utilizing the lookup files/tables.
   
6. **Final Analysis Using Tableau or ThoughtSpot**
   - Connect Tableau/ThoughtSpot to Snowflake.
   - Perform analysis and create visualizations based on the transformed data.
   - Create meaningful dashboards to present your findings.

#### Tools and Technologies you can use

- **AWS S3**: For storing raw, conformed, and transformed data.
- **AWS Lambda**: For serverless data processing.
- **Python/Jupyter Notebook**: For data analysis and transformation.
- **Databricks/EMR PySpark**: For distributed data processing.
- **AWS Glue Studio or AWS Glue Databrew**: For ETL operations.
- **AWS Glue Crawler and Catalog**: For metadata management.
- **AWS Athena**: For querying data in S3.
- **Snowflake**: For data warehousing and advanced analytics.
- **Tableau/ThoughtSpot**: For data visualization and reporting.

#### Instructions

1. **Data Extraction and Loading to S3 Raw**
   - Upload all datasets to the specified `S3 Raw` bucket locations.
2. **Data Transformation and Loading to S3 Conformed**
   - Use AWS Lambda, Python/Jupyter Notebook, or Databricks/EMR PySpark to clean, deduplicate, and transform the data.
   - Create the necessary additional date features.
   - Store the transformed data in the `S3 Conformed` bucket with the correct partitioning.
3. **Additional Transformations**
   - Calculate the required metrics (for example Trip Duration, Trip Distance %, Trip Duration %).
4. **Data Loading to S3 Transformed**
   - Perform final transformations.
   - Load the clean and partitioned data into the `S3 Transformed` bucket.
5. **Data Loading to Snowflake**
   - Create stages and transient tables in Snowflake.
   - Load the data from `S3 Transformed` into Snowflake.
   - Use lookup files to enrich the data.
6.  **Data Analysis and Visualization**
   - Data Exploration in Snowflake:
     - Use SQL queries to explore the data and identify patterns.
     - Remember some advanced analysis techniques such as Window Functions: Ranking, Lag, Moving Windows ..etc.
7. **Final Analysis Using Tableau**
   - Connect Tableau to Snowflake.
   - Create dashboards to visualize and analyze the data.

#### Additional Considerations

- Ensure data quality and consistency throughout the ETL process.
- Optimize transformations for performance and scalability. You will need to provide performance statistics (e.g. ETL processing time …etc)
- Document your process and findings thoroughly. This include:
  - Reference Architecture Diagrams 
  - Summary statistics on the data, ETL process ..etc 

- Consider any additional useful transformations or features that can add value to your analysis. 
  - Including Data Enrichment 
- <u>Utilization of **external data** such as weather data, traffic data, tourist data, social media posts ..etc</u>


## Deliverables 

* Your code in a GitHub Repo with a proper README.md file 
* A 15-20 minute presentation allowing for 5-minute Q&A 
* Your presentation will showcase your data storytelling capability utilizing data visualization, reference architecture diagrams, and any supporting visuals 

Good luck with your capstone project!

----

