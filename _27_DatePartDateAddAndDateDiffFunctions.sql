/*DATePART(), DATENAME(),
2 site 2 parametre al�r. 1. Parametre Tarihin b�l�m� 2. Tarih.
DATAPART(): Tarihin bir b�l�m� verir(INT).
DATENAME(): Tarihin bir b�l�m�n�n ad�n� verir(STRING).
*/
/*DateAdd()
Tarihe bir�ey eklemek i�in kullan�l�r.3 parametre al�r.
1. Parametre Tarihin tarih eklenecek b�l�m�
2. Ne kadar eklenece�ini belirten say�(say� positif veya negatif olabilir.)
3. tarihin kendisi
Not: G�n eklerken bir sonraki aya ge�me durumu i�in ay�n ka� �ekti�i dikkate al�n�r.
*/
/*DateDiff()
�ki tarih aras�ndaki fark� buluyor
3 Paremetre al�yor.
1. Parametre Tarih fark� al�nacak tarih b�l�m�
2. ba�lang�� tarihi
3. biti� tarihi
Not: Date Part olarak Year veya Month verdi�imizde sadece y�l/ay de�erlerini birbirinden ��kar�l�r ve fark� verir. Yani aylar aras�ndaki ger�ek fark� bulmak i�in g�ne bak�lmaz ve y�llar aras�ndaki ger�ek fark� bulmak i�in ay ve g�ne bak�lmaz. Sadece Ay ve y�l de�erleri bir birinden ��kar�l�r. Bu durumda fazladan 1 ay veya 1 y�l sonu� alabiliriz. Fakat g�nler aras�ndaki fark� bulmak i�in Month'a bak�l�r.
*/
Select DATEPART(weekday, '2012-08-30 19:45:31.793')
Select DATENAME(weekday, '2012-08-30 19:45:31.793')

Select DateAdd(DAY, 20, '2012-08-30 19:45:31.793') 
-- Returns 2012-09-19 19:45:31.793
Select DateAdd(DAY, -20, '2012-08-30 19:45:31.793') 
-- Returns 2012-08-10 19:45:31.793

Select DATEDIFF(MONTH, '11/30/2005','01/31/2006') -- returns 2
Select DATEDIFF(DAY, '11/30/2005','01/31/2006') -- returns 62

CREATE FUNCTION fnComputeAge(@DOB DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN

DECLARE @tempdate DATETIME, 
@years INT, 
@months INT, 
@days INT
SELECT @tempdate = @DOB
												--Burada yapt���m�z i�: Eski olan tarihin ay� b�y�kse veya aylar ayn� iken g�n� b�y�kse y�l Datediff ile bulunan y�l vark�ndan bir ��kartmak. ��nk� bu durumda bir y�ldan az oluyor. Datediff bunu hesaplamad��� i�in bir y�l fazla verebiliyor.
SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)
													  -- Bir ilk tarihdeki ay�n g�n� �imdikinden b�y�k ise bir ay ��kart�yoruz.
SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - CASE WHEN DAY(@DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

DECLARE @Age NVARCHAR(50)
SET @Age = Cast(@years AS  NVARCHAR(4)) + ' Years ' + Cast(@months AS  NVARCHAR(2))+ ' Months ' +  Cast(@days AS  NVARCHAR(2))+ ' Days Old'
RETURN @Age

End