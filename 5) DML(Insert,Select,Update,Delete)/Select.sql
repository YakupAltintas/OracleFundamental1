-- Basit sorgu
select * from employees;

--Hangi kolon isminin listelenece�ini biz se�iyoruz 
select MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL from employees;

--Kolon isimlerini listelerken de�itirdik
select MANAGER_ID MNG,FIRST_NAME ADI,LAST_NAME SOYADI,EMAIL POSTA from employees;

--Kolon isimlerinin bo�luklu bir isimden olu�mas�n� istiyorsak t�rnak kullanmal�y�z
select MANAGER_ID "Y�netici No",FIRST_NAME "Ad�",LAST_NAME "Aile ad�",EMAIL "E Mail" from employees;

-- departman id si 90 olan kay�tlar listelenir
select * from employees where department_id =90;

-- departman id'si 90 ve 100 olan kay�tlar� getirir
select * from employees where department_id = in(90,100);

-- departman id'si 90 ve 100 olan kay�tlar� getirir (daha performansl�d�r di�erinden)
select * from employees where department_id = 90 or department_�d=100;

--Ad� St ile ba�layanlar� listeledi
select * from employees where FIRST_NAME LIKE 'St%';

--�sminde t harfi ge�enleri listeledi
select * from employees where FIRST_NAME LIKE '%t%';

--�smi t harfiyle bitenleri listeledi
select * from employees where FIRST_NAME LIKE '%t';

-- �sminin 2. harfi a 4. harfi e olan isimleri listeledi
SELECT * FROM employees where FIRST_NAME LIKE '_a_e%';

-- Maa�� 10000 den b�y�k olanlar ve commission_pct k�sm� null olmayanlar� listeledik
select * from employees where salary > 10000 and COMMISSION_PCT IS not null;

--�nce isme g�re s�ralar sonra ayn� sisimde adam varsa soyada g�re s�ralar. asc yazmasak da olur
select manager_id,first_name,last_name,email from employees order by first_name asc, last_name asc;

--�nce isme g�re s�ralar sonra ayn� sisimde adam varsa soyada g�re s�ralar. Kolon ismi yerine s�ras� da yaz�labilir,asc yazmasak da olur
select manager_id,first_name,last_name,email from employees order by 2 asc, 3 asc;

--departman� 100 olan verileri maa�lar�na g�re s�ralad�k
select * from employees where department_id =100 order by salary asc;

--H�TERAR��K D�ZENDE SORGULAR--

--employee_id ve manager_id k�s�mlar�n� ili�kilendirdi ve ona g�re listeleme yapt�.(y�neticisi olmayan sat�rlar� getirmedi,primary key ve foreign key ili�kisi yapt�)
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID FROM EMPLOYEES CONNECT BY PRIOR employee_�d=manager_�d;

--ili�kilendirme yapt� ve alt �st ili�kisine g�re seviyesini yazd�, en �st birim 0 olmu� oldu bi alt� 1 fala �yle gider.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES CONNECT BY PRIOR employee_�d=manager_�d;

--r�tbe ili�kisi kurarken START WITH komutuyla en tepedeki y�neticiyi belirttik ve level s�ralamas�n� ona g�re yapt�
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES 
START WITH employee_�d=100 
CONNECT BY PRIOR employee_�d=manager_�d;

--hiyerar�ik s�ray� bozmadan r�tbe ili�kisinden sonra soyad�na g�re s�ralar
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID,LEVEL FROM EMPLOYEES 
START WITH employee_�d=100 
CONNECT BY PRIOR employee_�d=manager_�d
ORDER SIBLINGS BY LAST_NAME;

--�s ili�kilerini a�a� �eklinde g�steren kolonu olu�turma
--Ad�m 1: �al��anlar� listele
SELECT FIRST_NAME FROM EMPLOYEES;

--Ad�m 2: �al��anlar�n �s ili�kilerini yap
SELECT FIRST_NAME FROM EMPLOYEES CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Ad�m 3: �s ili�kilerini LEVEL kullanarak belirt
SELECT FIRST_NAME,LEVEL FROM EMPLOYEES CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Ad�m 4: En �stteki y�neticiyi belirterek s�ralamay� sa�lad�k
SELECT FIRST_NAME,LEVEL FROM EMPLOYEES START WITH employee_�d=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;

--Ad�m 5: S�ralama kolonu oluturduk ve s�ralamas�n� g�sterdik
SELECT FIRST_NAME,LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')s�ralama FROM EMPLOYEES START WITH employee_�d=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


--Ad�m 6: CONNECT_BY_ROOT() komutu en tepedeki y�neticiyi getirir.
SELECT FIRST_NAME,CONNECT_BY_ROOT(FIRST_NAME),LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')s�ralama FROM EMPLOYEES START WITH employee_�d=100 CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


--Ad�m 7: where ko�ulu ekledik. 100 departman�n�n y�neticileri geldi
SELECT FIRST_NAME,CONNECT_BY_ROOT(FIRST_NAME),LEVEL,SYS_CONNECT_BY_PATH(FIRST_NAME,'->')s�ralama FROM EMPLOYEES 
WHERE department_�d =100
START WITH employee_�d=100 
CONNECT BY PRIOR EMPLOYEE_ID=MANAGER_ID;


