# SQL Examples 

Remember you can always switch from one schema to another using the `USE SCHEMA` clause

```sql
USE SCHEMA INSURANCE.CLAIMS;
```

Alternatively, you can ensure reproducibility by using full TABLE name which consists of: Database Name > Schema Name > Table Name as in `HCBDA.CLAIMS.POLICYHOLDER`

```sql
SELECT PERSON_ID, FIRST_NAME, LAST_NAME
FROM HCBDA.CLAIMS.POLICYHOLDER
```



## Using SQL for quick analysis

Example of a summary analysis utilizing `GROUP BY`, Aggregate Functions, and Window Functions using the `OVER` and `PARTITION BY` clauses.

```sql
select 
year(accident_date) as year
,g.gender_marital_status as gender
,datediff('year', birthdate, current_date()) as age
,count(a.accident_id) as count
,sum(count(a.accident_id)) over () as total_count
,sum(count(a.accident_id)) over (partition by gender) as count_gender
,sum(count(a.accident_id)) over (partition by age) as count_age
,sum(count(a.accident_id)) over (partition by gender, age) as count_gender_age
,sum(count(a.accident_id)) over (partition by year) as count_year
,sum(count(a.accident_id)) over (partition by age, year) as count_age_year
,sum(count(a.accident_id)) over (partition by gender, year) as count_gender_year
,sum(count(a.accident_id)) over (partition by gender, age, year) as count_age_gender_year
,sum(sum(a.estimated_cost)) over () total_estimates
,sum(sum(a.actual_repair_cost)) over () as total_cost
,sum(sum(a.actual_repair_cost)) over (partition by age) as cost_age
,sum(sum(a.actual_repair_cost)) over (partition by gender) as cost_gender
,sum(sum(a.actual_repair_cost)) over (partition by age, gender) as cost_age_gender
,sum(sum(a.actual_repair_cost)) over (partition by year) as cost_year
,sum(sum(a.actual_repair_cost)) over (partition by age, year) as cost_age_year
,sum(sum(a.actual_repair_cost)) over (partition by gender, year) as cost_gender_year
,sum(sum(a.actual_repair_cost)) over (partition by age, gender, year) as cost_age_gender_year
from policyholder as p
join accidents as a on p.policyholder_id = a.policyholder_id
join gender_marital_status as g on p.gender_marital_status = g.gender_marital_status_code
group by year, gender, age
order by year, gender, age
```



## Simple ETL Framework 

### Create a `TABLE` by defining a table schema/structure

```sql
-- Recreate or create a table

create or replace TABLE INSURANCE.CLAIMS.ACCIDENTS (
	ACCIDENT_ID NUMBER(38,0),
	POLICYHOLDER_ID NUMBER(38,0),
	VEHICLE_ID NUMBER(38,0),
	ACCIDENT_TYPE NUMBER(38,0),
	ACCIDENT_DATE DATE,
	ESTIMATED_COST FLOAT,
	ACTUAL_REPAIR_COST FLOAT,
	AT_FAULT BOOLEAN,
	DUI BOOLEAN
);

```

### Create a `TABLE` using a `SELECT` statement 

```sql
create or replace TABLE INSURANCE.CLAIMS.ACCIDENTS 
as
(
SELECT 
ACCIDENT_ID
,POLICYHOLDER_ID
,VEHICLE_ID
,ACCIDENT_TYPE
,ACCIDENT_DATE
,ESTIMATED_COST
,ACTUAL_REPAIR_COST
,AT_FAULT
,DUI
FROM INSURANCE.CLAIMS.SOURCE_ACCIDENTS
);
```

### Create a `VIEW` OR `TEMPORARY TABLE` from a `SELECT` statement 

```sql
create or replace VIEW INSURANCE.CLAIMS.ACCIDENTS 
as
(
SELECT 
ACCIDENT_ID
,POLICYHOLDER_ID
,VEHICLE_ID
,ACCIDENT_TYPE
,ACCIDENT_DATE
,ESTIMATED_COST
,ACTUAL_REPAIR_COST
,AT_FAULT
,DUI
FROM INSURANCE.CLAIMS.SOURCE_ACCIDENTS
);
```

```sql
create or replace TEMPORARY TABLE INSURANCE.CLAIMS.ACCIDENTS 
as
(
SELECT 
ACCIDENT_ID
,POLICYHOLDER_ID
,VEHICLE_ID
,ACCIDENT_TYPE
,ACCIDENT_DATE
,ESTIMATED_COST
,ACTUAL_REPAIR_COST
,AT_FAULT
,DUI
FROM INSURANCE.CLAIMS.SOURCE_ACCIDENTS
);
```

### Moving data from one database schema to another using `INSERT INTO `and `SELECT`

* Moving Data from `PLAYGROUND.SOURCE` (Database name is PLAYGROUND and Schema is SOURCE) schema to `INSURANCE.CLAIMS` schema (Database is INSURANCE and Schema is CLAIMS)
* Source table name: SOURCE_ACCIDENTS
* Target table name: TARGET_ACCIDENTS

```sql
INSERT INTO INSURANCE.CLAIMS.TARGET_ACCIDENTS 
SELECT 
ACCIDENT_ID
,POLICYHOLDER_ID
,VEHICLE_ID
,ACCIDENT_TYPE
,ACCIDENT_DATE
,ESTIMATED_COST
,ACTUAL_REPAIR_COST
,AT_FAULT
,DUI
FROM PLAYGROUND.SOURCE.SOURCE_ACCIDENTS;
```

----

# Basic SQL Reference 

**1. Basic SELECT:**

```sql
SELECT column1, column2 
FROM table_name
WHERE condition;
```

**2. DISTINCT (Unique Values):**

```sql
SELECT DISTINCT column1 
FROM table_name;
```

**3. COUNT & Aggregate Functions:**

```sql
SELECT COUNT(column1), AVG(column2), SUM(column3) 
FROM table_name;
```

**4. WHERE (Filtering):**

```sql
SELECT column1 
FROM table_name 
WHERE column1 = value;
```

**5. AND & OR (Multiple Conditions):**

```sql
SELECT column1 
FROM table_name 
WHERE column1 = value1 AND column2 = value2;

SELECT column1 
FROM table_name 
WHERE column1 = value1 OR column1 = value2;
```

**6. JOINs:**

- INNER JOIN:

```sql
SELECT a.column1, b.column2 
FROM table1 a 
INNER JOIN table2 b ON a.common_column = b.common_column;
```

- LEFT JOIN:

```sql
SELECT a.column1, b.column2 
FROM table1 a 
LEFT JOIN table2 b ON a.common_column = b.common_column;
```

(Change to `RIGHT JOIN` for a right join, and `FULL OUTER JOIN` for a full outer join.)

**7. UNION (Combine Results):**

```sql
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;
```

(Note: Use `UNION ALL` if you want to include duplicate rows.)

**8. GROUP BY & HAVING (Aggregation with Filtering):**

```sql
SELECT column1, COUNT(*)
FROM table_name
GROUP BY column1
HAVING COUNT(*) > value;
```

**9. ORDER BY (Sorting):**

```sql
SELECT column1 
FROM table_name 
ORDER BY column2 ASC, column3 DESC;
```

**10. CTEs (Common Table Expressions):**

```sql
WITH cte_name AS (
    SELECT column1, column2 
    FROM table_name
)
SELECT * FROM cte_name;
```

**11. Windowing Functions (OVER):**

- Basic OVER:

```sql
SELECT column1, SUM(column2) OVER() 
FROM table_name;
```

- OVER with ORDER BY:

```sql
SELECT column1, ROW_NUMBER() OVER(ORDER BY column2) 
FROM table_name;
```

- OVER with PARTITION BY:

```sql
SELECT column1, SUM(column2) OVER(PARTITION BY column3) 
FROM table_name;sql
```