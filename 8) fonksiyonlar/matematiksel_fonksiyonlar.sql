--Ýþaret belirtme fonksiyonu SIGN()
SELECT EMPLOYEE_ID,SIGN(EMPLOYEE_ID) iþareti FROM EMPLOYEES;

--Mutlak deðer fonsksiyonu ABS()
SELECT ABS(EMPLOYEE_ID) FROM EMPLOYEES;

--DUAL sanal tablodur. COS(derece * pi / 180) þeklinde yazýlýr.
SELECT COS(30 * 3.14/180) FROM DUAL ;

--Yukarý yuvarla
SELECT CEIL(12.4) FROM DUAL;

--Aþaðý yuvarla
SELECT FLOOR(12.4) FROM DUAL;

--LOGARÝTMA fonksiyonu
SELECT LOG(10,100) FROM DUAL;

--E tabanýnda logaritma
SELECT LN(1) FROM DUAL;

--E sayýsýnýn üstel hali,EXP(1) -> e^1
SELECT EXP(1) FROM DUAL;

--MOD alýr
SELECT MOD(12,5) FROM DUAL;

--Karekök alýr
SELECT SQRT(625) FROM DUAL;

--Üs alýr
SELECT POWER(3,2) FROM DUAL;

SELECT
ROUND(124.567),ROUND(124.567,0)--Tam sayýya yuvarlar
,ROUND(124.567,1),ROUND(124.567,2)--Sýrasýyla noktadan sonraki 2. rakama göre,noktadan sonraki 3. rakama göre yuvarlar
,ROUND(124.567,-1),ROUND(124.567,-2)--Sýrasýyla noktadan önceki 2. rakama göre,noktadan önceki 3. rakama göre yuvarlar
FROM DUAL;





