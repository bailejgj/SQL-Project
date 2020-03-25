----=====Exercise 1.1 List of customers living in Paris or London
----===Region not included as all results return "Null" value
----==================Should we include region? Should it adjust to if values with region are added later
--SELECT CustomerID
--, CompanyName 
--, Address
--, PostalCode
--, City
--, Country
--FROM Customers
----WHERE City = 'Paris'  OR City = 'London';
--WHERE City IN ('Paris', 'London');


----=====Exercise 1.2 Show all products stored in bottles.
--SELECT ProductID, ProductName AS 'Product Name', QuantityPerUnit AS 'Quantity Per Unit'
--FROM Products
--WHERE QuantityPerUnit LIKE '%Bottle%'


------=====Exercise 1.3 Show the supplier name and country for bottled products.
--SELECT p.ProductName AS 'Product Name', s.CompanyName AS 'Supplier Name', s.Country
--FROM Products p
--JOIN Suppliers s ON s.SupplierID = p.SupplierID
--WHERE QuantityPerUnit LIKE '%Bottle%'


----=====Exercise 1.4 Number of products per category in descending order
--SELECT CategoryName AS 'Category Name'
--, COUNT (c.CategoryName) AS '# of products in category'  
--FROM Products p
--JOIN Categories c ON c.CategoryID = p.CategoryID
--GROUP BY c.CategoryName
--ORDER BY COUNT (c.CategoryName) DESC


----=====Exercise 1.5 UK Employees by name
--SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Employee Name'
--, City
--FROM Employees
--WHERE Country = 'UK'


----=====Exercise 1.6 Sales Totals for all Sales Regions
--SELECT r.RegionDescription AS 'Region Name',
--ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),2) AS 'Region Sales Total'
--FROM [Order Details] od
--JOIN Orders o ON o.OrderID = od.OrderID
--JOIN EmployeeTerritories et ON et.EmployeeID = o.EmployeeID
--JOIN Territories t ON t.TerritoryID = et.TerritoryID
--JOIN Region r ON r.RegionID = t.RegionID
--GROUP BY RegionDescription
--HAVING SUM(od.UnitPrice*od.Quantity*(1-od.Discount))>=1000000

--SELECT r.RegionDescription,
--ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)), 2) AS 'Sales Total'
--FROM Region r
--JOIN Territories t ON t.RegionID = r.RegionID
--JOIN EmployeeTerritories et ON et.TerritoryID = t.TerritoryID
--JOIN Orders o ON o.EmployeeID = et.EmployeeID
--JOIN [Order Details] od ON od.OrderID = o.OrderID
--GROUP BY r.RegionDescription
--HAVING SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) >=1000000



----=====Exercise 1.7 US or UK 100+ freights
--SELECT COUNT (*) AS '# of Freights', ShipCountry
--FROM Orders
--WHERE Freight > 100.00 AND (ShipCountry = 'UK' OR ShipCountry = 'USA')
--GROUP BY ShipCountry


----=====Exercise 1.8 Order With Highest Discount Amount
----==========I use select top 2 as the product with highest discount amount was requested.
----==========Two orders have the same discount
--SELECT TOP 2 OrderID AS 'Order ID'
--, MAX (Discount * UnitPrice * Quantity) AS 'Discount Amount'
--FROM [Order Details]
--GROUP BY OrderID
--ORDER BY 2 DESC
----------Used "Order by 2" as a shortcut to order by the second column