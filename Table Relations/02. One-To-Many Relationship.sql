CREATE TABLE Manufacturers(
	ManufacturerID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	EstablishedOn DATE
)

CREATE TABLE Models(
	ModelID INT IDENTITY(101,1) PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	ManufacturerID INT NOT NULL
	FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)