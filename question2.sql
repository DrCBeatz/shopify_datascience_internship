-- ** NOTE -- the queries below work in the Chrome browser for following URL:
-- https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL

-- *************************************************************
-- Q2a: How many orders were shipped by Speedy Express in total?
-- *************************************************************

SELECT count(*) as [Total Orders Shipped by Speedy Express:]
FROM Orders WHERE ShipperID IN (SELECT ShipperID FROM Shippers
WHERE ShipperName = 'Speedy Express')

-- ************************************************************
-- ** Q2a answer is 54 orders were shipped by Speedy Express **
-- ************************************************************


--


-- ***************************************************************
-- Q2b: What is the last name of the employee with the most orders?
-- ***************************************************************

SELECT Employees.LastName, COUNT(Orders.OrderID) AS [Number of Orders]
FROM (Orders INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP By LastName Order by Count(Orders.OrderID) DESC LIMIT 1;

-- **********************************************************************
-- ** Q2b answer is Peacock is last name of employee with most orders  **
-- **********************************************************************


--


-- ***************************************************************
-- Q2c: What product was ordered the most by customers in Germany? 
-- ***************************************************************


SELECT OrderDetails.ProductID, Products.ProductName,
COUNT(Products.ProductName) as [Product order count] FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID JOIN Products ON OrderDetails.ProductID = Products.ProductID
where Customers.Country = 'Germany' GROUP BY Products.ProductName order by [Product order count] desc limit 1

-- *************************************************************************************************
-- Q2c answer is  Gorgonzola Telino is the product most frequently ordered by customers in Germany *
-- *************************************************************************************************
