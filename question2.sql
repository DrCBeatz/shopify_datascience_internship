
-- ************************************************************
-- Q1: How many orders were shipped by Speedy Express in total?
-- ************************************************************

-- Get ShipperID of Speedy Express from Shippers table:

SELECT ShipperID FROM Shippers WHERE ShipperName = 'Speedy Express';

-- Speedy Express is ShipperID = 1

-- Select all entries from Orders table with ShipperID = 1:

SELECT COUNT(*) FROM Orders WHERE ShipperID = 1;

-- ***********************************************************
-- ** Q1 answer is 54 orders were shipped by Speedy Express **
-- ***********************************************************

--
--

-- ***************************************************************
-- Q2: What is the last name of the employee with the most orders?
-- ***************************************************************

-- Do groupby of EmployeeID with its count in descending order to determine which ID has the most orders

SELECT TOP 1 EmployeeID, COUNT(EmployeeID) FROM Orders GROUP BY EmployeeID ORDER BY COUNT(EmployeeID) DESC;

-- EmployeeID = 4 has the most orders (40)

-- Get last name of employeeID 4:

SELECT LastName FROM Employees WHERE EmployeeID = 4;

-- ******************************************************************
-- ** Q2 answer: last name of employee with most orders is Peacock **
-- ******************************************************************

--
--

-- **************************************************************
-- Q3. What product was ordered the most by customers in Germany?
-- **************************************************************

-- select CustomerID for German customers from Customers table:

SELECT CustomerID FROM Customers where Country = 'Germany';

-- select OrderID of CusomterID results from previous query from Orders table:

SELECT OrderID FROM Orders WHERE CustomerID = 1 OR CustomerID = 6 OR CustomerID = 17 OR CustomerID = 25 OR CustomerID = 39 OR CustomerID = 44 OR CustomerID = 52 OR CustomerID = 56 OR CustomerID = 63 OR CustomerID = 79 OR CustomerID = 86;

-- select the ProductID with the highest count from the OrderDetails table using the OrderID's from previous query:

SELECT TOP 1 ProductID, COUNT(ProductID) FROM OrderDetails WHERE OrderID = 10267 OR OrderID = 10273 OR OrderID = 10277 OR OrderID = 10279 OR OrderID = 10284 OR OrderID = 10285 OR OrderID = 10286 OR OrderID = 10301 OR OrderID = 10312 OR OrderID = 10313 OR OrderID = 10323 OR OrderID = 10325 OR OrderID = 10337 OR OrderID = 10342 OR OrderID = 10343 OR OrderID = 10345 OR OrderID = 10348 OR OrderID = 10356 OR OrderID = 10361 OR OrderID = 10363 OR OrderID = 10391 OR OrderID = 10396 OR OrderID = 10407 OR OrderID = 10418 OR OrderID = 10438 GROUP BY ProductID ORDER BY COUNT(ProductID) DESC;

-- ProductID 31 was ordered the most (5 times) among German customers.
-- Get product name:

SELECT ProductName FROM Products where ProductID = 31;

-- *************************************************************************************
-- Q3 Gorgonzola Telino is the product most frequently ordered by customers in Germany *
-- *************************************************************************************


SELECT ProductID, Quantity FROM OrderDetails WHERE OrderID = 10267 OR OrderID = 10273 OR OrderID = 10277 OR OrderID = 10279 OR OrderID = 10284 OR OrderID = 10285 OR OrderID = 10286 OR OrderID = 10301 OR OrderID = 10312 OR OrderID = 10313 OR OrderID = 10323 OR OrderID = 10325 OR OrderID = 10337 OR OrderID = 10342 OR OrderID = 10343 OR OrderID = 10345 OR OrderID = 10348 OR OrderID = 10356 OR OrderID = 10361 OR OrderID = 10363 OR OrderID = 10391 OR OrderID = 10396 OR OrderID = 10407 OR OrderID = 10418 OR OrderID = 10438 ORDER by ProductID DESC;

-- FYI this query shows that item 40 (Boston Crab Meat) was ordered in the most quantity (160) by customers in Germany
