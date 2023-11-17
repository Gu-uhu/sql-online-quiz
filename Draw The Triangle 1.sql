/*

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

*/



DECLARE @n int;
DECLARE @i int;
SET @n = 20;
SET @i = @n;

WHILE @i > =1
BEGIN
    PRINT (Replicate ('* ', @i))
    SET @i = @i-1
END;