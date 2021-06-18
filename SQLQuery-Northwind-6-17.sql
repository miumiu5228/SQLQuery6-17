USE Northwind

SELECT O.OrderID, P.ProductName FROM dbo.Orders O
JOIN dbo.[Order Details] D ON O.OrderID = D.OrderID
JOIN dbo.Products P ON P.ProductID = D.ProductID
WHERE DATEDIFF(year, O.OrderDate,getdate()) >= 25

SELECT TOP 5 C.PostalCode, COUNT(O.OrderID) AS total_count FROM dbo.Orders O
JOIN dbo.Customers C 
ON O.CustomerID = C.CustomerID
GROUP BY C.PostalCode
ORDER BY 2 DESC


SELECT TOP 5 C.PostalCode, COUNT(O.OrderID) AS total_count FROM dbo.Orders O
JOIN dbo.Customers C 
ON O.CustomerID = C.CustomerID
WHERE DATEDIFF(year, O.OrderDate,getdate()) <= 20
GROUP BY C.PostalCode
ORDER BY 2 DESC


SELECT C.City, COUNT(C.CustomerID) AS count_total FROM dbo.Customers C
GROUP BY C.City


SELECT C.City, COUNT(C.CustomerID) AS count_total FROM dbo.Customers C
GROUP BY C.City
HAVING COUNT(C.CustomerID) >10


SELECT ShipName AS customerName FROM dbo.Orders 
WHERE OrderDate = '1998-01-01'



SELECT  MAX(O.ShippedDate) AS shipDate, O.CustomerID FROM dbo.Orders O
GROUP BY O.CustomerID

SELECT  O.ShipName, COUNT(O.OrderID) FROM dbo.Orders O
GROUP BY O.ShipName


SELECT  O.CustomerID, COUNT(O.OrderID) TheCount FROM dbo.Orders O
GROUP BY O.CustomerID
HAVING COUNT(O.OrderID) > 100


SELECT O.ShipName, O.OrderDate FROM dbo.Orders O


SELECT A.FirstName, B.FirstName  FROM dbo.Employees A, dbo.Employees B
WHERE A.Title = B.Title


SELECT * FROM dbo.Employees 
WHERE ReportsTo > 2

SELECT F1, F2 FROM T1
JOIN T2 ON T1.F1 = T2.F2
/* The result will return two rows "2 2" and "3 3" */

SELECT F1, F2 FROM T1
LEFT JOIN T2 ON T1.F1 = T2.F2

/* The result will return return three rows "1 null" "2 2" "3 3" */