/* orders affected by 3 days late shippment*/

select *,

date_add(shippeddate, interval 3 day) as latest_arraival,
case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end as late_flag
from orders
where case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end = 1


