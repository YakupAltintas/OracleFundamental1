--(SYS kulanýcý komutu!) YAKUP kullanýcýsý artýk rol tanýmlayabilir
GRANT CREATE ROLE TO YAKUP;

--R_SEL_UPT adlý bir rol oluþturduk
CREATE ROLE R_SEL_UPT;

--R_INS_DEL adlý bir rol oluþturduk
CREATE ROLE R_INS_DEL ;

--REGIONS tablosu üzerinde SELECT ve UPDATE yetkilerini R_SEL_UPT rolüne tanýmladýk.
GRANT SELECT,UPDATE ON REGIONS TO R_SEL_UPT;

--REGIONS tablosu üzerinde INSERT ve DELETE yetkilerini R_INS_DEL rolüne tanýmladýk.
GRANT INSERT,DELETE ON REGIONS TO R_INS_DEL;

--INSERT ve DELETE yapabilme yetkisini GOLDSTONE kullanýcýsýna verdik
GRANT R_INS_DEL TO GOLDSTONE;

--SELECT ve UPDATE yapabilme yetkisini JACOB kullanýcýsýna verdik
GRANT R_SEL_UPT TO JACOB;

--!!!(JACOB kulanýcý komutu)
SET ROLE R_SEL_UPT;

--!!!(GOLDSTONE kulanýcý komutu)
SET ROLE R_INS_DEL;

--(GOLDSTONE kulanýcý komutu)GOLDSTONE kullanýcýsý kayýt ekledi
INSERT INTO YAKUP.REGIONS VALUES(7,'ORMANATI0');
commit;

--(JACOB kullanýcý komutu) JACOB listeleme yaptý
SELECT * FROM YAKUP.REGIONS;

--rolden update yetkisini geri adlýk
REVOKE UPDATE ON REGIONS FROM R_SEL_UPT;

--JACOB kullanýcýsýndan R_SEL_UPT rolünü kaldýrmýþ olduk
REVOKE R_SEL_UPT FROM JACOB;

--R_SEL_UPT rolünü sildik
DROP ROLE R_SEL_UPT ;