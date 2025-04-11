/* breakdown of products that are commonly purchased together and products that are not */
/* we will use the productline column as the indicator, will also have to join products to orderdetails tabels*/

with prod_sales as
(
select orderNumber, od.productCode, productLine
from orderdetails od
inner join products p on
od.productCode = p.productCode
)


/* we now need productlines that are on the same ordernumber and productlines that are not on the same ordernumber*/
/* so we neeed to use output from above and further query by left joining the tabe on itself, for that we need to use it as a CTE*/

select distinct ps1.ordernumber, ps1.productline as product_one, ps2.productline as product_two
from prod_sales ps1
left join prod_sales ps2
on ps1.ordernumber = ps2.ordernumber and ps1.productline <> ps2.productline

/* after results of above we will now display ordernumber, productline from first tabel product_one, productline from second tabel product_two */
/* we will use select distinct ordernumber......see above*/
