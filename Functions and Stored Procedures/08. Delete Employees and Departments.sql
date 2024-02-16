CREATE PROCEDURE usp_DeleteEmployeesFromDepartment
@departmentID INT
AS
BEGIN
	DECLARE @employeesToBeDeleted TABLE (ID INT)

	INSERT INTO @employeesToBeDeleted(ID)
	SELECT EmployeeID
	FROM Employees
	WHERE DepartmentID = @departmentID

	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT

	UPDATE Departments
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (SELECT * FROM @employeesToBeDeleted)

	DELETE FROM Employees
	WHERE DepartmentID = @departmentID

	DELETE FROM Departments
	WHERE DepartmentID = @departmentID

	SELECT COUNT(*)
	FROM Employees
	WHERE DepartmentID = @departmentID
END