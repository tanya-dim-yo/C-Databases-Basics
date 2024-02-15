CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(20)
AS
BEGIN
	IF @salary < 30000
		RETURN 'Low'
	ELSE IF @salary <= 50000
		RETURN 'Average'
	
	RETURN 'High'
END