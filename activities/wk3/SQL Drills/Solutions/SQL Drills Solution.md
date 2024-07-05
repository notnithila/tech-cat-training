## 4.1.1 Solutions

#### **1. Basic Customer Information**

```sql
SELECT c_name, c_address 
FROM CUSTOMER 
WHERE c_nationkey = 3 
ORDER BY c_name;
```

#### **2. Suppliers in Specific Regions**

```sql
SELECT s_name, s_acctbal 
FROM SUPPLIER 
WHERE s_acctbal > 5000 
ORDER BY s_acctbal DESC;
```

#### **3. Part Market Segments**

```sql
SELECT
    p_name,
    case
        when p_size <= 20 then 'SMALL'
        else 'LARGE'
    end as part_size
FROM
    PART
Order by
    p_name
```

#### **4. Order Count by Year**

```sql
SELECT DATE_TRUNC('YEAR', o_orderdate) AS year, 
				COUNT(*) AS order_count 
FROM ORDERS 
GROUP BY DATE_TRUNC('YEAR', o_orderdate);
```

#### **5. Average Order Prices**

```sql
SELECT o_custkey, AVG(o_totalprice) AS avg_order_price 
FROM ORDERS 
GROUP BY o_custkey;
```

#### **6. Customer and Nation Information**

```sql
SELECT c.c_name, n.n_name 
FROM CUSTOMER c 
JOIN NATION n ON c.c_nationkey = n.n_nationkey;
```

#### **7. Supplier and Part Connection**

```sql
SELECT p.p_name as part_name, s.s_name as supplier_name
FROM PART as p
JOIN PARTSUPP as sp on p.p_partkey = sp.ps_partkey
JOIN SUPPLIER as s on sp.ps_suppkey = s.s_suppkey
JOIN nation as n on s.s_nationkey = n.n_nationkey
JOIN region as r on n.n_regionkey = r.r_regionkey
WHERE r.r_name = 'EUROPE'
```

#### **8. Customer Orders and Line Items**

```sql
SELECT c.c_name, o.o_totalprice 
FROM CUSTOMER c 
JOIN ORDERS o ON c.c_custkey = o.o_custkey 
JOIN LINEITEM l ON o.o_orderkey = l.l_orderkey 
WHERE l.l_partkey = 5;
```

#### **9. Monthly Sales Analysis (Using CTE)**

```sql
WITH MonthlySales AS (
     SELECT MONTH(o_orderdate) AS month, SUM(o_totalprice) AS total_sales 
    FROM ORDERS 
    GROUP BY  MONTH(o_orderdate)
)
SELECT month, total_sales 
FROM MonthlySales 
ORDER BY month;
```

#### **10. Top Supplier Overview (Using CTE)**

```sql
WITH SupplierSales AS (
    SELECT s.s_name, SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_sales 
    FROM SUPPLIER s 
    JOIN LINEITEM l ON s.s_suppkey = l.l_suppkey 
    GROUP BY s.s_name
)
SELECT s_name, total_sales 
FROM SupplierSales 
ORDER BY total_sales DESC 
LIMIT 5;
```