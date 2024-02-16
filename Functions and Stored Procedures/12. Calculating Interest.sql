CREATE PROCEDURE usp_CalculateFutureValueForAccount(@AccountID INT, @InterestRate FLOAT)
AS
BEGIN
	DECLARE @Years INT = 5

	SELECT
		a.Id AS [Account Id],
		ah.FirstName AS [First Name],
		ah.LastName AS [Last Name],
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, @Years) AS [Balance in 5 years]
	FROM AccountHolders AS ah
		JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	WHERE a.Id = 1
END