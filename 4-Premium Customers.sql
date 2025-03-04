/*
An e-commerce company want to start special reward program for their premium customers.  The customers who have placed a greater number of orders than the average number of orders placed by customers are considered as premium customers.

Write an SQL to find the list of premium customers along with the number of orders placed by each of them, display the results in highest to lowest no of orders.

Table: orders (primary key : order_id)
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| order_id      | int         |
| order_date    | date        |
| customer_name | varchar(20) |
| sales         | int         |
+---------------+-------------+

Expected Output:
customer_name | no_of_orders 
---------------+--------------
 Alexa         |            4
 Ramesh        |            3

*/

-- Solution:
select customer_name,count(*) as no_of_orders 
from orders
group by customer_name having count(*)>(select count(*)*1.0/count(distinct customer_name) as avg_no_of_orders  from orders)
ORDER BY no_of_orders DESC;