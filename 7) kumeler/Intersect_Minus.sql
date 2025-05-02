--(A n B -> kesiþim)Ýki tabloda ortak olan kayýtlarý listeler
SELECT * FROM DEPT1 
INTERSECT
SELECT * FROM DEPT2;

--(A/B -> A fark B)Sadece DEPT1 tablosunda olan verileri getirir
SELECT * FROM DEPT1
MINUS
SELECT * FROM DEPT2;

--(B/A -> B fark A)Sadece DEPT2 tablosunda olan verileri getirir
SELECT * FROM DEPT2
MINUS
SELECT * FROM DEPT1;