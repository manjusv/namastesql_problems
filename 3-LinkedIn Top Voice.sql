/*
LinkedIn is a professional social networking app. They want to give top voice badge to their best creators to encourage them to create more quality content. A creator qualifies for the badge if he/she satisfies following criteria.

1- Creator should have more than 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.

Write a SQL to get the list of top voice creators name along with no of posts and impressions by them in the month of Dec-2023. 

Table: creators(primary key : creator_id)
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| creator_id   | int         |
| creator_name | varchar(20) |
| followers    | int         |
+--------------+-------------+
Table: posts(primary key : post_id)
+--------------+------------+
| COLUMN_NAME  | DATA_TYPE  |
+--------------+------------+
| creator_id   | int        |
| post_id      | varchar(3) |
| publish_date | date       |
| impressions  | int        |
+--------------+------------+

Expected Output:
+--------------+-------------+-------------------+
| creator_name | no_of_posts | total_impressions |
+--------------+-------------+-------------------+
| Ankit Bansal |           3 |            132000 |
+--------------+-------------+-------------------+
*/

-- Solution:

select c.creator_name, count(p.post_id) as no_of_posts, SUM(p.impressions) as total_impressions
from creators c INNER JOIN posts p
ON c.creator_id = p.creator_id 
WHERE EXTRACT(MONTH from p.publish_date) = 12 AND
EXTRACT(YEAR from p.publish_date) = 2023
GROUP BY c.creator_name
HAVING count(*) >= 3 AND SUM(p.impressions) > 100000 AND c.followers > 50000
ORDER BY c.creator_name