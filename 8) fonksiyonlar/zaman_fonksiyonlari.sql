--current_date ba�land���n yerin zaman ve tarih bilgisini verir
--sysdate veritaban�n� zaman ve tarih bilgisini verir
SELECT CURRENT_DATE,SYSDATE FROM DUAL;

--Kulland��� zaman�n b�lge ad�n� yazar
SELECT SESSIONTIMEZONE FROM DUAL;

//b�lge saatini 1 saat ileriye ald�k
ALTER SESSION SET TIME_ZONE = '+2:0';

--Zaman damgas�d�r
SELECT SYSTIMESTAMP FROM DUAL;

--TO_CHAR fonksiyonu ile tarihle ilgili �zel isteklerde bulunabiliriz
SELECT  SYSDATE,
TO_CHAR(SYSDATE,'D')"Haftan�n ka��nc� g�n�"
,TO_CHAR(SYSDATE,'DD')"Ay�n ka��nc� g�n�" 
,TO_CHAR(SYSDATE,'DDD')"Y�l�n ka��nc� g�n�" 
,TO_CHAR(SYSDATE,'day')"Hangi g�ndeyiz"
,TO_CHAR(SYSDATE,'dy')"k�sa g�n ismi"
,TO_CHAR(SYSDATE,'w')"ay�n haftas�"
,TO_CHAR(SYSDATE,'ww')"y�l�n haftas�"
,TO_CHAR(SYSDATE,'mm')"ay numaras�"
,TO_CHAR(SYSDATE,'mon')"ay ismi"
,TO_CHAR(SYSDATE,'yyyy')"y�l "
,TO_CHAR(SYSDATE,'hh24:mi:ss')"saat dakika saniye"
,TO_CHAR(SYSDATE,'dd,mm,yyyy hh24:mi:ss')"tarih saat"---istedi�imiz �ekilde konfigre edebiliriz
FROM dual;

