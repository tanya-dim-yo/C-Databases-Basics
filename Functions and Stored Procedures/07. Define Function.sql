CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(100))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1

	WHILE @i <= LEN(@word)
	BEGIN
		DECLARE @ch VARCHAR(1) = SUBSTRING(@word, @i, 1)

		IF CHARINDEX(@ch, @setOfLetters) = 0
			RETURN 0
		ELSE
			SET @i += 1
	END

	RETURN 1
END