/* GROUP BY
Group by bir tablo s�tununun ayn� de�erleri i�eren sat�rlar�n� de�er ad� alt�nda gruplama i�ini yapar ve kullan�lan sorgu gruplanm�� sat�rlar �zerinde �al���r. Group by Aggregate Function'lar ile birlikte kullan�l�r -> sum(), count(), min()...

select City, SUM(Salary) as TotalSalary
from tblPersonel
Group By City -- Grup yapt� city ile maa��

Bir s�tundaki de�ere g�re baz� sat�rlar� gruplama i�lemine almay� istemiyorsak, Where kullanabiliriz. Where Group By'dan �nce yaz�d�r. Ayn� i�i Having kullanarak da yapabiliriz fakat Having Group By'dan sonra yaz�l�r
Farklar�
1. Where kullan�rken tablodan ko�ula uyan t�m sat�rlar al�n�r ve gruplama yap�l�r.
	Having kullan�rken Tablodaki t�m sat�rlar gruplan�r ve gruplar�n ko�ula uyan sat�rlar� i�leme girer.
2. Where t�m sorgular ile �al���r, Having sadece Select ile �al���r.
3. Where'e Aggregate Function veremeyiz fakat Having'e verebiliriz.


Not: GROUP BY'a birden fazla s�tun verebiliriz. Bu durumda Distinct gibi belirledi�imiz gruba girecek sat�rlar�n 2 s�tun de�erininde beklendi�i gibi olmas� gerekir.
Not: S�tunlar�n sorguya eklenme s�ras� ile GRUOP BY s�ras� ayn� olmal�. Veri t�rleri farkl� de�ilse hata varmez ama yanl�� sonu� ��kar.

COUNT(): parametre olarak bir s�tun verip sat�r say�s�n� alabiliriz.
Order By: Group By ile birlikte kullan�ld���nda, Group By'dan sonra yaz�l�r ve s�ralama Gruplanm�� s�tunlar ile yap�labilir.

Bir s�tuna Aggregate Function uygulay�p sorguya eklersek sorgu sonucu isimsiz bir s�tun ile g�sterilir. Bu y�zden takma ad vermeliyiz. -> as TakmaAd Takma ad birden fazla kelimeden olu�uyorsa aray bo�luk koymak i�in ad� [] i�inde yazmal�y�z.

*/


select * from tblPersonel
select SUM (Salary) from tblPersonel

select City,SUM(Salary) as TotalSalary
from tblPersonel
Group By City 

Select count (ID) from	 tblPersonel

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
Group by Gender, City
Order by City

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
where Gender = 'Male'
Group By Gender,City
Having Gender = 'Male'

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
Group By Gender,City
HAV�NG SUM(Salary) >5000 kullan�labilir -- bu olur

Select * from tblPersonel where SUM (Salary) > 4000 --bu olmaz