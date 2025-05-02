--(SYS kulan�c� komutu!) YAKUP kullan�c�s� art�k rol tan�mlayabilir
GRANT CREATE ROLE TO YAKUP;

--R_SEL_UPT adl� bir rol olu�turduk
CREATE ROLE R_SEL_UPT;

--R_INS_DEL adl� bir rol olu�turduk
CREATE ROLE R_INS_DEL ;

--REGIONS tablosu �zerinde SELECT ve UPDATE yetkilerini R_SEL_UPT rol�ne tan�mlad�k.
GRANT SELECT,UPDATE ON REGIONS TO R_SEL_UPT;

--REGIONS tablosu �zerinde INSERT ve DELETE yetkilerini R_INS_DEL rol�ne tan�mlad�k.
GRANT INSERT,DELETE ON REGIONS TO R_INS_DEL;

--INSERT ve DELETE yapabilme yetkisini GOLDSTONE kullan�c�s�na verdik
GRANT R_INS_DEL TO GOLDSTONE;

--SELECT ve UPDATE yapabilme yetkisini JACOB kullan�c�s�na verdik
GRANT R_SEL_UPT TO JACOB;

--!!!(JACOB kulan�c� komutu)
SET ROLE R_SEL_UPT;

--!!!(GOLDSTONE kulan�c� komutu)
SET ROLE R_INS_DEL;

--(GOLDSTONE kulan�c� komutu)GOLDSTONE kullan�c�s� kay�t ekledi
INSERT INTO YAKUP.REGIONS VALUES(7,'ORMANATI0');
commit;

--(JACOB kullan�c� komutu) JACOB listeleme yapt�
SELECT * FROM YAKUP.REGIONS;

--rolden update yetkisini geri adl�k
REVOKE UPDATE ON REGIONS FROM R_SEL_UPT;

--JACOB kullan�c�s�ndan R_SEL_UPT rol�n� kald�rm�� olduk
REVOKE R_SEL_UPT FROM JACOB;

--R_SEL_UPT rol�n� sildik
DROP ROLE R_SEL_UPT ;