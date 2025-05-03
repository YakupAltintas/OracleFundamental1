SELECT 
f�rst_name,
NVL(comm�ss�on_pct,0)-- NULL kontrol� yapar, de�er null ise yerine 0 yazd�r�r.Yerine yazd�rmak istedi�imiz de�er kolon tipiyle ayn� veri tipinde olmal�d�r.
FROM EMPLOYEES;

SELECT 
f�rst_name,
NVL2(comm�ss�on_pct,1,0)-- NULL kontrol� yapar, de�er null ise yerine 1 yazd�r�r,null ise 0 yazar.Yerine yazd�rmak istedi�imiz de�er kolon tipiyle ayn� veri tipinde olmal�d�r.
FROM EMPLOYEES;

SELECT 
f�rst_name,
SALARY,
comm�ss�on_pct,
NULLIF(SALARY - comm�ss�on_pct,SALARY)-- parametreler e�it ise null de�eri al�r, e�it de�il ise 1. parametrenin de�erini al�r.
FROM EMPLOYEES;

SELECT 
GREATEST(1,43,54,656,7,88,23)--verilen parametrelerin en b�y���n� yazd�r�r. sonu� = 656

,GREATEST('ahmet0','hasim','mahmut','zehra')--alfabetik s�raya g�re en sonda olan� getirir. sonu� =zehra

,LEAST(1,43,54,656,7,88,23)--verilen parametrelerin en k�����n� yazd�r�r. sonu� = 1

,LEAST('ahmet0','hasim','mahmut','zehra')--alfabetik s�raya g�re en sonda olan� getirir. sonu� = ahmet0
FROM DUAL;


SELECT last_name, department_�d,
DECODE(department_�d,10,'muhasebe',20,'sat��','di�er')//department_id 10 ise muhasebe,20 ise sat��, geri kalan�na ise di�er yazd�r�r. istedi�imiz kadar tan�mlama yapabiliriz bir s�n�r yok

FROM EMPLOYEES order by department_�d;


--CASE kullan�m� da DECODE ile ayn� i�e yarar case yaz�l�r sonra hangi kolon refereans al�nacaksa yaz�l�r sonra id ka� oldu�un ne yaz�ls�n onu yazar�z,
--else k�sm�nda geri kalan k�sma ne yazs�n onu yazar�z ve end k�sm�yla da yeni olu�turulan kolona isim veririz
SELECT 
LAST_NAME,DEPARTMENT_ID,
CASE DEPARTMENT_ID
WHEN 10 THEN 'IT'
WHEN 20 THEN 'DEV'
WHEN 30 THEN 'FRONTEND'
ELSE 'DIGER'
END AS DEPARTMENT
FROM EMPLOYEES ORDER BY DEPARTMENT_ID;


--kullan�c�n�n kullan�c� id sini ve kullan�c� ad�n� listeler
SELECT UID ,USER FROM DUAL;

--kullan�c� ad�n� verir
SHOW USER;

--Bu fonksiyon genelde loglamada kullan�l�r �nemlidir
SELECT SYS_CONTEXT('USERENV','SESSION_USER') AS USERNAME   
,SYS_CONTEXT('USERENV','ISDBA')AS "ADM�N YETK�S�"
,SYS_CONTEXT('USERENV','HOST')AS "HOSTNAME"
,SYS_CONTEXT('USERENV','INSTANCE')AS "KA� VER�TABANI �RNE�� VAR"
,SYS_CONTEXT('USERENV','IP_ADDRESS')AS "IP ADRES�"
,SYS_CONTEXT('USERENV','DB_NAME')AS "VER�TABANI ADI"

FROM DUAL;


