CREATE PROCEDURE usp_GetEmployeesFromTown
@SearchedTown VARCHAR(50)
AS
	SELECT
		e.FirstName AS [First Name],
		e.LastName AS [Last Name]
	FROM Employees AS e
		JOIN Addresses AS a ON e.AddressID = a.AddressID
		JOIN Towns AS t ON a.TownID = t.TownID
	WHERE t.[Name] = @SearchedTown