-- REGIONS tablosununun kolonlarını gösterdik
DESC REGIONS;

--REGIONS tablosuna bir değer ekledik
INSERT INTO REGIONS VALUES(1,'EUROPE');

--Regions tablosuna bir kolon daha ekledik.
ALTER TABLE REGIONS ADD POPULATE NUMBER(15);

--REGIONS tablosuna 2. veriyi ekledik ve eklediğimiz kolonu yazmadık ama hata vermez
INSERT INTO REGIONS(region_id,region_name) VALUES(2,'ASIA');

--populate kolonunu sildik.
ALTER TABLE REGIONS DROP COLUMN populate;


--COUNTRIES tablosuna değer girdik.
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('TR','TURKİYE',1);

--COUNRTIES  tablosuna değer girdik. region_id kısımna sadece 1 ve 2 eğer eklediğimiz için farklı bir değer giremeyiz.3 girsek hata verir.
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('KT','KIBRIS',1);

--Tabloya rusyayı da ekledik.
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('RS','RUSYA',2);



