# In Class Demo

```sql
use role de;
use warehouse COMPUTE_WH;


show tables;
show schemas;
show stages;
show file formats;



CREATE OR REPLACE STAGE TECHCATALYST_DE.EXTERNAL_STAGE.AWS_STAGE
        STORAGE_INTEGRATION = s3_int
        URL='s3://techcatalyst-public';

LIST @TECHCATALYST_DE.EXTERNAL_STAGE.AWS_STAGE;

LIST @AWS_STAGE;

LIST @AWS_STAGE 
    PATTERN='.*csv.*';

LIST @AWS_STAGE 
    PATTERN='.*json.*';

CREATE OR REPLACE FILE FORMAT json_format
TYPE = 'JSON';

CREATE OR REPLACE FILE FORMAT csv_format
TYPE = 'CSV'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1;

CREATE OR REPLACE FILE FORMAT parquet_format
TYPE = 'PARQUET';


SELECT 
    f.value:VendorID::NUMBER AS VendorID,
    TO_TIMESTAMP(f.value:tpep_pickup_datetime) AS tpep_pickup_datetime,
    TO_TIMESTAMP(f.value:tpep_dropoff_datetime) AS tpep_dropoff_datetime,
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
    @AWS_STAGE/class/yellow_tripdata.json
    (FILE_FORMAT => 'json_format')
, LATERAL FLATTEN(input => PARSE_JSON($1)) f
LIMIT 100;

SELECT $1
FROM @AWS_STAGE/class/yellow_tripdata.json
(FILE_FORMAT => 'json_format');


-- SELECT $1, $2, $10
-- FROM @AWS_STAGE/class/yellow_tripdata.csv
-- (FILE_FORMAT => 'csv_format');

create or replace TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON (
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

COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON
FROM @AWS_STAGE/class/yellow_tripdata.json
FILE_FORMAT = 'json_format'
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

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
    @AWS_STAGE/class/yellow_tripdata.json
    (FILE_FORMAT => 'json_format')
, LATERAL FLATTEN(input => PARSE_JSON($1)) f;

SELECT * FROM TECHCATALYST_DE.TATWAN.YELLOW_TAXI_JSON;

create or replace TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV (
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

COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV
FROM @AWS_STAGE/class/yellow_tripdata.csv
FILE_FORMAT = 'csv_format'
ON_ERROR = CONTINUE;




SELECT * FROM TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV;


create or replace TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV (
	VENDORID NUMBER(38,0),
	TPEP_PICKUP_DATETIME DATETIME,
	TPEP_DROPOFF_DATETIME DATETIME,
    TPEP_MONTH NUMBER,
    TPEP_YEAR NUMBER,
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

INSERT INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV
SELECT 
    $1::NUMBER AS VendorID,
    $2::DATETIME AS tpep_pickup_datetime,
    $3::DATETIME AS tpep_dropoff_datetime,
    MONTH(tpep_pickup_datetime) as TPEP_MONTH,
    YEAR(tpep_pickup_datetime) as TPEP_year,
    $4::NUMBER AS passenger_count,
    $5::FLOAT AS trip_distance,
    $6::NUMBER AS RatecodeID,
    $7::STRING AS store_and_fwd_flag,
    $8::NUMBER AS PULocationID,
    $9::NUMBER AS DOLocationID,
    $10::NUMBER AS payment_type,
    $11::FLOAT AS fare_amount,
    $12::FLOAT AS extra,
    $13::FLOAT AS mta_tax,
    $14::FLOAT AS tip_amount,
    $15::FLOAT AS tolls_amount,
    $16::FLOAT AS improvement_surcharge,
    $17::FLOAT AS total_amount,
    $18::FLOAT AS congestion_surcharge,
    $19::FLOAT AS Airport_fee
FROM 
    @AWS_STAGE/class/yellow_tripdata.csv
    (FILE_FORMAT => 'csv_format') ;

SELECT 
    t.$1:VendorID::NUMBER AS VendorID,
    TO_TIMESTAMP(t.$1:tpep_pickup_datetime) AS tpep_pickup_datetime,
    TO_TIMESTAMP(t.$1:tpep_dropoff_datetime) AS tpep_dropoff_datetime,
    t.$1:passenger_count::NUMBER AS passenger_count,
    t.$1:trip_distance::FLOAT AS trip_distance,
    t.$1:RatecodeID::NUMBER AS RatecodeID,
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
FROM 
    @AWS_STAGE/class/yellow_tripdata.csv
    (FILE_FORMAT => 'csv_format') t;

SELECT * FROM TECHCATALYST_DE.TATWAN.YELLOW_TAXI_CSV;

create or replace TRANSIENT TABLE TECHCATALYST_DE.TATWAN.YELLOW_TAXI_PARQUET (
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

COPY INTO TECHCATALYST_DE.TATWAN.YELLOW_TAXI_PARQUET
FROM @AWS_STAGE/class/yellow_tripdata.parquet
FILE_FORMAT = 'parquet_format'
ON_ERROR = CONTINUE
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

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
FROM @AWS_STAGE/class/yellow_tripdata.parquet
    (FILE_FORMAT => 'parquet_format') t;


    LIST @AWS_STAGE;

    SELECT *
FROM @TECHCATALYST_DE.EXTERNAL_STAGE.AWS_STAGE/aapl.parquet
(FILE_FORMAT => 'parquet_format')
LIMIT 10;

SELECT $1, $2
FROM @TECHCATALYST_DE.EXTERNAL_STAGE.AWS_STAGE/goog.csv
(FILE_FORMAT => 'csv_format')
LIMIT 10;

SELECT value
FROM @TECHCATALYST_DE.EXTERNAL_STAGE.AWS_STAGE/ge.json
(FILE_FORMAT => 'json_format'),
 LATERAL FLATTEN(input => PARSE_JSON($1))
LIMIT 10;

```

