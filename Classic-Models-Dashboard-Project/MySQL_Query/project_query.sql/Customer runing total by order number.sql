/* breakdown of each custmer sales, calaculationg their runing total orderd by a the ordernumber- part 1*/

with cte_sales as
(

select 
orderDate,
o.customerNumber,
o.orderNumber,
customerName,
productCode,
creditLimit,
quantityOrdered * priceEach as sales_value
from orders o
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join customers c
on o.customerNumber = c.customerNumber
),

runing_total_sales_cte as
(
select *, lead(orderdate) over (partition by customernumber order by orderdate) as next_order_date
from
	(
	select 
	orderdate,
	ordernumber,
	customernumber,
	customername,
	creditlimit,
	sum(sales_value) as sales_value
	from cte_sales
	group by
	orderdate,
	ordernumber,
	customernumber,
	customername,
	creditlimit
	) subquery
)
,

/* now we need to claculate the runing total.....  runing total sale cte*/

payments_cte as
(
select *
from payments
),
main_cte as

(
select *,
sum(sales_value) over (partition by rtc.customernumber order by orderdate) as runing_total_sales,
sum(amount) over (partition by rtc.customerNumber order by orderdate) as runing_total_payments
from
runing_total_sales_cte rtc
left join payments_cte pc
on rtc.customernumber = pc.customernumber and pc.paymentdate between rtc.orderdate and case when rtc.next_order_date is null then current_date else next_order_date end
)
/* adding a next orderdate column*/

select *, runing_total_sales - runing_total_payments as money_owed
from
main_cte
