/* customers that have gone over their credit limit factoring in their runing total and payments made- part 2 */
/* we need to dreate a runing total for payments as well*/

WITH cte_sales AS (
    SELECT 
        o.orderDate,
        o.customerNumber,
        o.orderNumber,
        c.customerName,
        od.productCode,
        c.creditLimit,
        od.quantityOrdered * od.priceEach AS sales_value
    FROM orders o
    INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
    INNER JOIN customers c ON o.customerNumber = c.customerNumber
),

running_total_sales_cte AS (
    SELECT 
        *,
        LEAD(orderDate) OVER (PARTITION BY customerNumber ORDER BY orderDate) AS next_order_date
    FROM (
        SELECT 
            orderDate,
            orderNumber,
            customerNumber,
            customerName,
            creditLimit,
            SUM(sales_value) AS sales_value
        FROM cte_sales
        GROUP BY
            orderDate,
            orderNumber,
            customerNumber,
            customerName,
            creditLimit
    ) subquery
),

payments_cte AS (
    SELECT * FROM payments
),

main_cte AS (
    SELECT 
        rtc.*,
        COALESCE(pc.amount, 0) AS payment_amount,
        SUM(rtc.sales_value) OVER (PARTITION BY rtc.customerNumber ORDER BY rtc.orderDate) AS running_total_sales,
        SUM(COALESCE(pc.amount, 0)) OVER (PARTITION BY rtc.customerNumber ORDER BY rtc.orderDate) AS running_total_payments
    FROM running_total_sales_cte rtc
    LEFT JOIN payments_cte pc 
        ON rtc.customerNumber = pc.customerNumber
        AND pc.paymentDate BETWEEN rtc.orderDate AND 
            COALESCE(rtc.next_order_date, CURRENT_DATE)
)

SELECT *, 
       running_total_sales - running_total_payments AS money_owed,
       creditlimit - (running_total_sales - running_total_payments) as difference
FROM main_cte;
