/*Join
Belirledi�imiz bir ko�ula g�re farkl� 2 tablonun sat�rlar�n� e�le�tirilir ve e�le�tirilen sat�rlar� birle�tirerek tek bir sat�r halinde olu�turulacak tabloya eklenir.
Join Types
Join: 2 tablodan da sadece e�le�en sat�rlar� alarak tablo olu�turulur.
Left Join: Tablo, 2 tabloda da e�le�en sat�rlar + sol tablonun e�le�meyen sat�rlar�ndan olu�ur.
Right Join: Tablo, 2 tabloda da e�le�en sat�rlar + sa� tablonun e�le�meyen sat�rlar�ndan olu�ur.
Full Join: ko�ulu sa�layan sat�rlar birle�tirilerek ve ko�ulu sa�lamasada sol ve sa� tablo sat�rlar� eklenir.
Cross Join: On Key Word'� kullan�lmaz. Yani sol tablodaki sat�rlar� hepsi s�rayla sa� tablodaki t�m sat�rlar ile e�le�tirilir. Yani sol tabloda 10 sa� tabloda 4 sat�r varsa 40 sat�r sonu� ��kar

�nemli Not: Olu�turulacak tablo hem sol hemde sa� tablonun s�tunlar�n� i�erir. Left Table'�n e�le�meyen sat�r� sa� tabloda kar��l��� olmayan sat�rd�r. Bu sat�r� olu�turulacak tabloya ekliyorsak, sa� tablonun herhangi bir sat�r�nda de�er gelmedi�i i�in olu�turulacak sat�r�n sa� s�tunlar�ndaki t�m de�erler Null olur.(Ayns� Right Table i�inde ge�erli)
*/
--Yaz�m
select		ColumnList -- Anatablodan ve Eklenen tablodan g�rmek istedi�imiz s�tunlar� yaz�yoruz
from		LeftTable  -- Ana tabloyu belirliyoruz
joinType	RightTable -- Eklenecek tabloyu belirtiyoruz
on			JoinCondition -- Tablolarda e�le�menin hangi �tunlarada aranaca��n� belirtiyoruz.
--select ColumnList  from LeftTable join RightTable on JoinCondition 
--					 Join''in solu        sa��
select * FROM tblPersonel
select * FROM tblDepartment

--JOIN
select Name,Gender,Salary,DepartmentName
from tblPersonel
Join tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--LEFT JOIN/LEFT OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
LEFT JOIN tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--RIGHT JOIN/RIGHT OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
RIGHT JOIN tblDepartment 
On tblPersonel.DepartmentID = tblDepartment.ID

--FULL JOIN/FULL OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
FULL JOIN tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--CROSS JOIN
select Name,Gender,Salary,DepartmentName
from tblPersonel
CROSS JOIN tblDepartment

