--UPDATE VE DELETE komutlarý commit yapmadan kalýcý hale gelmez
--ALTER, CREATE, DROP iþlemleri commit yazýlmýþ gibi davranýr ve delete ve update iþlemlerini commitler
--EMPLOYEES tablosunun aynýsýndan bitane daha oluþturduk.
CREATE TABLE EMPLOYEES_COPY AS SELECT * FROM EMPLOYEES;

--Çalýþanlara %20 zam yapýlacak
--Öncelikle tablomuzu görüntüleyelim
select employee_ýd,salary,commýssýon_pct from employees_copy;

--her çalýþana %20 zam yapalým ve komisyon oranýný 0.25 yapalým, En baþtaki yönetici hariç herkese zam yaptýk.
UPDATE EMPLOYEES_COPY SET SALARY = SALARY*1.20 , COMMISSION_PCT = 0.25 WHERE EMPLOYEE_ID <> 100;

--commit komutu deðiþikliði kalýcý hale getirdi
commit;

--bir iþlemi yanlýþ yaptýk ve tüm kayýtlar etkilendiyse napabiliriz? Güncelleme iþlemini yanlýþ yapýp kayýrlarý geri çaðýralým
--Güncelemme iþlemini yaparken where yazmayý unuttuk
UPDATE employees_copy SET salary = salary-400 , commission_pct = null;

--yaptýðýmýz iþlemleri geri alalým
ROLLBACK;

--EMPLOYEES tablosundan employees_copy tablosuna departman_id si 100 olan verileri getirip üzerine yazdýrdýk
UPDATE employees_copy A SET SALARY = (SELECT B.SALARY FROM EMPLOYEES B WHERE a.employee_ýd=b.employee_ýd ) WHERE A.department_ýd = 100;

--commit ile kalýcý hale getirdik
commit;


--DELETE KISMI

--employees_copy tablosunun içindeki tüm verileri sildik ve commit ettik
DELETE FROM employees_copy;
commit;

--Employees_copy tablosuna employees tablosunun verilerini aktardýk
INSERT INTO employees_copy SELECT * FROM EMPLOYEES
commit;
 
--employee_id si 100 olan kaydý sildi
DELETE FROM employees_copy where employee_ýd=100;
commit;