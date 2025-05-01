--UPDATE VE DELETE komutlar� commit yapmadan kal�c� hale gelmez
--ALTER, CREATE, DROP i�lemleri commit yaz�lm�� gibi davran�r ve delete ve update i�lemlerini commitler
--EMPLOYEES tablosunun ayn�s�ndan bitane daha olu�turduk.
CREATE TABLE EMPLOYEES_COPY AS SELECT * FROM EMPLOYEES;

--�al��anlara %20 zam yap�lacak
--�ncelikle tablomuzu g�r�nt�leyelim
select employee_�d,salary,comm�ss�on_pct from employees_copy;

--her �al��ana %20 zam yapal�m ve komisyon oran�n� 0.25 yapal�m, En ba�taki y�netici hari� herkese zam yapt�k.
UPDATE EMPLOYEES_COPY SET SALARY = SALARY*1.20 , COMMISSION_PCT = 0.25 WHERE EMPLOYEE_ID <> 100;

--commit komutu de�i�ikli�i kal�c� hale getirdi
commit;

--bir i�lemi yanl�� yapt�k ve t�m kay�tlar etkilendiyse napabiliriz? G�ncelleme i�lemini yanl�� yap�p kay�rlar� geri �a��ral�m
--G�ncelemme i�lemini yaparken where yazmay� unuttuk
UPDATE employees_copy SET salary = salary-400 , commission_pct = null;

--yapt���m�z i�lemleri geri alal�m
ROLLBACK;

--EMPLOYEES tablosundan employees_copy tablosuna departman_id si 100 olan verileri getirip �zerine yazd�rd�k
UPDATE employees_copy A SET SALARY = (SELECT B.SALARY FROM EMPLOYEES B WHERE a.employee_�d=b.employee_�d ) WHERE A.department_�d = 100;

--commit ile kal�c� hale getirdik
commit;


--DELETE KISMI

--employees_copy tablosunun i�indeki t�m verileri sildik ve commit ettik
DELETE FROM employees_copy;
commit;

--Employees_copy tablosuna employees tablosunun verilerini aktard�k
INSERT INTO employees_copy SELECT * FROM EMPLOYEES
commit;
 
--employee_id si 100 olan kayd� sildi
DELETE FROM employees_copy where employee_�d=100;
commit;