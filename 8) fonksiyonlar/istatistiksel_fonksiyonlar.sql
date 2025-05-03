
--Ortalama almak için AVG() kullanýlýr
SELECT AVG(SALARY) FROM EMPLOYEES;

--Okumasý kolay olsun diye ROUNT fonksiyonu ile ondalýklý sayý duyarlýlýðýný 2 haneye düþürdük
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

--en yüksek maaþý getirir
SELECT MAX(SALARY) FROM EMPLOYEES;

--En düþük maaþý getirir
SELECT MIN(SALARY) FROM EMPLOYEES;

--çalýþanlarýn toplam maaþýný getirir
SELECT SUM(SALARY) FROM EMPLOYEES;

--Tablodaki kolonlarýn kaç satýr veri içerdiðini sayar. COUNT(*) da yazýlabilir
SELECT COUNT(SALARY) FROM EMPLOYEES;

--standart sapmasýný verir
SELECT STDDEV(SALARY) FROM EMPLOYEES;
SELECT ROUND(STDDEV(SALARY),2) FROM EMPLOYEES;--virgülden sonra 2 hane yazsýn dedik

--maaþlarýn varyansýný bulur
SELECT VARIANCE(SALARY) FROM EMPLOYEES;


--GROUP BY verileri gruplayarak bi hizaya getirmeye yarar
--HAVING komutu istatistiksel hesaplamalar yaparken where yerine kullanýlýr. WHERE  yazýnca hata alýrsýn
SELECT 
department_ýd DEPARTMAN
,COUNT(*) "ÇALIÞAN SAYISI"
,SUM(SALARY) AS "TOPLAM MAAÞ"
,ROUND(AVG(SALARY)) ORTALAMA
FROM EMPLOYEES 
HAVING COUNT(SALARY)>1
GROUP BY department_ýd
ORDER BY department_ýd;

--OVER methodu kümülatif toplama(adým adým toplama) yapmaya yarar. Kullanýlýdðýnda fonksiyona yapýþýk kullanýlmasý gerekiyor. orneðin "SUM(MAAS)OVER(ORDER BY ISIM)" gibi
SELECT fýrst_name ,salary
,SUM(SALARY)OVER( ORDER BY FIRST_NAME)"TOPLAYARAK LÝSTELEME"
FROM EMPLOYEES;


--her departmanýn çalýanlarýnýn maaþlarýný kümülatif toplar. her yeni departmanda yeniden toplar.
SELECT 
FIRST_NAME,SALARY,DEPARTMENT_ID,
SUM(SALARY)OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY)"BÖLÜM BÖLÜM TOPLAYARAK ÝLERLEME"
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID;




