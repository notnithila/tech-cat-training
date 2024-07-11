# Activity 4.5 Solution

```sql
USE ROLE de;
USE WAREHOUSE COMPUTE_WH;

SHOW TABLES;
SHOW SCHEMAS;
SHOW STAGES;
show file formats;

CREATE OR REPLACE STAGE TECHCATALYST_DE.EXTERNAL_STAGE.TATWAN_STAGE 
    STORAGE_INTEGRATION = s3_int
    URL='s3://techcatalyst-public';



LIST @TECHCATALYST_DE.EXTERNAL_STAGE.TATWAN_STAGE;

USE SCHEMA TECHCATALYST_DE.EXTERNAL_STAGE;

LIST @TATWAN_STAGE;
LIST @TATWAN_STAGE PATTERN='.*csv.*';
LIST @TATWAN_STAGE PATTERN='.*json.*';

CREATE OR REPLACE FILE FORMAT tatwan_json_format
TYPE = 'JSON'
-- STRIP_OUTER_ARRAY = true;

CREATE OR REPLACE FILE FORMAT tatwa_csv_format
TYPE = 'CSV'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1;

CREATE OR REPLACE FILE FORMAT tatwan_parquet_format
TYPE = 'PARQUET';

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME NUMBER(38,0),
    TPEP_DROPOFF_DATETIME NUMBER(38,0),
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    RATECODEID NUMBER(38,0),
    STORE_AND_FWD_FLAG VARCHAR(16777216),
    PULOCATIONID NUMBER(38,0),
    DOLOCATIONID NUMBER(38,0),
    PAYMENT_TYPE NUMBER(38,0),
    FARE_AMOUNT FLOAT,
    EXTRA FLOAT,
    MTA_TAX FLOAT,
    TIP_AMOUNT FLOAT,
    TOLLS_AMOUNT FLOAT,
    IMPROVEMENT_SURCHARGE FLOAT,
    TOTAL_AMOUNT FLOAT,
    CONGESTION_SURCHARGE FLOAT,
    AIRPORT_FEE FLOAT
);

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME DATETIME,
    TPEP_DROPOFF_DATETIME DATETIME,
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    RATECODEID NUMBER(38,0),
    STORE_AND_FWD_FLAG VARCHAR(16777216),
    PULOCATIONID NUMBER(38,0),
    DOLOCATIONID NUMBER(38,0),
    PAYMENT_TYPE NUMBER(38,0),
    FARE_AMOUNT FLOAT,
    EXTRA FLOAT,
    MTA_TAX FLOAT,
    TIP_AMOUNT FLOAT,
    TOLLS_AMOUNT FLOAT,
    IMPROVEMENT_SURCHARGE FLOAT,
    TOTAL_AMOUNT FLOAT,
    CONGESTION_SURCHARGE FLOAT,
    AIRPORT_FEE FLOAT
);

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_PARQUET (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME NUMBER(38,0),
    TPEP_DROPOFF_DATETIME NUMBER(38,0),
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    RATECODEID NUMBER(38,0),
    STORE_AND_FWD_FLAG VARCHAR(16777216),
    PULOCATIONID NUMBER(38,0),
    DOLOCATIONID NUMBER(38,0),
    PAYMENT_TYPE NUMBER(38,0),
    FARE_AMOUNT FLOAT,
    EXTRA FLOAT,
    MTA_TAX FLOAT,
    TIP_AMOUNT FLOAT,
    TOLLS_AMOUNT FLOAT,
    IMPROVEMENT_SURCHARGE FLOAT,
    TOTAL_AMOUNT FLOAT,
    CONGESTION_SURCHARGE FLOAT,
    AIRPORT_FEE FLOAT
);


SELECT 
    t.$1:VendorID::NUMBER AS VendorID,
    TO_TIMESTAMP(t.$1:tpep_pickup_datetime::NUMBER, 6) AS tpep_pickup_datetime,
    TO_TIMESTAMP(t.$1:tpep_dropoff_datetime::STRING) AS tpep_dropoff_datetime,
    TIMEDIFF('minutes', tpep_pickup_datetime, tpep_dropoff_datetime ) as duration,
    t.$1:passenger_count::FLOAT AS passenger_count,
    t.$1:trip_distance::FLOAT AS trip_distance,
    t.$1:RatecodeID::FLOAT AS RatecodeID,
    t.$1:store_and_fwd_flag::STRING AS store_and_fwd_flag,
    t.$1:PULocationID::NUMBER AS PULocationID,
    t.$1:DOLocationID::NUMBER AS DOLocationID,
    t.$1:payment_type::NUMBER AS payment_type,
    t.$1:fare_amount::FLOAT AS fare_amount,
    t.$1:extra::FLOAT AS extra,
    t.$1:mta_tax::FLOAT AS mta_tax,
    t.$1:tip_amount::FLOAT AS tip_amount,
    t.$1:tolls_amount::FLOAT AS tolls_amount,
    t.$1:improvement_surcharge::FLOAT AS improvement_surcharge,
    t.$1:total_amount::FLOAT AS total_amount,
    t.$1:congestion_surcharge::FLOAT AS congestion_surcharge,
    t.$1:Airport_fee::FLOAT AS Airport_fee
FROM @TATWAN_STAGE/class/yellow_tripdata.parquet
    (FILE_FORMAT => 'tatwan_parquet_format') t;

COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_PARQUET
FROM @TATWAN_STAGE/class/yellow_tripdata.parquet
FILE_FORMAT = 'techcatalyst_de.external_stage.tatwan_parquet_format'
ON_ERROR = CONTINUE
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

SELECT * FROM TECHCATALYST_DE.TATWAN.YELLOW_TAXI_PARQUET LIMIT 10;


COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV
FROM @TATWAN_STAGE/class/yellow_tripdata.csv
FILE_FORMAT = 'techcatalyst_de.external_stage.tatwan_csv_format'
ON_ERROR = CONTINUE;

SELECT * FROM TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV LIMIT 10;

-- COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON
-- FROM @TATWAN_STAGE/class/yellow_tripdata.json
-- FILE_FORMAT = 'techcatalyst_de.external_stage.tatwan_json_format'
-- ON_ERROR = CONTINUE;

INSERT INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON
SELECT 
    f.value:VendorID::NUMBER AS VendorID,
    f.value:tpep_pickup_datetime::NUMBER AS tpep_pickup_datetime,
    f.value:tpep_dropoff_datetime::NUMBER AS tpep_dropoff_datetime,
    f.value:passenger_count::FLOAT AS passenger_count,
    f.value:trip_distance::FLOAT AS trip_distance,
    f.value:RatecodeID::FLOAT AS RatecodeID,
    f.value:store_and_fwd_flag::STRING AS store_and_fwd_flag,
    f.value:PULocationID::NUMBER AS PULocationID,
    f.value:DOLocationID::NUMBER AS DOLocationID,
    f.value:payment_type::NUMBER AS payment_type,
    f.value:fare_amount::FLOAT AS fare_amount,
    f.value:extra::FLOAT AS extra,
    f.value:mta_tax::FLOAT AS mta_tax,
    f.value:tip_amount::FLOAT AS tip_amount,
    f.value:tolls_amount::FLOAT AS tolls_amount,
    f.value:improvement_surcharge::FLOAT AS improvement_surcharge,
    f.value:total_amount::FLOAT AS total_amount,
    f.value:congestion_surcharge::FLOAT AS congestion_surcharge,
    f.value:Airport_fee::FLOAT AS Airport_fee
FROM 
    @TATWAN_STAGE/class/yellow_tripdata.json
    (FILE_FORMAT => 'techcatalyst_de.external_stage.tatwan_json_format')
, LATERAL FLATTEN(input => PARSE_JSON($1)) f;


CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_JSON (
    VENDORID NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    TOTAL_AMOUNT FLOAT
);

INSERT INTO TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_JSON
SELECT 
    f.value:VendorID::NUMBER AS VendorID,
    f.value:trip_distance::FLOAT AS trip_distance,
    f.value:total_amount::FLOAT AS total_amount
FROM 
    @TATWAN_STAGE/class/yellow_tripdata.json
    (FILE_FORMAT => 'techcatalyst_de.external_stage.tatwan_json_format')
, LATERAL FLATTEN(input => PARSE_JSON($1)) f;

SELECT * FROM TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_JSON LIMIT 100;

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_CSV (
    VENDORID NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    TOTAL_AMOUNT FLOAT
);

INSERT INTO TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_CSV
SELECT 
    $1::NUMBER AS VendorID,
    $5::FLOAT AS trip_distance,
    $17::FLOAT AS total_amount
FROM 
    @TATWAN_STAGE/class/yellow_tripdata.csv
    (FILE_FORMAT => 'techcatalyst_de.external_stage.tatwan_csv_format') ;

SELECT * FROM TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_CSV LIMIT 100;

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_PARQUET (
    VENDORID NUMBER(38,0),
    TRIP_DISTANCE FLOAT,
    TOTAL_AMOUNT FLOAT
);

INSERT INTO TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_PARQUET
SELECT 
    t.$1:VendorID::NUMBER AS VendorID,
    t.$1:trip_distance::FLOAT AS trip_distance,
    t.$1:total_amount::FLOAT AS total_amount
FROM @TATWAN_STAGE/class/yellow_tripdata.parquet
    (FILE_FORMAT => 'tatwan_parquet_format') t;

SELECT * FROM TECHCATALYST_DE.TATWAN.SIMPLE_TAXI_DATA_PARQUET LIMIT 100;


CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_JSON (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME TIMESTAMP,
    TPEP_DROPOFF_DATETIME TIMESTAMP,
  	TPEP_MONTH NUMBER,
    TPEP_YEAR NUMBER,
	  TPEP_IS_WEEKEND STRING,
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DURATION_MINUTES FLOAT,
    TOTAL_AMOUNT FLOAT
);

CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_CSV (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME TIMESTAMP,
    TPEP_DROPOFF_DATETIME TIMESTAMP,
  	TPEP_MONTH NUMBER,
    TPEP_YEAR NUMBER,
	  TPEP_IS_WEEKEND STRING,
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DURATION_MINUTES FLOAT,
    TOTAL_AMOUNT FLOAT
);


CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_PARQUET (
    VENDORID NUMBER(38,0),
    TPEP_PICKUP_DATETIME TIMESTAMP,
    TPEP_DROPOFF_DATETIME TIMESTAMP,
  	TPEP_MONTH NUMBER,
    TPEP_YEAR NUMBER,
	  TPEP_IS_WEEKEND STRING,
    PASSENGER_COUNT NUMBER(38,0),
    TRIP_DURATION_MINUTES FLOAT,
    TOTAL_AMOUNT FLOAT
);


INSERT INTO TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_JSON
SELECT 
    f.value:VendorID::NUMBER AS VendorID,
    TO_TIMESTAMP(f.value:tpep_pickup_datetime::STRING) AS tpep_pickup_datetime,
    TO_TIMESTAMP(f.value:tpep_dropoff_datetime::STRING) AS tpep_dropoff_datetime,
    MONTH(tpep_pickup_datetime) as tpep_month,
    YEAR(tpep_pickup_datetime) as tpep_year,
    CASE WHEN DAYNAME(tpep_pickup_datetime) in ('Sat', 'Sun') then 'WEEKEND' ELSE 'WEEKDAY' END as tpep_is_weekend,
    f.value:passenger_count::FLOAT AS passenger_count,
    datediff('minutes', tpep_pickup_datetime, tpep_dropoff_datetime) as trip_duration_minutes,
    (f.value:fare_amount::FLOAT +
     f.value:extra::FLOAT +
     f.value:mta_tax +
     f.value:Airport_fee::FLOAT +
     f.value:tolls_amount::FLOAT +
     f.value:tip_amount::FLOAT +
     f.value:congestion_surcharge::FLOAT +
     f.value:improvement_surcharge::FLOAT ) as total_amount
FROM 
    @TATWAN_STAGE/class/yellow_tripdata.json
    (FILE_FORMAT => 'techcatalyst_de.external_stage.tatwan_json_format')
, LATERAL FLATTEN(input => PARSE_JSON($1)) f;

SELECT * FROM TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_JSON LIMIT 100;

INSERT INTO TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_PARQUET
SELECT 
    t.$1:VendorID::NUMBER AS VendorID,
    TO_TIMESTAMP(t.$1:tpep_pickup_datetime::STRING) AS tpep_pickup_datetime,
    TO_TIMESTAMP(t.$1:tpep_dropoff_datetime::STRING) AS tpep_dropoff_datetime,
    MONTH(tpep_pickup_datetime) as tpep_month,
    YEAR(tpep_pickup_datetime) as tpep_year,
    CASE WHEN DAYNAME(tpep_pickup_datetime) in ('Sat', 'Sun') then 'WEEKEND' ELSE 'WEEKDAY' END as tpep_is_weekend,
    t.$1:passenger_count::FLOAT AS passenger_count,
    datediff('minutes', tpep_pickup_datetime, tpep_dropoff_datetime) as trip_duration_minutes,
    (t.$1:fare_amount::FLOAT +
     t.$1:extra::FLOAT +
     t.$1:mta_tax +
     t.$1:Airport_fee::FLOAT +
     t.$1:tolls_amount::FLOAT +
     t.$1:tip_amount::FLOAT +
     t.$1:congestion_surcharge::FLOAT +
     t.$1:improvement_surcharge::FLOAT ) as total_amount
FROM @TATWAN_STAGE/class/yellow_tripdata.parquet
    (FILE_FORMAT => 'tatwan_parquet_format') t;

SELECT * FROM TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_PARQUET LIMIT 100;


INSERT INTO TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_CSV
SELECT
    $1::NUMBER AS VendorID,
    TO_TIMESTAMP($2::STRING) AS tpep_pickup_datetime,
    TO_TIMESTAMP($3::STRING) AS tpep_dropoff_datetime,
    MONTH(tpep_pickup_datetime) as tpep_month,
    YEAR(tpep_pickup_datetime) as tpep_year,
    CASE WHEN DAYNAME(tpep_pickup_datetime) in ('Sat', 'Sun') then 'WEEKEND' ELSE 'WEEKDAY' END as tpep_is_weekend,
    $4::FLOAT AS passenger_count,
    datediff('minutes', tpep_pickup_datetime, tpep_dropoff_datetime) as trip_duration_minutes,
    ($11::FLOAT) + 
     ($12::FLOAT) +
     ($13::FLOAT) +
     -- ($20::FLOAT) +
     ($15::FLOAT) +
     ($14::FLOAT) +
     ($19::FLOAT) +
     ($16::FLOAT ) as total_amount
FROM 
    @TATWAN_STAGE/class/yellow_tripdata.csv
    (FILE_FORMAT => 'techcatalyst_de.external_stage.tatwan_csv_format') ;


SELECT * FROM TECHCATALYST_DE.TATWAN.SUMMARY_TAXI_DATA_CSV LIMIT 100;
```

