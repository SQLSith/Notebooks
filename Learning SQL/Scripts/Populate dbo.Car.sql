if exists (Select * from information_Schema.tables where TABLE_NAME = 'Car' and TABLE_SCHEMA = 'dbo')
begin
	drop table dbo.Car
end 

Create table dbo.Car
(
CarId	int identity(1,1),
Registration varchar(15),
Colour	varchar(50),
NumberOfDoors tinyint
)


Declare @Letters table (Letter char(1))
Declare @Numbers table (Number char(1))
Declare @Colours table (Colour varchar(20))
Declare @DoorCount table (Doors tinyint)

insert	@Letters VALUES ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('J'),('K'),('L'),('M'),('N'),('P'),('Q'),('R'),('S'),('T'),('U'),('V'),('W'),('X'),('Y')
insert	@Numbers VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9')
insert	@Colours Values ('Red'),('White'),('Black'),('Blue'),('Green'),('Silver')
insert	@DoorCount values (2), (4)


insert	dbo.Car ([Registration], [Colour], [NumberOfDoors]) 
Select top 100 
		l1.Letter + l2.Letter + n1.Number + n2.Number + ' ' + n3.Number + l3.Letter + l4.Letter [Registration],
		c.Colour,
		d.Doors NumberOfDoors
from	@Letters l1
cross join @Letters l2
cross join @Letters l3
cross join @Letters l4
cross join @Numbers n1
cross join @Numbers n2
cross join @Numbers n3
cross join @Colours c
cross join @DoorCount d
order by newid()


Select * from dbo.Car