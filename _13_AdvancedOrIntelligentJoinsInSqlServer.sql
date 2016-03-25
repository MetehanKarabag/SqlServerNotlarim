/*Join'ler olu�turulacak tabloya ko�ula uyan sat�rlar� her zaman ekler. Bu derste bu sat�rlar� ��kartarak sadece e�le�meyen sat�rlar ile tablo olu�turaca��z.
Left Join: Olu�turulacak tablo sadece sol tablonun e�le�meyen sat�rlar�ndan olu�acak. E�le�menin sa�lanamamas� i�in sol tablodaki kar��la�t�rma s�tunundaki de�erin Null yada ge�ersiz olmas� gerekir. Bu i�i Where'e 2 farkl� ko�ul vererek yapabiliriz. 
1. sol tablodaki kar��la�t�rma s�tunun de�eri Null'sa diyebiliriz. Fakat ge�ersiz de�er alan s�tunlar� sonuca eklenmez.
2. E�le�me sa�lanmad���nda olu�turulacak sat�r�n sa� tablo s�tunlar� Null de�eri alaca��n� s�ylemi�tik. Yani sat�r�n herhangi bir sa� s�tunu Null'sa kesinlikle bu sat�r e�le�meyen sol tablo sat�rd�r.

Right Join: �stdeki ile ayn� mant�k.
Full Join: Bu durumda almay� istedi�imiz sat�rlar�n ya sa� s�tunlar�n�n yada sol s�tunlar�n�n bo� olmas� gerekir. Where'e or ile kullanarak yapabiliriz.

Not: Kar��la�t�rma s�tunun Primary Key gibi Null olamayacak bir s�tun ise 1. yol i�e yaramaz. Fakat kar�� tablodan hi� bir de�er al�nmad��� i�in 2. yol her zaman i�e yarar.
*/

Select * from tblPersonel
Select * from tblDepartment

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
Left join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
WHERE		tblPersonel.DepartmentID is NULL
--Where		tblDepartment.ID �S NULL

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
RIGHT join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
where		tblDepartment.ID = 4
--WHERE		tblPersonel.DepartmentID is NULL

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
FULL join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
WHERE		tblPersonel.DepartmentID is NULL
or			tblDepartment.ID iS NULL
