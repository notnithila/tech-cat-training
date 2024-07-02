## SQL Activity 3.1.2 SOLVED

**Exercise 1: Basic Filtering** Write a SQL query to retrieve all columns from the "NATION" table in the 'UNITED STATES' 

```sql
SELECT * FROM NATION WHERE N_NAME = 'UNITED STATES'
```



**Exercise 2: Filtering with Multiple Conditions** Write a SQL query to retrieve the "P_NAME" and "P_RETAILPRICE" columns from the "PART" table for parts with a "P_TYPE" contains  the word 'SMALL' and a "P_SIZE" of 5.

```sql
SELECT P_NAME, P_RETAILPRICE
FROM PART
WHERE P_TYPE LIKE '%SMALL%' AND P_SIZE = 5;
```

Alternative solution

```sql
SELECT P_NAME, P_RETAILPRICE
FROM PART
WHERE contains(P_TYPE, 'SMALL') AND P_SIZE = 5;
```



**Exercise 3: Ordering Results** Write a SQL query to retrieve the "O_ORDERDATE" and "O_TOTALPRICE" columns from the "ORDERS" table for orders placed in 1995 and order them by total price in descending order.

```sql
SELECT O_ORDERDATE, O_TOTALPRICE
FROM ORDERS
WHERE YEAR(O_ORDERDATE) = 1995
ORDER BY O_TOTALPRICE DESC;
```



**Exercise 4: Top N Results** Write a SQL query to retrieve the top 10 most expensive parts from the "PART" table, including their "P_NAME" and "P_RETAILPRICE," sorted by retail price in descending order.

```sql
SELECT P_NAME, P_RETAILPRICE
FROM PART
ORDER BY P_RETAILPRICE DESC
LIMIT 10;
```

