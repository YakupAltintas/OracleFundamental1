--��aret belirtme fonksiyonu SIGN()
SELECT EMPLOYEE_ID,SIGN(EMPLOYEE_ID) i�areti FROM EMPLOYEES;

--Mutlak de�er fonsksiyonu ABS()
SELECT ABS(EMPLOYEE_ID) FROM EMPLOYEES;

--DUAL sanal tablodur. COS(derece * pi / 180) �eklinde yaz�l�r.
SELECT COS(30 * 3.14/180) FROM DUAL ;

--Yukar� yuvarla
SELECT CEIL(12.4) FROM DUAL;

--A�a�� yuvarla
SELECT FLOOR(12.4) FROM DUAL;

--LOGAR�TMA fonksiyonu
SELECT LOG(10,100) FROM DUAL;

--E taban�nda logaritma
SELECT LN(1) FROM DUAL;

--E say�s�n�n �stel hali,EXP(1) -> e^1
SELECT EXP(1) FROM DUAL;

--MOD al�r
SELECT MOD(12,5) FROM DUAL;

--Karek�k al�r
SELECT SQRT(625) FROM DUAL;

--�s al�r
SELECT POWER(3,2) FROM DUAL;

SELECT
ROUND(124.567),ROUND(124.567,0)--Tam say�ya yuvarlar
,ROUND(124.567,1),ROUND(124.567,2)--S�ras�yla noktadan sonraki 2. rakama g�re,noktadan sonraki 3. rakama g�re yuvarlar
,ROUND(124.567,-1),ROUND(124.567,-2)--S�ras�yla noktadan �nceki 2. rakama g�re,noktadan �nceki 3. rakama g�re yuvarlar
FROM DUAL;





