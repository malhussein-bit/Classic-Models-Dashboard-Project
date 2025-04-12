/* grouping customers that have high sales values with  their credit limits */
/* breakdown of sales and credit limit*/
with sales as 
(
select o.orderNumber, o.customerNumber, productCode, quantityOrdered, priceEach, quantityOrdered * priceEach as Sales_Value,
creditLimit
from orders o
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join customers c
on o.customerNumber = c.customerNumber
)
select ordernumber, customernumber, 
 case
 WHEN creditlimit < 75000 then 'a: less then 75k'
 when creditlimit between 75000 and 100000 then 'b: $75-$100k'
 when creditlimit between 100000 and 150000 then 'c: $100-$150k'
 when creditlimit > 150000 then 'd: over $150k'
 else 'other'
 end as creditlimit_group, 
 sum(Sales_Value) as Sales_Value
from sales
group by ordernumber, customernumber, creditlimit_group