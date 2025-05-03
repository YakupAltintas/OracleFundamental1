
--Ortalama almak i�in AVG() kullan�l�r
SELECT AVG(SALARY) FROM EMPLOYEES;

--Okumas� kolay olsun diye ROUNT fonksiyonu ile ondal�kl� say� duyarl�l���n� 2 haneye d���rd�k
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

--en y�ksek maa�� getirir
SELECT MAX(SALARY) FROM EMPLOYEES;

--En d���k maa�� getirir
SELECT MIN(SALARY) FROM EMPLOYEES;

--�al��anlar�n toplam maa��n� getirir
SELECT SUM(SALARY) FROM EMPLOYEES;

--Tablodaki kolonlar�n ka� sat�r veri i�erdi�ini sayar. COUNT(*) da yaz�labilir
SELECT COUNT(SALARY) FROM EMPLOYEES;

--standart sapmas�n� verir
SELECT STDDEV(SALARY) FROM EMPLOYEES;
SELECT ROUND(STDDEV(SALARY),2) FROM EMPLOYEES;--virg�lden sonra 2 hane yazs�n dedik

--maa�lar�n varyans�n� bulur
SELECT VARIANCE(SALARY) FROM EMPLOYEES;


--GROUP BY verileri gruplayarak bi hizaya getirmeye yarar
--HAVING komutu istatistiksel hesaplamalar yaparken where yerine kullan�l�r. WHERE  yaz�nca hata al�rs�n
SELECT 
department_�d DEPARTMAN
,COUNT(*) "�ALI�AN SAYISI"
,SUM(SALARY) AS "TOPLAM MAA�"
,ROUND(AVG(SALARY)) ORTALAMA
FROM EMPLOYEES 
HAVING COUNT(SALARY)>1
GROUP BY department_�d
ORDER BY department_�d;

--OVER methodu k�m�latif toplama(ad�m ad�m toplama) yapmaya yarar. Kullan�l�d��nda fonksiyona yap���k kullan�lmas� gerekiyor. orne�in "SUM(MAAS)OVER(ORDER BY ISIM)" gibi
SELECT f�rst_name ,salary
,SUM(SALARY)OVER( ORDER BY FIRST_NAME)"TOPLAYARAK L�STELEME"
FROM EMPLOYEES;


--her departman�n �al�anlar�n�n maa�lar�n� k�m�latif toplar. her yeni departmanda yeniden toplar.
SELECT 
FIRST_NAME,SALARY,DEPARTMENT_ID,
SUM(SALARY)OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY)"B�L�M B�L�M TOPLAYARAK �LERLEME"
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID;




