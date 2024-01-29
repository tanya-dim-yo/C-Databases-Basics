SELECT
	Username,
	SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) [Email Provider]
FROM Users
ORDER BY [Email Provider], [Username]