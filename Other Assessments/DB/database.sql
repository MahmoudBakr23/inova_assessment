/*
  This query selects distinct salaries,
  orders them in descending order,
  skips the highest salary, and retrieves the second highest.
*/

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


-- 1 -> Remove duplicates
-- 2 -> Limits the data returned to the employee itself.
-- 3 -> Always skip the first one and return NULL if empty and limit only 1 entity