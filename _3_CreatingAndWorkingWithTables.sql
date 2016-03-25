/*FOREIGN KEY CONSTRAINT
Foreign key 2 tabloyu ili�kilendirir. Bu y�zden References Key olarak da adland�r�l�r. Yani tablonun bir sat�r�n�, sat�rdaki bir s�tun de�erine g�re referans tablodaki bir sat�r ile ili�kilendirir. Referance tabloda kullanabilece�imiz tek s�tun Primary Key s�tunudur. Bu tablodaki bir sat�r di�er tablodaki sadece bir sat�r ile ili�kilendirilebilir. Zaten Foreing Key'in amac� bir birinden ba��ms�z tablolar aras�nda tablo b�t�nl��� olu�turmak. Bu y�zden Foreing Key'in uyguland��� s�tuna de�er olarak referans tablonun Primary s�tunda olmayan bir de�er girmeye �al���rsak hata al�r�z. (Bir tabloyu 2 ye b�lmek i�in de kullanabiliriz. Sonu�da tablo b�t�nl���n� korumak i�in kullan�l�yor.)

Tabloyu olu�tururken Foreign Key ekleme -> Tan�mlad���m�z bir s�tundan sonra Forign Key References Di�er_tablo_ad�(Primary Key'i) yazmak yeterlidir.
Tabloyu olu�turduktan sonra Foreign Key ekleme-> Alter ile tabloyu 2. derste g�sterlidi�i gibi d�zenlememiz gerekiyor. 

http://stackoverflow.com/questions/83147/whats-wrong-with-foreign-keys
*/

alter table tblPerson --> Foreign Key'in olu�turulaca�� tablo
add constraint tblPerson_GenderID_FK Foreign key --> Ekleneek Constraint'in ad�
(GenderId) --> �stteki tablonun Foreign Key olacak s�tunlar�.
references tblGender(ID) --> referansdaki tablonun Primary Key s�tunu.


sp_renameDB 'sample1','Sample'
Use [Sample]
Go
Create table tblGender
(
ID int not null primary key,
Gender nvarchar(50) not null
)


