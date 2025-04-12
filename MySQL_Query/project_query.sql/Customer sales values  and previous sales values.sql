/* customer sales values and their previous sales values  */
with main_cte as 
(
select orderNumber, orderdate, customernumber, sum(sales_value) as sales_value
from
(select o.orderNumber, orderdate, customernumber, productCode, quantityOrdered *priceEach as sales_value
from orders o
inner join orderdetails od
on o.orderNumber = od.orderNumber) main

group by orderNumber, orderdate, customernumber
),
sales_query as
(
select mc.*,  customername, row_number() over (partition by customername order by orderdate) as purchase_number,
lag(sales_value) over (partition by customername order by orderdate) as prev_sales_value
from main_cte mc
inner join customers c
on mc.customernumber = c.customernumber
)

select * , sales_value - prev_sales_value as purchase_value_change
from sales_query
where prev_sales_value is not null



/* let us now sum all sales values that have the same ordernumber.... since we need to further query from the above result
hence a subquery or a CTE is required ....let's do a subquery and name it main */

/* let us know join this outpt (make a cte) and join it to the customer table */

/* to do previous sales value ..we use lag)*/

/* we will now add a column to show the diffefenc of sales value from previous saled value 
also remove null value .... one more cte (sales_query)*/




