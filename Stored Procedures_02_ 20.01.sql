create table dictionary(id int primary key identity(1,1) not null,
                        englishword varchar(128) not null,
						romanianword varchar(128) not null);

--create procedure uspAddWord @englishword varchar(128), @romanianword varchar(128)

drop procedure if exists uspAddWord;
go
Create procedure uspAddWord
@englishword varchar(128),
@romanianword varchar(128)
as
begin
if exists(select * from dictionary where englishword = @englishword)
print 'the word is already in the dictionary'
else
insert into dictionary(englishword, romanianword) values(@englishword,@romanianword);
end;
go


execute uspAddWord @englishword= 'of', @romanianword='de';
select * from dictionary


--1. Add Two Numbers
--exec AddNumbers 10, 20
--30

create or alter procedure AddNumbers
@n1 int,
@n2 int
as
begin
print (@n1+@n2);
end;
go
exec AddNumbers 10,20


--2.Multiply Two Numbers
--exec MultiplyNumbers 10,20
--200

create procedure uspMultiplyNumbers
@n1 int,
@n2 int
as
begin
print (@n1*@n2);
end;
go
exec uspMultiplyNumbers 10,20;

---3. Convert Temperature from Celsius to Fahrenheit
--formula: F = Celsius * 1.8 +32

create procedure ConvertCtoF
@celsius dec(10,2)
as
begin
declare @f dec(10,2);
set @f = @celsius * 1.8 +32;
print @f;
end;
go
exec ConvertCToF 0


--4. Check if a Number is Even
-- Exec CheckEvenOdd 10
-- The number is even

create procedure CheckEvenOdd
@n int
as
begin
if @n % 2 = 0
print 'Even'
else
print 'Odd'
end;
go
exec CheckEvenOdd 10

--5. Concatenate Two Strings
-- exec ConcatenateStrings 'ab', 'cd'
-- abcd

create procedure ConcatenateStrings
@s1 varchar(100),
@s2 varchar(100)
as
begin
print concat(@s1,@s2);
end;
go
exec ConcatenateStrings 'ab', 'cd'

--6. Calculate the Lenght of a String
-- exec StringLenght('Paul');
-- 4

create procedure StringLenght
@s1 varchar(100)
as
begin
print len(@s1)
end;
go
exec StringLenght 'Paul';

--7. Reverse a String -- exec ReverseString 'luna' -- anul

create procedure ReverseString
@s1 varchar(100)
as
begin
print reverse(@s1)
end;
go
exec ReverseString 'luna'

--8. Calculate Power of a Numbers 2^4 --POWER

create procedure PowerNmb
@x int,
@n int
as
begin
print power(@x,@n);
end;
go
exec PowerNmb 10,2

--sa se numeasca Ping --sa afiseze Ping
--Pong -- sa afiseze Pong
--PingPong (Ping, Pong)
Ping
Pong

Create procedure Ping
as
begin
print 'Ping'
end;
go

Create procedure Pong
as
begin
print 'Pong'
end;
go

create procedure PingPong
as
begin
exec Ping;
exec Pong;
end;
go

exec PingPong



