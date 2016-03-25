/*Instead Of Update: 
Birden fazla tablo �zerinde �al��an bir View olu�turmak i�in yazd���m�z sorgu birden fazla tabloya Inster veya Update i�lemi yap�yorsa View hata verir. Fakat tek bir tablo �zerinde g�ncelleme yap�yorsak hata vermesede sonu� istedi�imiz gibi olmayabiliz.

Instead Of Update'de Insert ile ayn� mant�kla �al���yor. Fark Deleted tablonun eski veri ile dolu olmas�d�r.
*/

Update tblDepartment set DeptName = 'HR' where DeptId = 3

Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
Instead Of Update
as
Begin
--> t�m s�tunlar i�in bu kontrol� uyguluyoruz.
 if(Update(Id)) --> Update() methdu kullanc�n�n �al��t�rd��� sorgunun sorgudaki bir s�tunu g�ncelleyip g�ncellemedi�ini beliliyor.
 Begin
  Raiserror('Id cannot be changed', 16, 1) --> Id de�i�tirilemez.
  Return 
 End
 
 if(Update(DeptName)) --> View'�n DeptName s�tunu g�ncellenmi�se
 Begin
  Declare @DeptId int 

  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName --> yeni de�er tblDepartment Tablosunda varsa, varolan sat�r�n ID d�erini de�i�kene al(ge�en derste yapt�k.)
  
  if(@DeptId is NULL ) --> Id de�eri almam��sa hata ver.
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  --> Id de�eri varsa Employee tablosunu g�ncelle
  Update tblEmployee set DepartmentId = @DeptId --> DeptId insertted tablodan gelmedi�i i�in elle yazm���z.
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If gender is Updated
 if(Update(Gender))
 Begin
  Update tblEmployee set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If Name is Updated
 if(Update(Name))
 Begin
  Update tblEmployee set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
End

 
Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1

Update vWEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1


--------------------------------

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Update vWEmployeeDetails 
set Name = 'Johny', DeptName = 'IT'
where Id = 1

Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1