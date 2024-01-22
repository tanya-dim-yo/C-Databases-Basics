CREATE VIEW V_EmployeeNameJobTitle AS
SELECT CONCAT([FirstName], ' ', [MiddleName], ' ', [LastName]) AS [Employee Name],
	   [JobTitle]
FROM Employees