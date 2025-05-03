--current_date baðlandýðýn yerin zaman ve tarih bilgisini verir
--sysdate veritabanýný zaman ve tarih bilgisini verir
SELECT CURRENT_DATE,SYSDATE FROM DUAL;

--Kullandýðý zamanýn bölge adýný yazar
SELECT SESSIONTIMEZONE FROM DUAL;

//bölge saatini 1 saat ileriye aldýk
ALTER SESSION SET TIME_ZONE = '+2:0';

--Zaman damgasýdýr
SELECT SYSTIMESTAMP FROM DUAL;

--TO_CHAR fonksiyonu ile tarihle ilgili özel isteklerde bulunabiliriz
SELECT  SYSDATE,
TO_CHAR(SYSDATE,'D')"Haftanýn kaçýncý günü"
,TO_CHAR(SYSDATE,'DD')"Ayýn kaçýncý günü" 
,TO_CHAR(SYSDATE,'DDD')"Yýlýn kaçýncý günü" 
,TO_CHAR(SYSDATE,'day')"Hangi gündeyiz"
,TO_CHAR(SYSDATE,'dy')"kýsa gün ismi"
,TO_CHAR(SYSDATE,'w')"ayýn haftasý"
,TO_CHAR(SYSDATE,'ww')"yýlýn haftasý"
,TO_CHAR(SYSDATE,'mm')"ay numarasý"
,TO_CHAR(SYSDATE,'mon')"ay ismi"
,TO_CHAR(SYSDATE,'yyyy')"yýl "
,TO_CHAR(SYSDATE,'hh24:mi:ss')"saat dakika saniye"
,TO_CHAR(SYSDATE,'dd,mm,yyyy hh24:mi:ss')"tarih saat"---istediðimiz þekilde konfigre edebiliriz
FROM dual;

