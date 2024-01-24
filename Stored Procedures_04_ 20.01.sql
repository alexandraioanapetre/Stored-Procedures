use TSQLV4

select top 10
*
from sales.Customers

--uspGetCustomer @custid
--exec uspGetCustomer 1

create procedure uspGetCustomer
@custid int
as
begin
select * from Sales.Customers
where custid = @custid;
end;
go

exec uspGetCustomer 1

--GetCustomerOrders -> companyname, contactname, phone din tabelul Sales.Customers
--orderdate din tabelul Sales.Orders

create or alter procedure GetCustomerOrders
@custid int
as
begin
select c.companyname, 
       c.contactname, 
	   c.phone,
       o.orderdate
from Sales.Customers c
join Sales.Orders o
on c.custid = o.custid
where c.custid = @custid;
end
go

exec GetCustomerOrders 1

select top 5 * from Sales.Orders

create or alter procedure GetCustomerOrders
@custid int
as
begin
--header
select c.companyname, 
       c.contactname, 
	   c.phone
from Sales.Customers c
where c.custid = @custid;

--details
select 
o.orderdate,
sum((1-od.discount)*od.unitprice*od.qty) as TotalAmount
from Sales.Orders o
join Sales.OrderDetails od
on od.orderid = o.orderid
where o.custid = @custid
group by o.orderdate
end
go

exec GetCustomerOrders 1

