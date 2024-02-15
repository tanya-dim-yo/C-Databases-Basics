CREATE PROCEDURE usp_EmployeesBySalaryLevel
@SalaryLevel VARCHAR(10)
AS
BEGIN
	SELECT
		FirstName AS [First Name],
		LastName AS [Lirst Name]
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel
END