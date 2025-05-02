--(ADM�N YETK�S� GEREK�R!)GOLDSTONE adl� bir kullan�c� olu�turdu
CREATE USER GOLDSTONE IDENTIFIED BY GOLDSTONE;

--Kullan�c�n�n tablolar�n�n�n listesini verir.
SELECT TABLE_NAME  FROM TABS;

--GOLDSTONE kullan�c�s�na oturum a�ma ve ba�lanma yetkisi verdik.
GRANT CONNECT,RESOURCE TO GOLDSTONE;

--GODLSTONE kullan�c�s�na kendi tablomuzu listeleme yetkisi verdik
GRANT SELECT ON REGIONS TO GOLDSTONE;

--GOLDSTONE kullan�c�s�ndan yakup kullanc�s�n�n tablolar�n� sorgulad�k
SELECT * FROM YAKUP.reg�ons;

--(TABLO SAHIBI VERIR)GOLDSTONE kullan�c�s�na INSERT yetkisi verdik
GRANT INSERT ON REGIONS TO GOLDSTONE;

--GOLDSTONE kullan�c�s� yakup kullanc�s�n�n tablosuna ekleme yapabildi
INSERT INTO yakup.regions (REGION_ID,REGION_NAME)values(6,'Antartika');

--GOLDSTONE  kullan�c�s�na delete ve update yetkileri verildi ve WITH GRANT OPTION k�sm� ile yetkilerini ba�ka bir kullan�c�ya da devredebilir hale geldi
GRANT UPDATE,DELETE ON REGIONS TO GOLDSTONE WITH GRANT OPTION;    

--Hangi kullan�c�ya ne yetki verilmi� onu g�sterir
SELECT * FROM USER_TAB_PRIVS_MADE;

--GOLDSTONE kullan�c�s�n�n select yetkisini geri ald�k
REVOKE SELECT ON REGIONS FROM GOLDSTONE;


--UPDATE ve DELETE yetkilerini geri ald�k
REVOKE DELETE,UPDATE ON REGIONS FROM GOLDSTONE;

--Ba�lanma yetkisi olan t�m kullan�c�lara select izni verdik.
GRANT SELECT ON REGIONS TO PUBLIC;
