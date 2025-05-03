SELECT department_name
,LOWER(DEPARTMENT_NAME)--k���h harflere �evirir

,UPPER(DEPARTMENT_NAME)--B�Y�K HARFLERE �EV�R�R

,INITCAP(DEPARTMENT_NAME)--Her kelimenin ba� harfini b�y�k yapar

,SUBSTR(DEPARTMENT_NAME,1,3)--1. karakterden itibaren 3 karakter al demek,sadece ba�lang�c� belirtirsen ba�lang��tan itibaren t�m�n� al�r

,SUBSTR(DEPARTMENT_NAME,-1,3)--tersten sayarak ayn� i�lemleri yapar

,LENGTH(DEPARTMENT_NAME)--string kolonunun uzunlu�unu verir

,INSTR(DEPARTMENT_NAME,'a')--stringde a harfini arar ilh ge�en yerin s�ra numaras�n� verir

,INSTR(DEPARTMENT_NAME,'a',2,3)--stringde 2. karakterden ba�lar, aranan kelimeyi 3. kez buldu�unda yerini g�sterir

,REPLACE(department_name,'a','A') -- demartment_name kolunundaki k���k a harflerini b�y�k A harfine d�n��t�rd�,sadece listede g�r�n�r de�i�tirmez, de�i�tirmek istersek update komutuyla beraber kullan�rsak de�i�ir

FROM DEPARTMENTS;

SELECT 
--Translate komutu �ifreleme i�in kullan�l�r.
TRANSLATE('Oracle dersleri','acdr','tk31')-- karakter karakter okuma yapar ve de�i�tirir replace gibi b�t�n halde aramaz. sonucumuz bu olur -> 'O1tkle 3e1sle1i'
FROM DUAL;

SELECT LAST_NAME
,RPAD(LAST_NAME,30,'*')--stringi sa� taraf�na y�ld�z koyarak 30 karaktere tamamlar
,LPAD(LAST_NAME,30,'*')--stringi sol taraf�na y�ld�z koyarak 30 karaktere tamamlar
,RTRIM(LAST_NAME)--sa��nda bo�luk varsa temizler
,LTRIM(LAST_NAME)--solunda bo�luk varsa temizler
,TRIM(' ' from LAST_NAME)--sa��nda solunda bo�luk varsa temizler
FROM EMPLOYEES;


SELECT 
CONCAT(FIRST_NAME,LAST_NAME)--iki stringi birle�tirir 
FROM EMPLOYEES;

SELECT 
FIRST_NAME ||' '|| LAST_NAME --2 kolonu birle�tirdik. br s�n�r yok istedi�imiz kadar yazabiliriz
FROM EMPLOYEES;



