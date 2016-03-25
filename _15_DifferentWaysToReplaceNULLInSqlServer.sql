/*IsNull(): 1. parametre olarak ald��� Filed Null ise, 2. parametresindeki de�eri d�nderilir, de�i�se birinci parametredeki de�er d�nderilir. Yani Null durumlar�n varsay�lan de�erini belirliyoruz.
--> 16.Ders
COALESCE(): isNull ile ayn� mant�kla �al���yor fakat daha g��l�.  ��nk� daha fazla paramatre girebiliriz. 1. parametre bo�sa 2. ye bakar 2. bo��a 3. ye bakar oda bo��a bir mesaj yazd�rabiliriz.
coalesce(FistName,MiddleName,LastName)

Case When Expression  Then 'true iken' else 'false iken'
*/

select * from tblEmployee

select		E.Name AS EMPLOYEE,M.Name AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId

                               COALESCE('PRAG�M','NO MANAGER')
select		E.Name AS EMPLOYEE,ISNULL(M.Name,'NO MANAGER')AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId

--CASE WHEN Expression THEN '' ELSE '' END
                                --Manager name null ise||o zaman Manager yok||De�ilse manager var
select		E.Name AS EMPLOYEE, CASE WHEN M.Name IS NULL THEN 'NO MANAGER' ELSE M.Name END AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId