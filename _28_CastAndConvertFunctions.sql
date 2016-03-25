/*CAST(),CONVERT(): iki Function da ald��� parametreyi bir t�re �evirir.
Kullan�lmalar�

CAST( expression AS data_type [ ( length ) ] )
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
iki methodda da Length [] i�inde yaz�lm�� bu optional parametre oldu�una gelir. �evirme sonucunun ka� karakterden olu�aca��n� belirlemek i�in kullanabiliriz.
Ayr�ca Convert() metodunun Style optional parametresi �evrilme �eklini belirler.
Derste DateTime de�er string'e �evirilirken Style parametreye 103 verilmi� buna benzer say�lar tarih format�n� belirler.
Not: Stype parametresi sadece nvarchar veya varchar'a �evirme i�leminde �al���r. Parametre ald���m�z de�eri Date'e �evirirsek �al��m�yor.

Kullan�m yerleri
1 - Cast() Ansi'ye dayal�, Convert() SQL Server'a �zeldir. Yani ba�ka ortamlarada da �al��acak bir kod yazmay� istiyorsak Cast()'� kullanmay�z.
2 - Convert() methodun Style parametresinden faydalanmay� istemiyorsak Cast()'� kullanmal�y�z.
*/


Select Id, Name, DateOfBirth, CAST(DateofBirth as nvarchar) as ConvertedDOB 
from tblEmployees
Select Id, Name, DateOfBirth, Convert(nvarchar, DateOfBirth) as ConvertedDOB 
from tblEmployees

SELECT CONVERT(VARCHAR(10),GETDATE(),101)

SELECT CAST(GETDATE() as DATE)
SELECT CONVERT(DATE, GETDATE())


Select Id, Name, Name + ' - ' + CAST(Id AS NVARCHAR) AS [Name-Id] 
FROM tblEmployees

Select CAST(RegisteredDate as DATE) as RegistrationDate, COUNT(Id) as TotalRegistrations 
From tblRegistrations 
Group By CAST(RegisteredDate as DATE) --> Date'e �evirip gruplad���m�z i�in g�n/ay/y�l de�erlerine g�re gruplama yap�yor. �evirme i�lemini yapmasayd�k, ald���m�z de�erlerin mili saniyeye kadar ayn� olmas� gerekirdi.