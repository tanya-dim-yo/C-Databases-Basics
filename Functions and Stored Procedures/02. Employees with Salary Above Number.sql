CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber
@salaryLevel DECIMAL(18,4)
AS
	SELECT
		FirstName AS [First Name],
		LastName AS [Last Name]
	FROM Employees
	WHERE Salary >= @salaryLevel