# In Class Demo

```sql
use role de;
use warehouse compute_wh;

use schema techcatalyst_de.external_stage;


CREATE OR REPLACE FILE FORMAT tatwan_json_strip_format
TYPE = 'JSON'
STRIP_OUTER_ARRAY = true;

list @tatwan_stage;



SELECT *
FROM TABLE(
  INFER_SCHEMA(
    LOCATION=>'@TAGTWAN_AWS_STAGE/class/yellow_tripdata.parquet',
    FILE_FORMAT=>'tatwan_parquet_format'
  )
);


SELECT *
FROM TABLE(
  INFER_SCHEMA(
    LOCATION=>'@TAGTWAN_AWS_STAGE/class/yellow_tripdata.csv',
    FILE_FORMAT=>'tatwan_csv_format'
  )
);


SELECT *
FROM TABLE(
  INFER_SCHEMA(
    LOCATION=>'@TAGTWAN_AWS_STAGE/class/yellow_tripdata.json',
    FILE_FORMAT=>'tatwan_json_strip_format'
  )
);

CREATE OR REPLACE EXTERNAL TABLE TECHCATALYST_DE.tatwan.ext_table_parquet
  USING TEMPLATE (
    SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
    FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@TAGTWAN_AWS_STAGE/class',
        FILE_FORMAT=>'techcatalyst_de.external_stage.tatwan_parquet_format'
      )
    )
  )
  LOCATION=@TAGTWAN_AWS_STAGE/class/
  FILE_FORMAT=(format_name = 'techcatalyst_de.external_stage.tatwan_parquet_format')
  PATTERN = '.*yellow_tripdata.parquet'
  AUTO_REFRESH=false;

  SELECT * FROM TECHCATALYST_DE.tatwan.ext_table_parquet limit 100;


  CREATE OR REPLACE EXTERNAL TABLE TECHCATALYST_DE.tatwan.ext_table_json
  USING TEMPLATE (
    SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
    FROM TABLE(
        INFER_SCHEMA(
    LOCATION=>'@TAGTWAN_AWS_STAGE/class/yellow_tripdata.json',
    FILE_FORMAT=>'tatwan_json_strip_format'
            )
        )
  )
  LOCATION=@TAGTWAN_AWS_STAGE/class/
  FILE_FORMAT=(format_name = 'techcatalyst_de.external_stage.tatwan_json_strip_format')
  PATTERN = '.*yellow_tripdata.json'
  AUTO_REFRESH=false;

  SELECT * FROM TECHCATALYST_DE.tatwan.ext_table_json;



  CREATE OR REPLACE EXTERNAL TABLE TECHCATALYST_DE.tatwan.ext_table_csv
  USING TEMPLATE (
    SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
    FROM TABLE(
        INFER_SCHEMA(
    LOCATION=>'@TAGTWAN_AWS_STAGE/class/yellow_tripdata.csv',
    FILE_FORMAT=>'tatwan_csv_format'
  )
    )
  )
  LOCATION=@TAGTWAN_AWS_STAGE/class/
  FILE_FORMAT=(format_name = 'techcatalyst_de.external_stage.tatwan_csv_format')
  PATTERN = '.*yellow_tripdata.csv'
  AUTO_REFRESH=false;

 SELECT * FROM TECHCATALYST_DE.tatwan.ext_table_csv;




```

