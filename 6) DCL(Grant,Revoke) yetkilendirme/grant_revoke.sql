--(ADMÝN YETKÝSÝ GEREKÝR!)GOLDSTONE adlý bir kullanýcý oluþturdu
CREATE USER GOLDSTONE IDENTIFIED BY GOLDSTONE;

--Kullanýcýnýn tablolarýnýnýn listesini verir.
SELECT TABLE_NAME  FROM TABS;

--GOLDSTONE kullanýcýsýna oturum açma ve baðlanma yetkisi verdik.
GRANT CONNECT,RESOURCE TO GOLDSTONE;

--GODLSTONE kullanýcýsýna kendi tablomuzu listeleme yetkisi verdik
GRANT SELECT ON REGIONS TO GOLDSTONE;

--GOLDSTONE kullanýcýsýndan yakup kullancýsýnýn tablolarýný sorguladýk
SELECT * FROM YAKUP.regýons;

--(TABLO SAHIBI VERIR)GOLDSTONE kullanýcýsýna INSERT yetkisi verdik
GRANT INSERT ON REGIONS TO GOLDSTONE;

--GOLDSTONE kullanýcýsý yakup kullancýsýnýn tablosuna ekleme yapabildi
INSERT INTO yakup.regions (REGION_ID,REGION_NAME)values(6,'Antartika');

--GOLDSTONE  kullanýcýsýna delete ve update yetkileri verildi ve WITH GRANT OPTION kýsmý ile yetkilerini baþka bir kullanýcýya da devredebilir hale geldi
GRANT UPDATE,DELETE ON REGIONS TO GOLDSTONE WITH GRANT OPTION;    

--Hangi kullanýcýya ne yetki verilmiþ onu gösterir
SELECT * FROM USER_TAB_PRIVS_MADE;

--GOLDSTONE kullanýcýsýnýn select yetkisini geri aldýk
REVOKE SELECT ON REGIONS FROM GOLDSTONE;


--UPDATE ve DELETE yetkilerini geri aldýk
REVOKE DELETE,UPDATE ON REGIONS FROM GOLDSTONE;

--Baðlanma yetkisi olan tüm kullanýcýlara select izni verdik.
GRANT SELECT ON REGIONS TO PUBLIC;
