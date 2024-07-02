## SQL Activity 3.1.1 SOLVED

You will be using the `TPCH_SF1` dataset for now 



**Exercise 1: Retrieve All Columns from a Table** Write a SQL query to retrieve all columns from the "CUSTOMER" table.

```sql
SELECT *
FROM CUSTOMER;
```



**Exercise 2: Retrieve Specific Columns** Write a SQL query to retrieve only the "C_NAME" and "C_PHONE" columns from the "CUSTOMER" table.

```sql
SELECT C_NAME, C_PHONE
FROM CUSTOMER;
```



**Exercise 3: Using Aliases** Write a SQL query to retrieve the "C_NAME" and "C_ADDRESS" columns from the "CUSTOMER" table, but alias them as "Customer Name" and "Customer Address.”

```sql
SELECT C_NAME AS "Customer Name", C_ADDRESS AS "Customer Address"
FROM CUSTOMER;
```



**Exercise 4: Sorting Data** Write a SQL query to retrieve the "P_NAME" and "P_RETAILPRICE" columns from the "PART" table, sorted in descending order of retail price.

```sql
SELECT P_NAME, P_RETAILPRICE
FROM PART
ORDER BY P_RETAILPRICE DESC;
```

