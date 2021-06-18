
/*
-What is a result set?
 A result set is the output of a query. It could result in a one row, one column output or mutiple column and mutiple row output.
	
-What is the difference between Union and Union All?
 "UNION All" contains dupicate rows while "Union" does not.

-What are the other Set Operators SQL Server has?
 There are four set Operators. union, union all, intersect and except.

-What is the difference between Union and Join?
  "JOIN" combines data into new columns and "Union" combines data into new rows.

-What is the difference between INNER JOIN and FULL JOIN?
 "INNER JOIN" will return all the rows from two tables as long as the condition satisfies. 

-What is difference between left join and outer join
 "OUTER JOIN" is used to return results by combining rows from two or more tables. But unlike an inner join, the outer join will return every row from one specified table, even if the join condition fails.
 "LEFT JOIN" returns all the rows of the table on the left side. And matching rows for the table on the right side. If there is no matching row on the right side, it will show a null value

-What is cross join?
 "CROSS JOIN" is used to combine each row of the first table with each row of the second table.

-What is the difference between WHERE clause and HAVING clause?
 "WHERE" clause is used to specify a condition for filtering records before any groupings are made, while the "HAVING" clause is used to specify a condition for filtering values from a group.

-Can there be multiple group by columns?
 "GROUP BY" clause can contain two or more columns.


*/

use AdventureWorks2019;

SELECT COUNT(P.ProductID) AS total_product FROM Production.Product AS P


SELECT COUNT(P.ProductID) AS total_product FROM Production.Product AS P
WHERE P.ProductSubcategoryID IS NOT NULL


SELECT  P.ProductSubcategoryID, COUNT(P.Name) AS CountedProducts FROM Production.Product AS P
GROUP BY P.ProductSubcategoryID


SELECT COUNT(P.ProductID) AS total_product FROM Production.Product AS P
WHERE P.ProductSubcategoryID IS NULL


SELECT * FROM Production.ProductInventory AS P


SELECT P.ProductID, P.Quantity AS TheSum FROM Production.ProductInventory AS P
WHERE P.LocationID = 40 
AND P.Quantity < 100


SELECT P.Shelf, P.ProductID, P.Quantity AS TheSum FROM Production.ProductInventory AS P
WHERE P.LocationID = 40 
AND P.Quantity < 100


SELECT P.LocationID, AVG(P.Quantity) AS TheAvg FROM Production.ProductInventory AS P
WHERE P.LocationID = 10
GROUP BY P.LocationID


SELECT  P.ProductID, P.Shelf, AVG(P.Quantity) AS TheAvg FROM Production.ProductInventory AS P
GROUP BY P.Shelf, P.ProductID


SELECT  P.ProductID, P.Shelf, AVG(P.Quantity) AS TheAvg FROM Production.ProductInventory AS P
WHERE P.Shelf IS NOT NULL
GROUP BY P.Shelf, P.ProductID


SELECT  P.Color, P.Class, COUNT(P.Name) AS TheCount, AVG(P.ListPrice) AS AvgPrice 
FROM Production.Product AS P
WHERE P.Color IS NOT NULL
AND P.Class IS NOT NULL
GROUP BY P.Color, P.Class


SELECT C.Name AS Country, S.Name AS Province  FROM Person.CountryRegion C
JOIN Person.StateProvince S
ON C.Name = S.Name

SELECT C.Name AS Country, S.Name AS Province  FROM Person.CountryRegion C
LEFT JOIN Person.StateProvince S
ON C.Name = S.Name
WHERE C.Name IN ('Germany', 'Canada')