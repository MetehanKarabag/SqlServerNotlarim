/*
	MSDN'e g�re Sql server'de Join ve SubQuery kullanan sorgular�n aras�nda �o�unlukla performans farkl� yoktur. Yine MSDN'e g�re varl�k kontrol�n�n yap�ld��� baz� durumlarda Join'ler daha h�zl�d�r.
	Genellikle Join'ler sub-Query'lerden daha h�zl�d�r. Ger�ekte h�z� Sql Server'in olu�turdu�u �al��ma plan� belirler. Yani �nemli olan ne yazd���m�z de�il Sql Server'in neye �evirdi�i, Sorgular i�in ayn� plan kullan�l�yorsa ayn� derecede h�zl�d�r.
	Join'ler h�zl�d�r'a g�re �al��mak yerine client statistics'i ve execution plan'� a��kt�ktan sonra 2 sorguyuda �al��t�r�p hangisinin daha h�zl� oldu�una karar vermeliyiz.
    
	client statistics ve execution plan'� sonra anlatacak.
	
*/

Select Id, Name, Description
from tblProducts
where ID IN
(
 Select ProductId from tblProductSales
) 

CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; -- Clears query cache
Go
DBCC FREEPROCCACHE; -- Clears execution plan cache
GO

	
Select distinct tblProducts.Id, Name, Description
from tblProducts
inner join tblProductSales
on tblProducts.Id = tblProductSales.ProductId

	
Select Id, Name, [Description]
from tblProducts
where Not Exists(Select * from tblProductSales where ProductId = tblProducts.Id)

----Ayn� sorguyu 3 sn de �al��t�rd���mda 

Select tblProducts.Id, Name, [Description]
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL 
