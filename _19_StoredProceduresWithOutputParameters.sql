/*OUT PARAMETRES� �LE DEPOLANMI� ��LEM OLU�TURMA
As'den �nce @ParameterName type out. 
Bu parametre Procedure'den return de�erinden farkl� bir sonu� daha ��kmas�n� sa�lar.

Output parametreli Procedure parametre olarak de�erini ��karaca�� bir Field bekler. Bu y�zden ilk �nce bir field olu�turup bunu Procedure'a vermeliyiz. Procedure'de out put de�i�kenine att���m�z de�er bu filed'a al�n�r.
Sql'de bir Field tan�mlamak i�in Declare kelimesini kullan�r�z. -> Declare ParametreAd� t�r�
Not: Tan�mlad���m�z Field'� Procedure'e verirken out anahtar� ile birlikte vermezsek hata al�r�z.
Not: Procedure birden fazla parametre istiyorsa ve parametre s�ras�n� bilmiyorsak, de�erleri parametrelere, Procedure'� olu�tururken kulland���m�z Parametre isimlerini kullanarak verebilriz.
*/
/*System Stored Procedure
sp_Help: Procedure'nin parametreleri, paramaetrelerin t�rleri, Procedure olu�turulma tarihi, gibi bilgileri veriyor. 
sp_Depends: Stored Procedure'nin kulland�� tablolar ve s�tunlar� hakk�nda bilgi verir. 
Bu System Stored Procedure'� t�m SQL nesneleri i�in kullanabiliriz.
*/

Create Procedure spGetPersonelCountByGender
@Gender nvarchar(20),
@PersonelCount int out
as
begin
	select @PersonelCount = COUNT(ID) FROM tblPersonel where Gender = @Gender
end

Declare @TotalCount int
Execute	spGetPersonelCountByGender 'Male',@TotalCount output

if(@TotalCount is null)
	Print '@TotalCount is null'
else
	Print '@TotalCount is not null'

Print @TotalCount

Declare @TotalCount int
Execute	spGetPersonelCountByGender @EmployeeCount = @TotalCount out,@Gender ='Male'
Print @TotalCount 

sp_Help spGetPersonelCountByGender
sp_Help tblPersonel
sp_Helptext spGetPersonelCountByGender
sp_Depends tblPersonel
sp_Depends spGetPersonelCountByGender
-- I want to drop tblPersonel table if I delete tblPersonel table and If I execute this store Procedure what happens I will throw an error ��nk� This Stored Procedure using that table an if that table is not present, obviously We get an eror
