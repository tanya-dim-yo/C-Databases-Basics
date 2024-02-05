SELECT [e].[EmployeeID], [e].[FirstName],
	 CASE
		WHEN [p].[StartDate] > '2004-12-31' THEN NULL
		ELSE [p].[Name]
	 END
FROM [Employees] [e]
JOIN
	[EmployeesProjects] [ep] ON [e].[EmployeeID] = [ep].[EmployeeID]
JOIN
	[Projects] [p] ON [ep].[ProjectID] = [p].[ProjectID]
WHERE
	[e].[EmployeeID] = 24