--Stored Procedures--
--What is a stored procedure? -A set of instructions to which we give a name. (we can reuse the code)
--(Alter - if we want to modify the stored procedure)--

Use DemoDB
go

create procedure uspHello
as begin
print 'Hello';
print 'From a stored procedure';
end;
go



alter procedure uspHello
@message varchar(128)
as
begin
print @message
end;
go

execute uspHello @message='Hello hello'


create procedure uspAdd
@a int,
@b int
as
begin
print (@a+@b)
end;
go
exec uspAdd 10,30;