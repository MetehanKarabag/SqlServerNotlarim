/*Cte Recursive (�z yinelemeli): Recursive Function 
*/
With
  EmployeesCTE (EmployeeId, Name, ManagerId, [Level]) --> Level Cte'e ekledi�imiz s�tun. level kelimesi Key Word oldu�u i�in [] i�inde yaz�yoruz. Cte i�inde kulland���m�z sorgulardan �yle bir de�er gelmiyor hata vermemesi i�in elle verece�iz.
  as
  (
    Select EmployeeId, Name, ManagerId, 1
    from tblEmployee
    where ManagerId is null --> 1.1 Buldu�umuz sat�r CTE'e eklenir.

    union all --> �stteki sorgunun sonucuna alttaki sorgunun sonucunu oldu�u gibi birle�tirecek.

    Select tblEmployee.EmployeeId, tblEmployee.Name, tblEmployee.ManagerId, EmployeesCTE.[Level] + 1 --> 3. E�le�menin sa�land��� Employee sat�r�n�n de�erleri ile CTE'deki sat�r�n Level s�tunundaki de�eri birle�tirip se�iyoruz. Se�ilenler CTE'e eklenecek. Level de�erini bir artt�rmak gerekiyor. ��nk� e�le�menin CTE'den ald���m�z de�erleri se�ilecek sat�ra ait de�il. Se�ilecek sat�ra ait olan de�er CTE'idekinin bir fazlas�. E�le�menin sa�land��� t�m sat�rlar CTE'e eklendi�i i�in CTE' tablosu b�y�r ve ayn� d�zen devam eder. Bu y�zden buna Recursive CTE deniyor.
    from tblEmployee
    join EmployeesCTE --> 1.2 CTE'e �steki sorgu ile eklenen sat�r� Employee tablosundaki baz� sat�rlar ile birle�tiriyoruz.
    on tblEmployee.ManagerID = EmployeesCTE.EmployeeId --> 2. Burada e�le�me mant���n� belirledik.(daha �nce g�stermi�ti)
	
  )
Select EmpCTE.Name as Employee, Isnull(MgrCTE.Name, 'Super Boss') as Manager, EmpCTE.[Level] 
from EmployeesCTE EmpCTE
left join EmployeesCTE MgrCTE
on EmpCTE.ManagerId = MgrCTE.EmployeeId


Create Table tblEmployee
(
  EmployeeId int Primary key,
  Name nvarchar(20),
  ManagerId int
)

Insert into tblEmployee values (1, 'Tom', 2)
Insert into tblEmployee values (2, 'Josh', null)
Insert into tblEmployee values (3, 'Mike', 2)
Insert into tblEmployee values (4, 'John', 3)
Insert into tblEmployee values (5, 'Pam', 1)
Insert into tblEmployee values (6, 'Mary', 3)
Insert into tblEmployee values (7, 'James', 1)
Insert into tblEmployee values (8, 'Sam', 5)
Insert into tblEmployee values (9, 'Simon', 1)

--Cte ile ayn� i�i yap�yor.
Select Employee.Name as [Employee Name],
IsNull(Manager.Name, 'Super Boss') as [Manager Name]
from tblEmployee Employee
left join tblEmployee Manager
on Employee.ManagerId = Manager.EmployeeId
