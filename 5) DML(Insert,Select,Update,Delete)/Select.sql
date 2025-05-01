-- Basit sorgu
select * from employees;

--Hangi kolon isminin listeleneceðini biz seçiyoruz 
select MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL from employees;

--Kolon isimlerini listelerken deðitirdik
select MANAGER_ID MNG,FIRST_NAME ADI,LAST_NAME SOYADI,EMAIL POSTA from employees;

--Kolon isimlerinin boþluklu bir isimden oluþmasýný istiyorsak týrnak kullanmalýyýz
select MANAGER_ID "Yönetici No",FIRST_NAME "Adý",LAST_NAME "Aile adý",EMAIL "E Mail" from employees;

-- departman id si 90 olan kayýtlar listelenir
select * from employees where department_id =90;

-- departman id'si 90 ve 100 olan kayýtlarý getirir
select * from employees where department_id = in(90,100);

-- departman id'si 90 ve 100 olan kayýtlarý getirir (daha performanslýdýr diðerinden)
select * from employees where department_id = 90 or department_ýd=100;

--Adý St ile baþlayanlarý listeledi
select * from employees where FIRST_NAME LIKE 'St%';

--Ýsminde t harfi geçenleri listeledi
select * from employees where FIRST_NAME LIKE '%t%';

--Ýsmi t harfiyle bitenleri listeledi
select * from employees where FIRST_NAME LIKE '%t';

-- Ýsminin 2. harfi a 4. harfi e olan isimleri listeledi
SELECT * FROM employees where FIRST_NAME LIKE '_a_e%';

-- Maaþý 10000 den büyük olanlar ve commission_pct kýsmý null olmayanlarý listeledik
select * from employees where salary > 10000 and COMMISSION_PCT IS not null;

--önce isme göre sýralar sonra ayný sisimde adam varsa soyada göre sýralar. asc yazmasak da olur
select manager_id,first_name,last_name,email from employees order by first_name asc, last_name asc;

--önce isme göre sýralar sonra ayný sisimde adam varsa soyada göre sýralar. Kolon ismi yerine sýrasý da yazýlabilir,asc yazmasak da olur
select manager_id,first_name,last_name,email from employees order by 2 asc, 3 asc;

--departmaný 100 olan verileri maaþlarýna göre sýraladýk
select * from employees where department_id =100 order by salary asc;

--HÝTERARÞÝK DÜZENDE SORGULAR--

--employee_id ve manager_id kýsýmlarýný iliþkilendirdi ve ona göre listeleme yaptý.(yöneticisi olmayan satýrlarý getirmedi,primary key ve foreign key iliþkisi yaptý)
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID FROM EMPLOYEES CONNECT BY PRIOR employee_ýd=manager_ýd;

--iliþkilendirme yaptý ve alt üst iliþkisine göre seviyesini yazdý, en üst birim 0 olmuþ oldu bi altý 1 fala öyle gider.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES CONNECT BY PRIOR employee_ýd=manager_ýd;

--rütbe iliþkisi kurarken START WITH komutuyla en tepedeki yöneticiyi belirttik ve level sýralamasýný ona göre yaptý
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES 
START WITH employee_ýd=100 
CONNECT BY PRIOR employee_ýd=manager_ýd;

--hiyerarþik sýrayý bozmadan rütbe iliþkisinden sonra soyadýna göre sýralar
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES 
START WITH employee_ýd=100 
CONNECT BY PRIOR employee_ýd=manager_ýd
ORDER SIBLINGS BY LAST_NAME;

--Üs iliþkilerini aðaç þeklinde gösteren kolonu oluþturma
--Adým 1: Çalýþanlarý listele
SELECT FIRST_NAME FROM EMPLOYEES;

--Adým 2: Çalýþanlarýn üs iliþkilerini yap
SELECT FIRST_NAME FROM EMPLOYEES CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Adým 3: Üs iliþkilerini LEVEL kullanarak belirt
SELECT FIRST_NAME,LEVEL FROM EMPLOYEES CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Adým 4: En üstteki yöneticiyi belirterek sýralamayý saðladýk
SELECT FIRST_NAME,LEVEL FROM EMPLOYEES START WITH employee_ýd=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Adým 5: Sýralama kolonu oluturduk ve sýralamasýný gösterdik
SELECT FIRST_NAME,LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')sýralama FROM EMPLOYEES START WITH employee_ýd=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


--Adým 6: CONNECT_BY_ROOT() komutu en tepedeki yöneticiyi getirir.
SELECT FIRST_NAME,CONNECT_BY_ROOT(FIRST_NAME),LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')sýralama FROM EMPLOYEES START WITH employee_ýd=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


--Adým 7: where koþulu ekledik. 100 departmanýnýn yöneticileri geldi
SELECT FIRST_NAME,CONNECT_BY_ROOT(FIRST_NAME),LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')sýralama FROM EMPLOYEES 
WHERE department_ýd =100
START WITH employee_ýd=100 
CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


