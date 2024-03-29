CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	CONSTRAINT CHK_MaxSize CHECK (DATALENGTH(Picture) <= 2097152),
	Height DECIMAL(5,2),
	[Weight] DECIMAL(5,2),
	Gender CHAR(1) NOT NULL,
	CONSTRAINT CHK_Gender CHECK (Gender IN ('m', 'f')),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)