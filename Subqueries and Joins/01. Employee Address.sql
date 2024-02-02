SELECT TOP 5
	[e].[EmployeeID]
	,[e].[JobTitle]
	,[e].[AddressID]
	,[a].[AddressText]
FROM
	[Employees] [e]
INNER JOIN
	[Addresses] [a] ON [e].[AddressID] = [a].[AddressID]
ORDER BY [e].[AddressID]