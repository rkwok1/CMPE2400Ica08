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
where CustomerID in (select CustomerID
					 from Orders
					 where Freight in ( select Distinct Top 8 Freight 
										from Orders 	
										order by Freight
									  )
									  
					)
					

go

--q5--
select CustomerID, OrderID, CONVERT(varchar,OrderDate,106) from orders
where OrderID in (select OrderID
				  from  [Order Details]
				  where Quantity in(  Quantity
				 )
				 ) 
				
go

