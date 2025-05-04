--NATUREL JOIN KLASÝK FORMAT
SELECT 
E.EMPLOYEE_ID,E.FIRST_NAME,J.JOB_ID,J.JOB_TITLE 
FROM EMPLOYEES E,JOBS J
WHERE e.job_ýd = j.job_ýd;

--NATURAL JOIN  ANASI FORMAT(otomotik kolon isimlerini birleþtirir)
SELECT 
EMPLOYEE_ID,FIRST_NAME,JOB_ID,JOB_TITLE 
FROM EMPLOYEES 
NATURAL JOIN JOBS;

--INNER JION her iki tabloda da satýrlarýn hepsinin her tabloda karþýlýðý varsa getirir
--INNER JOIN KLASÝK FORMAT
SELECT
E.FIRST_NAME,
d.department_name,
l.cýty
FROM EMPLOYEES E,DEPARTMENTS D,LOCATIONS L
WHERE e.department_ýd = d.department_ýd AND d.locatýon_ýd = l.locatýon_ýd
ORDER BY e.fýrst_name;

--INNER JOIN ANSÝ FORMAT(INNER JOIN yerine JOIN tek de yazýlabilir aþaðýdaki örnekteki gibi)
SELECT
e.fýrst_name,
d.department_name,
l.cýty
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID 
ORDER BY e.fýrst_name;

--LEFT JOIN sol taraftaki tablonun tüm verilerini getirir, iliþkili tabloda karþýlýðý varsa yazar yoksa boþ gösterir.
--LEFT JOIN GELENEKSEL GORMAT
SELECT 
R.REGION_ID,
r.regýon_name,
c.country_ýd,
c.country_name,
l.cýty
FROM REGIONS R,COUNTRIES C,LOCATIONS L
WHERE r.regýon_ýd=c.regýon_ýd(+) AND c.country_ýd = l.country_ýd(+);

--LEFT JOIN ANSI FROMAT
SELECT
r.regýon_ýd,
r.regýon_name,
c.country_ýd,
c.country_name,
l.cýty
FROM regions r 
LEFT JOIN countries c ON  r.region_id = c.regýon_id
LEFT JOIN locations l ON l.country_id = c.country_id
ORDER BY r.region_name;


--RIGTH JOIN saðdaki tabloyu yaz soldaki tabloda karþýlýðý yoksa boþ yazsýn demek
--RIGHT JOIN GELENEKSEL FROMAT( Eksik verinin hangi tabloda olduðunu düþünüyorsak o tablonun koþuluna "(+)" yazýlýr.)
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_ýd= e.department_ýd(+)
ORDER BY d.department_name;

--RIGHT JOIN ANSI FORMAT(employees tablosunun saðýnda olduðu için department verilerini getirdi employees verilerini yazdý yoksa boþ yazdý)
SELECT
d.department_name,
e.first_name,
e.last_name,
e.salary
from EMPLOYEES e
RIGHT JOIN departments d ON d.department_id = e.department_id
ORDER BY d.department_name;
    

--FULL JOIN tablolarýn tüm kayýtlarýnýn listeler. karþýlýk yoksa boþ deðer gösterir
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
--RIGHT JOIN VE LEFT JOIN UNION ile beraber kullanýlýnca FULL JOIN olur
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_ýd= e.department_ýd(+)
UNION
SELECT 
d.department_name,
e.first_name,
e.last_name,
e.salary
FROM DEPARTMENTS D,EMPLOYEES E
WHERE d.department_ýd(+)= e.department_ýd
ORDER BY 1;


--SELF JOIN BÝR tablo kendi kolonunu refarans gösterdiðinde kullanýlýr
--SELF JOIN GELENEKSEL FORMAT
SELECT
e1.fýrst_name,
e1.last_name,
e1.manager_ýd,
e2.fýrst_name,
e2.last_name
FROM EMPLOYEES E1,EMPLOYEES E2
WHERE e1.manager_ýd = e2.employee_ýd;


--SELF JOIN ANSI FORMAT
SELECT 
e1.fýrst_name,
e1.last_name,
e1.manager_ýd,
e2.fýrst_name,
e2.last_name
FROM  EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.MANAGER_ID =E2.EMPLOYEE_ID(+)
ORDER BY e1.employee_ýd ;


---CROSS JOIN veri üretmek için kullanýlýr. 2 tablodaki verileri kombine eder verilerin çarpýmý kadar veri üretir
--CROSS JOIN KLASIK YÖNTEM
SELECT
LAST_NAME,
department_name
from employees,departments;


--CROSS JOIN ANSI FORMAT
SELECT
LAST_NAME,
department_name
from employees CROSS JOIN departments

