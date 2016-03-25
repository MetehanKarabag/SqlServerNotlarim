/*CHECK CONSTRA�NT
Bir S�tune girilebilecek de�eri s�n�rlamak i�in kullan�l�r.
Alter Table tblPerson
Add Constraint CK_tblPerson_Age 
check (AGE>0 and AGE<150) -> S�tun'u i�lemde belirledik.

Not: Null k�saylanabilir bir de�er olmad��� i�in Null girilirse kabul ediyor.
Not: Check Constraints penceresindeki > Table Designer > Check Existing Data... yes de�eri ald���nda konu�la uymayan sat�r varsa Constraint'i ekleyemeyiz.

Alter Table tblPerson
Add Constraint CK_tblPerson_Age check (AGE>0 and AGE<150)
*/

Use Sample6
Go
Create Table tblPerson
(
ID int Not null Primary key,
Name nvarchar(50) not null,
Email nvarchar(50) not null,
GenderId int null,
Age int null
)
select * from tblPerson
insert into tblPerson values(4,'Sara','s@s.com',2,-970)
insert into tblPerson values(5,'Sara','s@s.com',2,NULL)

Delete from tblPerson where ID = 4

Alter Table tblPerson
Drop Constraint CK_tblPerson_Age

Alter Table tblPerson
Add Constraint CK_tblPerson_Age check (AGE>0 and AGE<150)
