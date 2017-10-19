--ica08 Rkwok2--

--q1--
select TOP 1 CompanyName as 'Supplier Company Name', Country from Suppliers --TOP 1 selects first row of ordered table
order by Country
go

--q2--
select TOP 2 CompanyName as 'Supplier Company Name', Country from Suppliers --Since organized alphabetically, Australia always be near the top until depleted
order by Country
go

--q3--
select TOP 10 PERCENT ProductName as 'Product Name', UnitsInStock as 'Units in Stock' from Products --Checks top 10% 
order by [Units in Stock] desc
go

--q4-- NOT Complete
select CompanyName as 'Customer Company Name', Country from Customers 
where CustomerID in (select TOP 8 CustomerID --Top 8 must be applied in the select statement but the ordering is for the freight
					 from Orders
					 order by Freight desc --Note that this will elminate ties from the columns reducing it to six
					)
					

go

--q5--
select CustomerID, OrderID, CONVERT(varchar,OrderDate,106) as 'Order Date' from orders
where OrderID in (select TOP 3 OrderID 
					 from [Order Details]
					 order by Quantity desc) 
				
go

--q6--
select CustomerID, OrderID, CONVERT(varchar,OrderDate,106) as 'Order Date' from orders
where OrderID in (select TOP 3 with ties OrderID --ties includes values that are equal
					 from [Order Details]
					 order by Quantity desc) 
				
go

--q7--
select CompanyName as 'Supplier Company Name', Country from Suppliers
where SupplierID in (select SupplierID
					 from Products
					 where ProductID in (select Top 1 Percent ProductID
										 from [Order Details]
										 order by (UnitPrice*Quantity) desc
										 )
					)
go
					 

