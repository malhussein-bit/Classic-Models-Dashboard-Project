/* office location customres*/
with main_cte as 
(
select 
o.orderNumber,
od.productCode,
od.quantityOrdered,
od.priceEach,
quantityOrdered * priceEach as sales_value,
c.city as customer_city,
c.country as customer_country,
p.productLine,
ofi.city as office_city,
ofi.country as office_country
from orders o
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join customers c
on o.customerNumber = c.customerNumber
inner join products p
on od.productCode = p.productCode
inner join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
inner join offices ofi
on e.officeCode = ofi.officeCode
)
select 
ordernumber,
customer_city,
customer_country,
productline,
office_city,
office_country,
sum(sales_value) as sales_value
from main_cte
group by
ordernumber,
customer_city,
customer_country,
productline,
office_city,
office_country