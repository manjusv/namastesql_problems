/* Imagine you're working for a library and you're tasked with generating a report on the 
borrowing habits of patrons. You have two tables in your database: Books and Borrowers.

Write an SQL to display the name of each borrower along with a comma-separated list of 
the books they have borrowed in alphabetical order, display the output in ascending order 
of Borrower Name.

Tables: Books
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| BookID      | int         |
| BookName    | varchar(30) |
| Genre       | varchar(20) |
+-------------+-------------+

Tables: Borrowers
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| BorrowerID   | int         |
| BorrowerName | varchar(10) |
| BookID       | int         |
+--------------+-------------+

Expected Output:
borrowername |              borrowedbooks              
--------------+-----------------------------------------
 Alice        | Pride and Prejudice,The Great Gatsby
 Bob          | Romeo and Juliet,To Kill a Mockingbird
 Charlie      | 1984,The Notebook
 David        | The Catcher in the Rye,The Hunger Games
 Eve          | Pride and Prejudice
 Frank        | Foundation,Romeo and Juliet
 Grace        | The Notebook
 Harry        | To Kill a Mockingbird
 Ivy          | 1984
*/

-- Solution:
SELECT br.BorrowerName, STRING_AGG(bo.BookName, ',' ORDER BY bo.BookName) as borrowedbooks
FROM Borrowers br 
INNER JOIN Books bo
ON br.BookID = bo.BookID
GROUP BY br.BorrowerName
ORDER By br.BorrowerName