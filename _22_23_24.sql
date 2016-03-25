/*Part 22 - System (String) Functions
T�m system functionlar > Programmability > Functions> System Functions i�indedir.
Bu derste �ok kullan�lan String Function'lar� g�rece�iz.
Ascii('ABC'): Parametre olarak ald��� String'in Acsii kodunu(int) verir.(SADECE �LK HARF)
Char(65): Acsii kodu(int) karaktere(String) �evirir.
LTrim('      Hello'): Sol taraftaki bo�luklar� siliyor.
select RTrim('HELLO      '):Ayn� durum sa�dan.
Lower('ABC') ve UPPER('abc'): Biri karakterleri b�y�t�yor biri karakterleri k���lt�yor.
Reverse('AMA'): ��indeki yaz�y� ters �eviriyor.
Len('a'): Parametre olarak ald��� String'in boyunu al�yor.

--Part 23
Left, Right, CharIndex ve SubString Function
Left('ABCDE', 3) ve Right('ABCDE', 3): Biri soldan biri sa�dan 3 karakteri d�nderiyor.
CharIndex('Expression_To_Find', 'Expression_To_Search', 'Start_Location(optional)'):Birinci parametrede belirledi�imz karakterin ikinci parametredeki konumun Index de�erini d�ner.1 den ba�lar.
SubString('Expression', 'Start', 'Length'): 1. Parametredeki String'de, 2. parametrede belirtiLen Index'den SONRAKi karakterlerden, 3. parametrede belirtiLen say� kadar karakter al�r.

--Part 24
Replicate, Space Patindex,Replace,Stuff Functions
Replicate('asd ',5):1. parametredeki string'i 2. parametredeki kadar tekrarlar. -> email'i gizlemek i�in kullan�lm��
Space(5): Kullan�ld��� yere parametre olarak ald��� say� kadar bo�luk ekler.
Patindex('%@aaa.com%',Email):1. parametrede belirlenen string 2. parametreye gelen de�er i�inde aran�r, bulunursa belirleti�imiz string'in ilk karakterinin Index de�erini d�ner, bulunmassa 0 d�ner. CharIndex'e benzer. Fakat CharIndex'de % gibi i�aretleri kullanamay�z.
Replace(Email,'.com','.net'): 1. parametreye gelen string i�inde 2. parametrede belirledi�imiz string'i ar�yoruz bulursak, 3. parametredeki de�er ile de�i�tiriyoruz.
Stuff(Email,2,3,'*****'):1. parametreye gelen String'in 2. parametrede belirledi�imiz ba�lang�� Index'inden ba�layarak, 3. parametrede belirledi�imiz say�daki karakterini, 4. parametrede belirledi�imiz String ile de�i�tiriyoruz.
*/

Select Ascii('ABC')
select Char(65)
/*
B�y�k harflerin Ascii kodu -> 65 ile 90
K���klerin -> 97 ile 122
s�n�f�n -> 48
Declare @Start int
Set @Start = 65
while (@Start <= 90)
Begin
	Print Char(@Start)
	SET @Start = @Start+1 
End
*/
select LTrim('      Hello')

select RTrim('HELLO      ')

SELECT Lower('ABC') SELECT UPPER('abc')
select Reverse('AMA')
select Len('a')
Example: Select Left('ABCDE', 3) Output: ABC

Example: Select Right('ABCDE', 3) Output: CDE


Left('ABCDE', 3) Output: ABC
Right('ABCDE', 3) Output: CDE 

Select CharIndex('@','sara@aaa.com',1) Output: 5

Select SubString('John@bbb.com',5, 7) Output: bbb.com--HardCode
Select SubString('John@bbb.com',(CharIndex('@', 'John@bbb.com') + 1), (Len('John@bbb.com') - CharIndex('@','John@bbb.com'))) Output: bbb.com--Dinamik
-- Tabloda kullan�rken
Select SubString(Email, CharIndex('@', Email) + 1, Len(Email) - CharIndex('@', Email)) as EmailDomain, COUNT(Email) as Total from tblEmployee
Group By SubString(Email, CharIndex('@', Email) + 1, Len(Email) - CharIndex('@', Email))
 
 
Select	FistName, LastName,	SubString(Email,1,2)+ Replace('*',5) + SubString(Email, CharIndex('@',Email),Len(Email)-CharIndex('@',Email)+1) as Email from tblEmployee
select '     '
select Space(5)
--Patindex() Function
Select Email, Patindex('%@aaa.com',Email) as FistOccurence 
from tblEmployee
Where Patindex('%aaa.com',Email)>0 0 dan b�y�kleri al�yoruz.
--Replace() Function
select Email, Replace(Email,'.com','.net') as ConvertedEmail 
--Stuff() Funciton
Select FistName,LastName.Email,	STUFF(Email,2,3,'*****') as StuffedEmail 
