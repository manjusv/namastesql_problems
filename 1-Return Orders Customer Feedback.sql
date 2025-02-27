/*
Namastekart, an e-commerce company, has observed a notable surge in return orders recently. They suspect that a specific group of customers may be responsible for a significant portion of these returns. To address this issue, their initial goal is to identify customers who have returned more than 50% of their orders. This way, they can proactively reach out to these customers to gather feedback.

Write an SQL to find list of customers along with their return percent (Round to 2 decimal places), display the output in ascending order of customer name.

 

Table: orders (primary key : order_id)
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| customer_name | varchar(10) |
| order_date    | date        |
| order_id      | int         |
| sales         | int         |
+---------------+-------------+

Table: returns (primary key : order_id)
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| order_id    | int       |
| return_date | date      |
+-------------+-----------+

Expected Output:
+---------------+----------------+
| customer_name | return_percent |
+---------------+----------------+
| Alexa         |          75.00 |
| Ankit         |         100.00 |
+---------------+----------------+
*/
-- Solution:

select customer_name, ROUND((count(r.order_id)::NUMERIC/count(*))*100, 2) as return_percent 
from orders o LEFT OUTER JOIN returns r
ON o.order_id = r.order_id
GROUP BY customer_name
HAVING ROUND((count(return_date)::NUMERIC/count(*))*100, 2) > 50.00
ORDER BY customer_name
