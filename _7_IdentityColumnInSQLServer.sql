/*Identity Column
Bir s�tun identity olarak ayarland�rsa, her yeni sat�r i�in s�tunun de�erleri otomatik olarak olu�turulur. B�r �dentity s�tun olu�turmak i�in s�tunu tan�mlad�ktan sonra identity key word'�n� kullanmak gerekir. identity(1,1) gibi kullanarak ba�kaln�� de�erini ve ka�ar ka�ar artaca��n� da belirleyebiliriz.

Identity bir s�t�na elle de�er giremeyiz. Girebilmek i�in SET IDENTITY_INSERT tabloAdi ON -> Elle de�er girmemize izin verir. Off ya�t���m�zda tekrar engeller. 
Not: Identity s�tuna de�er girmeyi izin verirsek, kullanaca��m�z insert sorgusuna tablo ad�ndan sonra de�er girmek i�in kullanaca��m�z t�m s�tun adlar�n� belirlemeliyiz.

Not: Bir s�tunun �dentity olup olmad���na s�tuna sa� t�klay�p Properties penceresinden bakarak anlayabiliriz.

Bir tablodaki t�m sat�rlar� sildi�imizde Identity de�erleri silinmez. Bu y�zden silip yeni bir kay�t ekledi�imizde de�er 1 den ba�lamaz. Bu sorunu ��zmek i�in 
-> dbcc checkident(TabloAdi, RESEED, 0) �al��t�rmam�z gerekiyor.(Bu t�m tabloyu s�f�rlar)

*/
--Delete ile tablodaki t�m verileri sildik.
Delete from tblPerson1

--IDENTITY yi s�f�rlad�k.
dbcc checkident(tblPerson1, RESEED, 0)

SELECT * FROM dbo.tblPerson
select * from dbo.tblPerson

insert into dbo.tblPerson1 values ('Sara')
Delete from dbo.tblPerson1 where PersonID = 1

select * from dbo.tblPerson1

insert into dbo.tblPerson1(PersonID, Name) values (1,'Jhon')



