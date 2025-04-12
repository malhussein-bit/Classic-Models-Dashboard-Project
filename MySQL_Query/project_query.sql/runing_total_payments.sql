/* customers that have gone over their credit limit factoring in their runing total and payments made- part 2 */
/* we need to dreate a runing total for payments as well*/

select *, sum(amount) over (partition by customerNumber order by paymentDate) as runing_total_payments
from payments
where customerNumber = 103