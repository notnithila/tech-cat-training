# 4.1.1 Exercise

#### **1. Basic Customer Information**

Retrieve the customer names (`c_name`) and their addresses (`c_address`) from the `CUSTOMER` table for customers who are from the nation with `n_nationkey` equal to 3. Order the results by customer name in ascending order.

#### **2. Suppliers in Specific Regions**

From the `SUPPLIER` table, list supplier names (`s_name`) and their account balances (`s_acctbal`) for suppliers whose account balance is greater than 5000. Order the results by account balance in descending order.

#### **3. Part Market Segments**

Select part names (`p_name`) from the `PART` table for parts that belong to either the 'SMALL' or 'LARGE' market segment (`p_size`).  Where small is <= 20 and Large is anything greater than 20. Order the result by part name.

#### **4. Order Count by Year**

Count the number of orders made each year. Display the year and the count of orders.

#### **5. Average Order Prices**

Calculate the average total order price for each customer. Display the customer key (`c_custkey`) and the corresponding average order price.

#### **6. Customer and Nation Information**

Join the `CUSTOMER` table with the `NATION` table to retrieve the customer names (`c_name`) and their corresponding nation names (`n_name`).

#### **7. Supplier and Part Connection**

Identify parts (`p_name` from the `PART` table) supplied by suppliers (`s_name` from the `SUPPLIER` table) in the 'EUROPE' region.

#### **8. Customer Orders and Line Items**

List customers (`c_name`) who have ordered a part with `p_partkey` equal to 5. Include details about the order's total price (`o_totalprice`).

#### **9. Monthly Sales Analysis (Using CTE)**

Using a CTE, determine the total sales for each month of the year. Display the month and the corresponding total sales.

#### **10. Top Supplier Overview (Using CTE)**

Using a CTE, identify the top 5 suppliers based on the total value of parts they supply. Display the supplier name and the total value of parts supplied.