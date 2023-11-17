/*

Write a query to print all prime numbers less than or equal to . Print your result on a single line, and use the ampersand () character as your separator (instead of a space).


*/



DECLARE @n INT;
DECLARE @IsPrime BIT;
DECLARE @DIVISOR INT;
DECLARE @result TABLE (primary_number INT);

INSERT INTO @result VALUES (2);

SET @n = 3; -- Start with the next number after 2

WHILE @n <= 1000
BEGIN
    SET @DIVISOR = 2;
    SET @IsPrime = 1;

    WHILE @DIVISOR <= SQRT(@n)
    BEGIN
        IF @n % @DIVISOR = 0
        BEGIN
            SET @IsPrime = 0;
            BREAK;
        END

        SET @DIVISOR = @DIVISOR + 1;
    END

    IF @IsPrime = 1
    BEGIN
        INSERT INTO @result VALUES (@n);
    END

    SET @n = @n + 1;
END

--select * from @result

DECLARE @resultString NVARCHAR(MAX);

-- Use STRING_AGG to concatenate elements with '&'
SELECT @resultString = STRING_AGG(primary_number, '&') WITHIN GROUP (ORDER BY primary_number)
FROM @result;

-- Print the result
PRINT @resultString;

-- Use STRING_AGG to concatenate elements with '&'
SELECT @resultString = STRING_AGG(primary_number, '&') WITHIN GROUP (ORDER BY primary_number)
FROM @result;

-- Print the result
PRINT @resultString;

