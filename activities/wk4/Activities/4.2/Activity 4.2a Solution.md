Make sure you use your own schema.

```sql

use schema techcatalyst_de.tatwan;

create or replace table fun_facts 
(
id INT PRIMARY KEY AUTOINCREMENT START 1 INCREMENT 1,
name string,
salary int,
other_id int unique 
);

insert into fun_facts
(name, salary, other_id)
values
('Tarek', 122.5, 123),
('Joe', 90.89, 123),
('Sara', 100, 123),
('Jack', 90.99, 150),
('Tarek', 122.5, 123),
('Joe', 90.89, 123),
('Sara', 100, 123),
('Jack', 90.99, 150);

select * from fun_facts;

-- Example 1 using GROUP BY
select NAME, SALARY, OTHER_ID 
from fun_facts 
group by 1, 2, 3;


-- example 2 USING DISTINCT
select distinct NAME, SALARY, OTHER_ID 
from fun_facts;


-- example 3 USING AN AGGREGATE AND HAVING
select NAME, SALARY, OTHER_ID, count(ID) as cnt 
from fun_facts 
group by 1, 2, 3
having cnt > 1;

-- example 3 (fist part) USING WINDOW FUNCTION
select *,
ROW_NUMBER() OVER(PARTITION BY NAME, SALARY, OTHER_ID ORDER BY (ID) ASC) as row_cnt
from fun_facts;

-- full - USING WINDOW FUNCTION AND CTE 
with cte as
(
select *,
ROW_NUMBER() OVER(PARTITION BY NAME, SALARY, OTHER_ID ORDER BY (ID) ASC) as row_cnt
from fun_facts
)
select * from cte where row_cnt = 1;


```

