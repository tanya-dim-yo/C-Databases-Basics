CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18,2), @interestRate FLOAT, @years INT)
RETURNS DECIMAL(20,4)
AS
BEGIN
	RETURN @sum * POWER((1 + @interestRate), @years)
END