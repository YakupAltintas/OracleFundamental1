SELECT department_name
,LOWER(DEPARTMENT_NAME)--küçüh harflere çevirir

,UPPER(DEPARTMENT_NAME)--BÜYÜK HARFLERE ÇEVÝRÝR

,INITCAP(DEPARTMENT_NAME)--Her kelimenin baþ harfini büyük yapar

,SUBSTR(DEPARTMENT_NAME,1,3)--1. karakterden itibaren 3 karakter al demek,sadece baþlangýcý belirtirsen baþlangýçtan itibaren tðmðnð alýr

,SUBSTR(DEPARTMENT_NAME,-1,3)--tersten sayarak ayný iþlemleri yapar

,LENGTH(DEPARTMENT_NAME)--string kolonunun uzunluðunu verir

,INSTR(DEPARTMENT_NAME,'a')--stringde a harfini arar ilh geçen yerin sýra numarasýný verir

,INSTR(DEPARTMENT_NAME,'a',2,3)--stringde 2. karakterden baþlar, aranan kelimeyi 3. kez bulduðunda yerini gösterir

,REPLACE(department_name,'a','A') -- demartment_name kolunundaki küçük a harflerini büyük A harfine dönüþtürdü,sadece listede görünür deðiþtirmez, deðiþtirmek istersek update komutuyla beraber kullanýrsak deðiþir

FROM DEPARTMENTS;

SELECT 
--Translate komutu þifreleme için kullanýlýr.
TRANSLATE('Oracle dersleri','acdr','tk31')-- karakter karakter okuma yapar ve deðiþtirir replace gibi bütün halde aramaz. sonucumuz bu olur -> 'O1tkle 3e1sle1i'
FROM DUAL;

SELECT LAST_NAME
,RPAD(LAST_NAME,30,'*')--stringi sað tarafýna yýldýz koyarak 30 karaktere tamamlar
,LPAD(LAST_NAME,30,'*')--stringi sol tarafýna yýldýz koyarak 30 karaktere tamamlar
,RTRIM(LAST_NAME)--saðýnda boþluk varsa temizler
,LTRIM(LAST_NAME)--solunda boþluk varsa temizler
,TRIM(' ' from LAST_NAME)--saðýnda solunda boþluk varsa temizler
FROM EMPLOYEES;


SELECT 
CONCAT(FIRST_NAME,LAST_NAME)--iki stringi birleþtirir 
FROM EMPLOYEES;

SELECT 
FIRST_NAME ||' '|| LAST_NAME --2 kolonu birleþtirdik. br sýnýr yok istediðimiz kadar yazabiliriz
FROM EMPLOYEES;



