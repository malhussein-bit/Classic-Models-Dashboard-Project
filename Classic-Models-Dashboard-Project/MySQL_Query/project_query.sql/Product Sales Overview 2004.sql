SELECT orderDate, o.orderNumber, o.customerNumber, quantityOrdered, priceEach, productName, buyPrice, city, country
FROM orders o
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join products p 
on od.productCode = p.productCode
inner join customers c
on o.customerNumber = c.customerNumber

where year(orderdate) = 2004