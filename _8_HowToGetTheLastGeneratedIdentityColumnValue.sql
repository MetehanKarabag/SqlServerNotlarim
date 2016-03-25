/* Bir tablonun olu�turulan son sat�r�ndaki Identity de�erini almam�z� sa�layan methodlar ve bu methodlar aras�ndaki farklar� g�rece�iz.
Bu methodlar aralar�ndaki fark etki alanlar�d�r.
->Session : Sql'de New Query Windows a�t���m�zda veri taban�na bir ba�lant� a�m�� oluruz ve buna session denir. 
->Scope: �al��ma ortam� demek ve bir Scope'da ger�ekle�en i� ba�ka bir i�i tetikliyorsa, di�er i�, i�i tetikleyen Scope'un kulland��� Session'� kullan�r. her Query penceresi bir Scope'dur.

scope_identity(): Identity de�erini alaca��m�z kay�t methodun �al��t�r�ld��� ayn� Session ve Scope'da eklenen kay�td�r. Yani Sadece ge�erli Query penceresinde eklenen son kayd� g�rebilir.
@@identity: �al��t��� Session i�inde eklenen son kayd� ve bu Session arac�l��� ile tetiklenen fark� Scope'daki kayd� g�rebilir. Hangisi Scope'daki kay�d en son eklenmi�se onu al�r�z.
Ident_Current(TableName): Her hangi bir ortamda eklenmi� son kay�t de�erini alabiliriz.

*/

--------------------1. i� tablolar� olu�turmak-------------
Use Sample8
Go
Create Table Test1
(
ID int identity(1,1),
Value nvarchar(20)
)
Create Table Test2
(
ID int identity(1,1),
Value nvarchar(20)
)



Insert into Test1 values('X')
select	SCOPE_IDENTITY () 	 
Insert into Test1 values('X')
select SCOPE_IDENTITY ()
Select @@IDENTITY

Create Trigger trForInsert on Test1 for insert
as
Begin
	Insert into Test2 values('YYYY')
End

select * from Test1
select * from Test2

Insert into Test1 values('X')

select SCOPE_IDENTITY ()
Select @@IDENTITY

Insert into Test2 values('zzz')


select SCOPE_IDENTITY ()
Select @@IDENTITY
select IDENT_CURRENT('Test2')

Select * from Test1
Select * from Test2

Insert into Test1 values('X')
Select * from Test1
Select * from Test2

select SCOPE_IDENTITY ()
Select @@IDENTITY
select IDENT_CURRENT('Test2')