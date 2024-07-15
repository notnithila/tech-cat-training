### Challenge Activity: Comprehensive Sales Data Analysis with SQL and Snowflake

#### Description

In this final challenge, students will apply multiple data transformation concepts they have learned to perform a comprehensive analysis of sales data using SQL and Snowflake. They will aggregate data, create new features, manipulate datetime data, use window functions for rolling averages and lagged features, rank data, and categorize sales into bins.

**Setup: Create Table and Insert Data**

```sql
-- Use the right Role and Warehouse
USE ROLE DE;
USE WAREHOUSE COMPUTE_WH;

-- Create the sales_data table
CREATE OR REPLACE TRANSIENT TABLE TECHCATALYST_DE.<YOURSCHEMA>.sales_data (
    Store STRING,
    Product STRING,
    Sales INT,
    Date DATE
);

-- Insert sample data into the sales_data table
INSERT INTO TECHCATALYST_DE.<YOURSCHEMA>.sales_data (Store, Product, Sales, Date) VALUES 
('A', 'Apples', 100, '2024-07-01'),
('A', 'Oranges', 150, '2024-07-02'),
('B', 'Apples', 200, '2024-07-01'),
('B', 'Oranges', 120, '2024-07-02'),
('C', 'Apples', 90, '2024-07-01'),
('C', 'Oranges', 80, '2024-07-02'),
('A', 'Apples', 130, '2024-07-03'),
('B', 'Oranges', 110, '2024-07-03'),
('C', 'Apples', 95, '2024-07-03'),
('A', 'Oranges', 105, '2024-07-04'),
('B', 'Apples', 210, '2024-07-04'),
('C', 'Oranges', 70, '2024-07-04');

```

### Task

1. **Aggregate the data**: Calculate total sales for each store and product combination.

![image-20240712144212798](images/image-20240712144212798.png)

```sql
SELECT 
    Store, 
    Product, 
    SUM(Sales) AS Total_Sales
FROM 
    sales_data
GROUP BY 
    Store, 
    Product;

```



2. Create new features:

- `Sales_Difference` which is the difference between each `Sales` value and the average sales of the corresponding `Product`.
- `High_Sales` which indicates whether the sales are higher than 100 (True) or not (False).

![image-20240712144258268](images/image-20240712144258268.png)

```sql
WITH avg_sales AS (
    SELECT 
        Product, 
        AVG(Sales) AS Avg_Sales
    FROM 
        sales_data
    GROUP BY 
        Product
)
SELECT 
    s.*, 
    (s.Sales - a.Avg_Sales) AS Sales_Difference,
    CASE WHEN s.Sales > 100 THEN TRUE ELSE FALSE END AS High_Sales
FROM 
    sales_data s
JOIN 
    avg_sales a
ON 
    s.Product = a.Product;

```



3. **Manipulate datetime data**: Extract `Year`, `Month`, `Day`, and `Day_of_Week`.

![image-20240712144320804](images/image-20240712144320804.png)

```sql
SELECT 
    *,
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    DAY(Date) AS Day,
    DAYNAME(Date) AS Day_of_Week
FROM 
    sales_data;

```



4. **Calculate a 3-day moving average** of sales for each product.

![image-20240712144341644](images/image-20240712144341644.png)

```sql
SELECT 
    Store, 
    Product, 
    Sales, 
    Date,
    AVG(Sales) OVER (PARTITION BY Product ORDER BY Date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Avg_3_Days
FROM 
    sales_data;

```



5. **Create a lagged feature `Prev_Day_Sales`** that contains the sales value of the previous day for each product.

![image-20240712144402313](images/image-20240712144402313.png)

```sql
SELECT 
    Store, 
    Product, 
    Sales, 
    Date,
    LAG(Sales, 1, 0) OVER (PARTITION BY Product ORDER BY Date) AS Prev_Day_Sales
FROM 
    sales_data;

```



6. **Rank the sales** within each store in descending order.

![image-20240712144422207](images/image-20240712144422207.png)

```sql
SELECT 
    Store, 
    Product, 
    Sales, 
    Date,
    RANK() OVER (PARTITION BY Store ORDER BY Sales DESC) AS Sales_Rank
FROM 
    sales_data;

```



7. **Categorize sales into bins** with the categories: 'Low', 'Medium', 'High'.

![image-20240712144443414](images/image-20240712144443414.png)

```sql
SELECT 
    *,
    CASE 
        WHEN Sales <= 100 THEN 'Low'
        WHEN Sales <= 150 THEN 'Medium'
        ELSE 'High'
    END AS Sales_Level
FROM 
    sales_data;

```



8. **Create a summary report** showing total sales, average sales, highest sale, and lowest sale for each store.

![image-20240712144501909](images/image-20240712144501909.png)

```sql
SELECT 
    *,
    CASE 
        WHEN Sales <= 100 THEN 'Low'
        WHEN Sales <= 150 THEN 'Medium'
        ELSE 'High'
    END AS Sales_Level
FROM 
    sales_data;

```



