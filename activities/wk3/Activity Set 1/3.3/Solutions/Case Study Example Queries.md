```sql
-- Query to provide a breakdown of suppliers by nation
SELECT n.n_name AS nation_name, COUNT(s.s_suppkey) AS supplier_count
FROM supplier s
JOIN nation n ON s.s_nationkey = n.n_nationkey
GROUP BY n.n_name
ORDER BY supplier_count DESC;

-- Query to identify the top 10 most ordered products by total quantity
SELECT p.p_name AS product_name, SUM(l.l_quantity) AS total_quantity_ordered
FROM lineitem l
JOIN part p ON l.l_partkey = p.p_partkey
GROUP BY p.p_name
ORDER BY total_quantity_ordered DESC
LIMIT 10;

-- Query to identify the top 20 customers who have placed the most orders
SELECT c.c_custkey, c.c_name, COUNT(o.o_orderkey) AS total_orders
FROM customer c
JOIN orders o ON c.c_custkey = o.o_custkey
GROUP BY c.c_custkey, c.c_name
ORDER BY total_orders DESC
LIMIT 20


-- Query to get the total sales value for each region
SELECT r.r_name AS region_name, SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_sales_value
FROM lineitem l
JOIN orders o ON l.l_orderkey = o.o_orderkey
JOIN customer c ON o.o_custkey = c.c_custkey
JOIN nation n ON c.c_nationkey = n.n_nationkey
JOIN region r ON n.n_regionkey = r.r_regionkey
GROUP BY r.r_name
ORDER BY total_sales_value DESC;

-- Query to breakdown the total sales for each market segment
SELECT c.c_mktsegment AS market_segment, SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_sales
FROM lineitem l
JOIN orders o ON l.l_orderkey = o.o_orderkey
JOIN customer c ON o.o_custkey = c.c_custkey
GROUP BY c.c_mktsegment
ORDER BY total_sales DESC;

-- Query to list customers who haven't placed any orders
SELECT c.c_custkey, c.c_name
FROM customer c
LEFT JOIN orders o ON c.c_custkey = o.o_custkey
WHERE o.o_orderkey IS NULL;






```

