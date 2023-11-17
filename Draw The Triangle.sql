/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).

*/






declare @n int = 20;
declare @i int = 1;

While @i<=@n
Begin
    print(replicate ('* ', @i))
    set @i = @i + 1
End;