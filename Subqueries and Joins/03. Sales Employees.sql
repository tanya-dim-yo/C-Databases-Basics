SELECT
	 [e].[EmployeeID]
	,[e].[FirstName]
	,[e].[LastName]
	,[d].[Name] [DepartmentName]
FROM
	[Employees] [e]
INNER JOIN [Departments] [d]
	ON ([e].[DepartmentID] = [d].[DepartmentID]
	AND [d].[Name] = 'Sales')
ORDER BY [e].[EmployeeID]