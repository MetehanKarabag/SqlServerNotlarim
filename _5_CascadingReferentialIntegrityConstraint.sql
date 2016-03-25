/*FORE�GN KEY'in kulland��� de�erleri silme
Referance tablodaki bir de�er Foreign Key'in uyguland��� s�tunda kullan�l�yorsa ve referans tablodan bu sat�r� silmeyi denersek hata al�r�z. Bunun nedeni referanse tabloda silme ve g�ncelleme i�lerine Foreign Key'in izin vermemesidir. Bu davran��� nedeni Foreign Key Relationships pencesesinin en alt�nda bulunan Insert and Update specification sekmesesindeki Delete ve update Role'un varsay�lan olarak No Action de�er almas�d�r. Verebilece�imiz 4 de�er var. 
1. No Action: ��lemin ger�ekle�tirilmesi durumunda hata verir.
2. Cascade: Referans tablodan silinen sat�r ile ili�kili t�m sat�rlar silinir.
3. Set Null: Foreing Key s�tununda ili�kili olan de�erler Null'a al�r. 
4. Set Default: Bu se�ene�i kullanabilmemiz i�in Foreing Key s�tun �zerinde �al��an bir Default Constraint olmas� gerekir. Referans tablodan silinen sat�r ile ili�kili Default Constraint'de belirledi�imiz varsay�lan de�eri al�r.
*/
select * from tblGender
select * from tblPerson

delete from tblGender WHERE ID = 2

