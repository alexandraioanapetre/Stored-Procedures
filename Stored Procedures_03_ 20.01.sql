--Exercices--

create procedure pFactorial
@n int  
as
begin
declare @i int = 1;
declare @r int = 1;
while @i<= @n
begin
set @r = @r * @i;
set @i = @i + 1;
end
print @r
end;
go

exec pFactorial 5



create or alter procedure IsLeapYear 
@Year int
as
begin
if(@Year % 4 = 0 and @Year % 100 <> 0) or @Year % 400 = 0)
print 'Leap Year';
else
print 'Not a Leap Year';
end;
go

exec 'IsLeapYear';


select *
from dictionary

-- for - pentru
-- not - nu
-- on - pe
-- with - cu
-- he - el
-- as - ca
-- at - la
-- but - dar
-- from - din
-- we - noi
-- she - ea

create or alter procedure uspAddWord 
@englishword  varchar(128), 
@romanianword varchar(128)
as
begin
	if exists(select * from dictionary where englishword = @englishword)
		print 'the word is already in the dictionary'
	else 
		insert into dictionary(englishword,romanianword) values(@englishword,@romanianword);
end;
go

execute uspAddWord @englishword= 'of', @romanianword='de';
execute uspAddWord @englishword= 'I', @romanianword = 'eu';
execute uspAddWord @englishword= 'for', @romanianword = 'pentru';
execute uspAddWord @englishword= 'not', @romanianword = 'nu';
execute uspAddWord @englishword= 'on', @romanianword = 'pe';
execute uspAddWord @englishword= 'with', @romanianword = 'cu';
execute uspAddWord @englishword= 'he', @romanianword = 'el';
execute uspAddWord @englishword= 'as', @romanianword = 'ca';
execute uspAddWord @englishword= 'at', @romanianword = 'la';
execute uspAddWord @englishword= 'but', @romanianword = 'dar';
execute uspAddWord @englishword= 'from', @romanianword = 'din';
execute uspAddWord @englishword= 'we', @romanianword = 'noi';
execute uspAddWord @englishword= 'she', @romanianword = 'ea';

select * from dictionary

declare @i int;
select @i = id from dictionary
where 1=0
order by id desc;
print @i;

select * from dictionary
where englishword = 'for'

declare @word varchar(100);
select @word=romanianword from dictionary
where englishword = 'for'
print @word;

select * from dictionary
where englishword = 'for'

declare @word varchar(100);
select @word=romanianword from dictionary where englishword = 'not'
if @word is null
print 'The word is not in the dictionary'
else
print @word;

select * from dictionary 

--exec uspTranslateENRO @englishword= 'not' -> nu
--exec uspTranslateENRO @englishword= 'nothing' -> 'The word is not in the dictionary'

Create procedure uspTranslateENRO
@englishword varchar(100)
as
begin
declare @word varchar(100);
select @word=romanianword from dictionary
where englishword = @englishword
if @word is null
print 'The word is not in the dictionary'
else 
print @word;
end;
go

exec uspTranslateENRO @englishword= 'not'
 





