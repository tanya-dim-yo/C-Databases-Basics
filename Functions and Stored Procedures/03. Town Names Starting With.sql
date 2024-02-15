CREATE PROCEDURE usp_GetTownsStartingWith
@startingString VARCHAR(50)
AS
	SELECT
		[Name] AS [Town]
	FROM Towns
	WHERE [Name] LIKE @startingString + '%'