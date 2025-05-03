SELECT 
fýrst_name,
NVL(commýssýon_pct,0)-- NULL kontrolü yapar, deðer null ise yerine 0 yazdýrýr.Yerine yazdýrmak istediðimiz deðer kolon tipiyle ayný veri tipinde olmalýdýr.
FROM EMPLOYEES;

SELECT 
fýrst_name,
NVL2(commýssýon_pct,1,0)-- NULL kontrolü yapar, deðer null ise yerine 1 yazdýrýr,null ise 0 yazar.Yerine yazdýrmak istediðimiz deðer kolon tipiyle ayný veri tipinde olmalýdýr.
FROM EMPLOYEES;

SELECT 
fýrst_name,
SALARY,
commýssýon_pct,
NULLIF(SALARY - commýssýon_pct,SALARY)-- parametreler eþit ise null deðeri alýr, eþit deðil ise 1. parametrenin deðerini alýr.
FROM EMPLOYEES;

SELECT 
GREATEST(1,43,54,656,7,88,23)--verilen parametrelerin en büyüðünü yazdýrýr. sonuç = 656

,GREATEST('ahmet0','hasim','mahmut','zehra')--alfabetik sýraya göre en sonda olaný getirir. sonuç =zehra

,LEAST(1,43,54,656,7,88,23)--verilen parametrelerin en küçüðünü yazdýrýr. sonuç = 1

,LEAST('ahmet0','hasim','mahmut','zehra')--alfabetik sýraya göre en sonda olaný getirir. sonuç = ahmet0
FROM DUAL;


SELECT last_name, department_ýd,
DECODE(department_ýd,10,'muhasebe',20,'satýþ','diðer')//department_id 10 ise muhasebe,20 ise satýþ, geri kalanýna ise diðer yazdýrýr. istediðimiz kadar tanýmlama yapabiliriz bir sýnýr yok

FROM EMPLOYEES order by department_ýd;


--CASE kullanýmý da DECODE ile ayný iþe yarar case yazýlýr sonra hangi kolon refereans alýnacaksa yazýlýr sonra id kaç olduðun ne yazýlsýn onu yazarýz,
--else kýsmýnda geri kalan kýsma ne yazsýn onu yazarýz ve end kýsmýyla da yeni oluþturulan kolona isim veririz
SELECT 
LAST_NAME,DEPARTMENT_ID,
CASE DEPARTMENT_ID
WHEN 10 THEN 'IT'
WHEN 20 THEN 'DEV'
WHEN 30 THEN 'FRONTEND'
ELSE 'DIGER'
END AS DEPARTMENT
FROM EMPLOYEES ORDER BY DEPARTMENT_ID;


--kullanýcýnýn kullanýcý id sini ve kullanýcý adýný listeler
SELECT UID ,USER FROM DUAL;

--kullanýcý adýný verir
SHOW USER;

--Bu fonksiyon genelde loglamada kullanýlýr önemlidir
SELECT SYS_CONTEXT('USERENV','SESSION_USER') AS USERNAME   
,SYS_CONTEXT('USERENV','ISDBA')AS "ADMÝN YETKÝSÝ"
,SYS_CONTEXT('USERENV','HOST')AS "HOSTNAME"
,SYS_CONTEXT('USERENV','INSTANCE')AS "KAÇ VERÝTABANI ÖRNEÐÝ VAR"
,SYS_CONTEXT('USERENV','IP_ADDRESS')AS "IP ADRESÝ"
,SYS_CONTEXT('USERENV','DB_NAME')AS "VERÝTABANI ADI"

FROM DUAL;


