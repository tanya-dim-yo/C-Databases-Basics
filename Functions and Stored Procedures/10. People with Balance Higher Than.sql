CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@threshold DECIMAL(18,2))
AS
BEGIN
	SELECT
		ah.FirstName AS [First Name],
		ah.LastName AS [Last Name]
	FROM AccountHolders AS ah
	WHERE ah.Id IN (
					SELECT AccountHolderId
					FROM Accounts
					GROUP BY AccountHolderId
					HAVING SUM(Balance) > @threshold
					)
	ORDER BY ah.FirstName, ah.LastName
END