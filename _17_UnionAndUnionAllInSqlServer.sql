/*UNION VE UNION ALL
Join'ler sat�rlar� birle�tirir. Union ve Union All'da tablolar�. Birle�tirme i�leminin yap�labilmesi i�in 2 tablonundan al�nan s�tunlar� t�r�,say�s�, s�ras�n�n ayn� olmas� gerekir. ��nk� biri int di�eri nvarchar() olursa ayn� s�tun'da tutulamaz.

UNION ALL: �lk tablonun t�m sat�rlar�n� al�r ve ikinci tablonun t�m sat�rlar�n� sonuna ekler.
UNION : 2 tabloyu birle�tirir, birle�tirilmi� sat�rlar� s�ralar ve t�m de�erleri ayn� olan sat�rlar varsa sadece bir tanesini g�sterir.

Union s�ralama ve silme i�lemi yapt��� i�in s�re %63 uzuyor. Bu Union'un �al��ma plan�nda Distinct Sort an�nda ger�ekle�iyor.
Scope'daki sorgunun �al��ma plan�n� g�r�nt�lemek i�in -> Estimated query Execution Plan:  Ctrl + L. 
Not: S�ralama i�lemi yapmay� istiyorsak tablolar birle�tirildikten sonra yapmam�z gerekiyor. Bu y�zden en sona yaz�yoruz.
*/

select *o from tblIndiaCustomers
Union all
select * from tblUSCustomers
order by Name

Select Id, Name, Email from tblIndiaCustomers
UNION
Select Id, Name, Email from tblUKCustomers

Select Id, Name, Email from tblIndiaCustomers
UNION ALL
Select Id, Name, Email from tblUKCustomers
UNION ALL
Select Id, Name, Email from tblUSCustomers
Order by Name -- s�ralama sonda olmal�