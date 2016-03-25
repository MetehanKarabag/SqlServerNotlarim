/*Bu derste Dml trigger> After insert'i Update sorgusu ile kullanaca��z. Ge�en derste Delete ve Insert i�in kullanm��t�k.
Update sorgusu 2 fark� durumu i�eriyor. -> Eski veri siliniyor, yeni veri ekleniyor. Bu y�zden Update sorgusu ile �al��an Trigger'�n Body'sinde �nsterted ve Deleted tablolar� kullanabiliriz.

Rapor i�in olu�turdu�umuz tabloya hangi sat�rlarda hangi de�erlerin g�ncelle�tirildi�ini g�stermemiz gerekiyor. Bu y�zden Inserted ve deleted tablolar�ndan adl���m�z verileri kar��la�t�r�p, farkl� de�erleri veren s�tunun eski ve yeni de�erini Rapor i�in olu�turdu�umuz tabloya at�yoruz.
*/
Create AFTER UPDATE trigger script:
Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End

Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 4

Alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
--Deleted ve Inserted tablodan ald���m�z verileri, kar��la�t�rmak i�in olu�turd��umuz field'lar.
	  Declare @Id int --> iki tabloda da de�er ayn� olaca�� i�in tek field yeter.
	  Declare @OldName nvarchar(20), @NewName nvarchar(20)
	  Declare @OldSalary int, @NewSalary int
	  Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
	  Declare @OldDeptId int, @NewDeptId int
	  Declare @AuditString nvarchar(1000) --> Bu Field Rapor tablosuna girece�imiz raporu belirliyor.
	  
	Select * into #TempTable from inserted --> Inserted tabloya gelen de�erleri kullanarak Local Temporary tablo olu�turuyoruz. 
	 
	  While(Exists(Select Id from #TempTable)) --> Ge�ici tabloda sat�r oldu�u s�rece d�n demek. Yani tablodaki sat�rlar� silmessek bu sonsuz bir d�ng� demek. Yani siliyoruz. Bu y�zden Temporary tablo olu�turduk.
	  Begin
			Set @AuditString = ''
		   
		   
			Select Top 1 @Id = Id, --> Instered Tablodaki ilk sat�r�n de�erlerini �stte olu�turdu�umuz field'lara al�yoruz.
						 @NewName = Name,
						 @NewGender = Gender, @NewSalary = Salary,
						 @NewDeptId = DepartmentId 
						 from #TempTable 
			
			Select 	@OldName = Name, 
					@OldGender = Gender, 
					@OldSalary = Salary, 
					@OldDeptId = DepartmentId
					from deleted where Id = @Id --> Ayn� sat�r�n eski de�erlerini �stte olu�turdu�umuz field'lara al�yoruz.
         
			--> Rapor tablosuna girece�imiz string'in ilk k�sm�(bunu �sttede belirleyebilirdik.)
			Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
			--> Bu string'in 2. k�sm�na sadece �zerinde de�i�iklik yapt���m�z s�tunlar� ekleyece�iz. Bu y�zden if ile �stdeki field'lara ald���m�z de�erleri kontrol ediyoruz.
			if(@OldName <> @NewName)	 Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
			if(@OldGender <> @NewGender) Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
			if(@OldSalary <> @NewSalary) Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
			if(@OldDeptId <> @NewDeptId) Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
		   
			insert into tblEmployeeAudit values(@AuditString)
			
			--> D�ng�de bu tabloyu kullan�yoruz ve ge�erli sat�r� siliyoruz. B�ylece 2. sat�r ilk sat�r oluyor ve �stteki select sorgusu ilk sat�r� al�yor.
			Delete from #TempTable where Id = @Id
	  End
End 