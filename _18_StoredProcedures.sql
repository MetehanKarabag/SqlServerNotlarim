/* STORED PROCEDURES
STORED PROCEDURES bir grup T_SQL a��klamas�d�r.

Yaz�m�
Create PROC/PROCEDURE procedureAd�
-> Parametreli Procedure olu�turmay� istiyorsak parametreleri burada parametre ad�n�n �n�ne @ koyarak yazmal�y�z.
as
Begin
	i�
End

SQL'de bir NESNE'yi d�zenlerken her zaman oldu�u gibi ALTER kullan�yoruz

�al��t�rma
Procedure ad�n�n �n�ne Exec/Execute yazarak ve ya hi� bir �ey yazmadan �al��t�rabiliriz. Parametreli bir Procedure'u �al��t�r�yorsak, girece�imiz parametrelerin s�ras� olu�turma s�ras� ile ayn� olmal�d�r.

System Strored Procedure: sp_ �n eki ile olurlar bizde bu �n ek ile olu�turabiliriz. Fakat bu kar���kl�klara neden olu� bu y�zden yapm�yoruz.
Sp_Helptext Prodecure'nin olu�turulma metnini verir.
Stored Procedure'yi �freleme: AS anahtar kelimesinden hemen �nce With Encryption yazarsak PROCEDURE olu�turulma metnini alamay�z.(Alman�n bir yolu var sonra g�rcez bunlar�.)
*/
use Sample18
go
select * from tblPersonel

CREATE PROCEDURE spGetPersonel
as
begin
	select Name,Gender from tblPersonel
end

spGetPersonel


create procedure spGetPersonelByGenderandDepartment
@Gender nvarchar(20),
@DepartmentID int
as
Begin
	select Name,Gender,DepartmentID FROM tblPersonel WHERE Gender = @Gender
	and DepartmentID = @DepartmentID
end
select * from tblPersonel

spGetPersonelByGenderandDepartment 'Male',1


sp_helptext spGetPersonel
Alter PROCEDURE spGetPersonel
as 
begin
 select Name,Gender from tblPersonel order by Name
end
Drop proc spGetPersonel


sp_helptext spGetPersonelByGenderandDepartment
Alter procedure spGetPersonelByGenderandDepartment  
@Gender nvarchar(20),  
@DepartmentID int  
With Encryption
as  
Begin  
 select Name,Gender,DepartmentID FROM tblPersonel WHERE Gender = @Gender  
 and DepartmentID = @DepartmentID  
end
