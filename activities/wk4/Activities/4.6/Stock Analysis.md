# Stock Analysis

**Objective**: Inspect different file formats in an S3 folder, create appropriate schemas, combine the files into one `STOCKS`table, and perform stock data analysis using SQL.

### Primary Tasks

- **Inspection**: Inspect the structure of different file formats.
- **Schema Creation**: Create appropriate table schemas for each file.
- **Data Loading**: Use `COPY INTO` to load data into Snowflake.
- **Data Combination**: Combine data from different tables into one `STOCKS` table.
- **Data Analysis**: Use SQL for stock data analysis, including calculations and window functions.

### Prerequisites

Access the S3 bucket with the necessary data files (`goog.csv`, `aapl.parquet`, and `ge.json`).

### Steps

#### Step 1: Setup Snowflake Environment

1. **Switch to the appropriate role and warehouse:**

   ```sql
   USE ROLE de;
   USE WAREHOUSE COMPUTE_WH;
   ```

2. **Create an external stage pointing to your S3 bucket:**

   ```sql
   CREATE OR REPLACE STAGE TECHCATALYST_DE.EXTERNAL_STAGE.<YOURINITIAL_STAGE>
       STORAGE_INTEGRATION = s3_int
       URL='s3://techcatalyst-public/stocks';
   ```

3. **List files in the stage to confirm availability:**

   ```sql
   
   LIST @TECHCATALYST_DE.EXTERNAL_STAGE.<YOURINITIAL_STAGE>;
   ```

#### Step 2: Inspect the Files

> **NOTE**
>
> You can use the same file formats you created in the previous activity or replace/re-create them if you wish
>
> ```sql
> CREATE OR REPLACE FILE FORMAT <YOURINITIAL>_json_format
> TYPE = 'JSON';
> 
> CREATE OR REPLACE FILE FORMAT <YOURINITIAL>_csv_format
> TYPE = 'CSV'
> FIELD_OPTIONALLY_ENCLOSED_BY = '"'
> SKIP_HEADER = 1;
> 
> CREATE OR REPLACE FILE FORMAT <YOURINITIAL>_parquet_format
> TYPE = 'PARQUET';
> ```
>
> 

**Challenge**: Inspect the structure of the files to determine the schema.

1. **Inspect `goog.csv`:**

   ```sql
   
   SELECT 
   FROM @TECHCATALYST_DE.EXTERNAL_STAGE.<YOURINITIAL_STAGE>/goog.csv
   
   LIMIT 10;
   ```

2. **Inspect `aapl.parquet`:**

   ```sql
   
   SELECT  
   FROM @TECHCATALYST_DE.EXTERNAL_STAGE.<YOURINITIAL_STAGE>/aapl.parquet
   
   LIMIT 10;
   ```

3. **Inspect `ge.json`:**

   ```sql
   
   SELECT 
   FROM @TECHCATALYST_DE.EXTERNAL_STAGE.<YOURINITIAL_STAGE>/ge.json
   
   LIMIT 10;
   ```

#### Step 3: Create Transient Tables

**Challenge**: Based on your inspection, create transient tables with the appropriate schema.

1. **Create a table for `stocks`:**

   1. HINT: Make sure you have a column called `STOCK_NAME` to identify which stock you are working with

   ```sql
   
   CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.<YOURSCHEMA>.STOCKS (
     
   );
   ```

#### Step 4: Load Data from STAGE into the STOCKS table  (Combine Data into One `STOCKS` Table)

1. **Load data from `goog.csv`:**

   ```sql
   
   ```

2. **Load data from `aapl.parquet`:**

   ```sql
   
   ```

3. **Load data from `ge.json`:**

   ```sql
   
   ```



#### Step 5 : Perform Stock Data Analysis using SQL

**Challenge**: Use your SQL skills to analyze the combined stock data. Perform the following analyses:

1. **Challenge 1: Calculate the Daily Percentage Change in Closing Prices for Each Stock**

   Calculate the daily percentage change in the closing price for each stock. The percentage change is calculated as: ` ((CurrentClose−PreviousClose)/PreviousClose)∗100`

   HINT: 

   * Use the `LAG` window function to get the previous day's closing price [TUTORIAL HERE](https://www.datacamp.com/tutorial/sql-lag#).

     Calculate the percentage change using the current and previous closing prices.

   ```sql
   
   ```

2. **Calculate the moving average of the closing price for the last 7 days for each stock:**

   Calculate the moving average of the closing price over the last 7 days for each stock. The moving average smooths out daily price fluctuations.

   HINT:

   * Use the `AVG` window function to calculate the average closing price over a 7-day window.
   * You will need to use ROWS BETWEEN  

   ```sql
   
   ```

3. **Identify the date with the highest trading volume for each stock:**

   Identify the date with the highest trading volume for each stock. This helps in finding the day with the most trading activity.

   HINT:

   * Use the `ROW_NUMBER` window function to rank the rows based on trading volume.

     Filter to get the top-ranked row (highest volume) for each stock.

   ```sql
   
   ```

### 