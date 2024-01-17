CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY(1,1),
	CategoryName NVARCHAR(50) UNIQUE NOT NULL,
	DailyRate DECIMAL(2,1),
	WeeklyRate DECIMAL(2,1),
	MonthlyRate DECIMAL(2,1),
	WeekendRate DECIMAL(2,1)
)

CREATE TABLE Cars(
	Id INT PRIMARY KEY IDENTITY(1,1),
	PlateNumber NVARCHAR(50) UNIQUE NOT NULL,
	Manufacturer NVARCHAR(50) NOT NULL,
	Model NVARCHAR(50) NOT NULL,
	CarYear SMALLINT,
	CategoryId INT NOT NULL,
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	Doors TINYINT,
	Picture VARBINARY(MAX),
	CONSTRAINT CHK_PictureSize CHECK (DATALENGTH(Picture) <= 2097152),
	Condition NVARCHAR(50),
	Available BIT NOT NULL
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(MAX)
)

CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY(1,1),
	DriverLicenceNumber NVARCHAR(50) UNIQUE NOT NULL,
	FullName NVARCHAR(255) NOT NULL,
	[Address] NVARCHAR(MAX),
	City NVARCHAR(50) NOT NULL,
	ZIPCode INT,
	Notes NVARCHAR(MAX)
)

CREATE TABLE RentalOrders(
	Id INT PRIMARY KEY IDENTITY(1,1),
	EmployeeId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	CustomerId INT NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
	CarId INT NOT NULL,
	FOREIGN KEY (CarId) REFERENCES Cars(Id),
	TankLevel TINYINT,
	KilometrageStart INT,
	KilometrageEnd INT,
	TotalKilometrage INT,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied DECIMAL(2,1),
	TaxRate TINYINT NOT NULL,
	OrderStatus NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Categories(CategoryName)
	VALUES ('Sedan'),
	       ('Sports Car'),
		   ('Hatchback')

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CategoryId, Available)
	VALUES ('СА9831ХА', 'Honda', 'Civic', 1, 1),
	       ('ХХ1234ХХ', 'Porsche', '911', 2, 0),
		   ('СВ5030РВ', 'Audi', 'A7', 3, 1)

INSERT INTO Employees(FirstName, LastName)
	VALUES ('Красимир', 'Иванов'),
	       ('Стоян', 'Пешев'),
		   ('Драгомир', 'Илчев')

INSERT INTO Customers(DriverLicenceNumber, FullName, City)
	VALUES ('СФ873СВ03', 'Лидия Ковачева', 'София'),
	       ('ВР562РА99', 'Петър Петров', 'Варна'),
		   ('ПВ013СХ87', 'Михаил Костадинов', 'Пловдив')

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, StartDate, EndDate, TotalDays, TaxRate, OrderStatus)
	VALUES (3, 2, 1, '2023-09-19', '2023-09-22', 4, 20, 'Completed'),
	       (2, 3, 3, '2023-09-11', '2023-09-29', 19, 20, 'In Progress'),
		   (1, 1, 1, '2023-10-05', '2023-10-15', 10, 20, 'Pending')