--NATUREL JOIN KLAS�K FORMAT
SELECT 
E.EMPLOYEE_ID,E.FIRST_NAME,J.JOB_ID,J.JOB_TITLE 
FROM EMPLOYEES E,JOBS J
WHERE e.job_�d = j.job_�d;

--NATURAL JOIN  ANASI FORMAT(otomotik kolon isimlerini birle�tirir)
SELECT 
EMPLOYEE_ID,FIRST_NAME,JOB_ID,JOB_TITLE 
FROM EMPLOYEES 
NATURAL JOIN JOBS;

--INNER JION her iki tabloda da sat�rlar�n hepsinin her tabloda kar��l��� varsa getirir
--INNER JOIN KLAS�K FORMAT
SELECT
E.FIRST_NAME,
d.department_name,
l.c�ty
FROM EMPLOYEES E,DEPARTMENTS D,LOCATIONS L
WHERE e.department_�d = d.department_�d AND d.locat�on_�d = l.locat�on_�d
ORDER BY e.f�rst_name;

--INNER JOIN ANS� FORMAT(INNER JOIN yerine JOIN tek de yaz�labilir a�a��daki �rnekteki gibi)
SELECT
e.f�rst_name,
d.department_name,
l.c�ty
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID 
ORDER BY e.f�rst_name;

--LEFT JOIN sol taraftaki tablonun t�m verilerini getirir, ili�kili tabloda kar��l��� varsa yazar yoksa bo� g�sterir.
--LEFT JOIN GELENEKSEL GORMAT
SELECT 
R.REGION_ID,
r.reg�on_name,
c.country_�d,
c.country_name,
l.c�ty
FROM REGIONS R,COUNTRIES C,LOCATIONS L
WHERE r.reg�on_�d=c.reg�on_�d(+) AND c.country_�d = l.country_�d(+);

--LEFT JOIN ANSI FROMAT
SELECT
r.reg�on_�d,
r.reg�on_name,
c.country_�d,
c.country_name,
l.c�ty
FROM regions r 
LEFT JOIN countries c ON  r.region_id = c.reg�on_id
LEFT JOIN locations l ON l.country_id = c.country_id
ORDER BY r.region_name;


--RIGTH JOIN sa�daki tabloyu yaz soldaki tabloda kar��l��� yoksa bo� yazs�n demek
--RIGHT JOIN GELENEKSEL FROMAT( Eksik verinin hangi tabloda oldu�unu d���n�yorsak o tablonun ko�uluna "(+)" yaz�l�r.)
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_�d= e.department_�d(+)
ORDER BY d.department_name;

--RIGHT JOIN ANSI FORMAT(employees tablosunun sa��nda oldu�u i�in department verilerini getirdi employees verilerini yazd� yoksa bo� yazd�)
SELECT
d.department_name,
e.first_name,
e.last_name,
e.salary
from EMPLOYEES e
RIGHT JOIN departments d ON d.department_id = e.department_id
ORDER BY d.department_name;
    

--FULL JOIN tablolar�n t�m kay�tlar�n�n listeler. kar��l�k yoksa bo� de�er g�sterir
--FULL JOIN ANSI FORMAT
SELECT
d.department_name,
e.first_name,
e.last_name,
e.salary
from EMPLOYEES e
FULL JOIN departments d ON d.department_id = e.department_id
ORDER BY d.department_name;

--FULL JOIN GELENEKSEL FORMAT
--RIGHT JOIN VE LEFT JOIN UNION ile beraber kullan�l�nca FULL JOIN olur
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_�d= e.department_�d(+)
UNION
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_�d(+)= e.department_�d
ORDER BY 1;


--SELF JOIN B�R tablo kendi kolonunu refarans g�sterdi�inde kullan�l�r
--SELF JOIN GELENEKSEL FORMAT
SELECT
e1.f�rst_name,
e1.last_name,
e1.manager_�d,
e2.f�rst_name,
e2.last_name
FROM EMPLOYEES E1,EMPLOYEES E2
WHERE e1.manager_�d = e2.employee_�d;


--SELF JOIN ANSI FORMAT
SELECT 
e1.f�rst_name,
e1.last_name,
e1.manager_�d,
e2.f�rst_name,
e2.last_name
FROM  EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.MANAGER_ID =E2.EMPLOYEE_ID(+)
ORDER BY e1.employee_�d ;


---CROSS JOIN veri �retmek i�in kullan�l�r. 2 tablodaki verileri kombine eder verilerin �arp�m� kadar veri �retir
--CROSS JOIN KLASIK Y�NTEM
SELECT
LAST_NAME,
department_name
from employees,departments;


--CROSS JOIN ANSI FORMAT
SELECT
LAST_NAME,
department_name
from employees CROSS JOIN departments

