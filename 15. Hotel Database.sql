CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(MAX)
)

CREATE TABLE Customers(
	AccountNumber INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(50) NOT NULL,
	EmergencyName NVARCHAR(255),
	EmergencyNumber NVARCHAR(50),
	Notes NVARCHAR(MAX)
)

CREATE TABLE RoomStatus(
	RoomStatus NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

CREATE TABLE RoomTypes(
	RoomType NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

CREATE TABLE BedTypes(
	BedType NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Rooms(
	RoomNumber INT PRIMARY KEY IDENTITY(1,1),
	RoomType NVARCHAR(50) NOT NULL,
	FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
	BedType NVARCHAR(50) NOT NULL,
	FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
	Rate DECIMAL(2,1),
	RoomStatus NVARCHAR(50) NOT NULL,
	FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus),
	Notes NVARCHAR(MAX)
)

CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY(1,1),
	EmployeeId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	PaymentDate DATETIME2 NOT NULL,
	AccountNumber INT NOT NULL,
	FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL(8,2) NOT NULL,
	TaxRate DECIMAL(3,2) NOT NULL,
	TaxAmount DECIMAL(8,2) NOT NULL,
	PaymentTotal DECIMAL(8,2) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Occupancies(
	Id INT PRIMARY KEY IDENTITY(1,1),
	EmployeeId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	DateOccupied DATE NOT NULL,
	AccountNumber INT NOT NULL,
	FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
	RoomNumber INT NOT NULL,
	FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber),
	RateApplied DECIMAL(2,1),
	PhoneCharge BIT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees(FirstName, LastName)
	VALUES (N'Гергана', N'Станимирова'),
	       (N'Ивана', N'Попова'),
		   (N'Аделина', N'Стоичкова')

INSERT INTO Customers(FirstName, LastName, PhoneNumber)
	VALUES (N'Деян', N'Николов', '+442012341234'),
	       (N'Красимир', N'Станев', '+37060112345'),
		   (N'Владимир', N'Владимиров', '+14151231234')

INSERT INTO RoomStatus(RoomStatus)
	VALUES (N'Свободна'),
	       (N'Заета'),
		   (N'В ремонт')

INSERT INTO RoomTypes(RoomType)
	VALUES (N'Единична'),
	       (N'Двойна'),
		   (N'Апартамент')

INSERT INTO BedTypes(BedType)
	VALUES (N'Единично'),
	       (N'Двойно'),
		   ('King Size')

INSERT INTO Rooms(RoomType, BedType, Rate, RoomStatus)
	VALUES (N'Единична', N'Единично', 5.0, N'Свободна'),
	       (N'Двойна', N'Двойно', 5.2, N'Свободна'),
		   (N'Апартамент', 'King Size', 6.0, N'Свободна')

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber,
					 FirstDateOccupied, LastDateOccupied, TotalDays,
					 AmountCharged, TaxRate, TaxAmount, PaymentTotal)
	VALUES (2, '2023-09-23', 3, '2023-09-17', '2023-09-23', 7, 150.00, 0.20, 30.0, 180.0),
	       (1, '2023-07-05', 2, '2023-07-05', '2023-07-08', 4, 125.00, 0.20, 25.0, 150.0),
		   (3, '2023-02-17', 1, '2023-02-15', '2023-02-22', 8, 320.00, 0.20, 64.0, 384.0)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, PhoneCharge)
	VALUES (2, '2023-09-17', 3, 1, 0),
	       (1, '2023-07-05', 2, 2, 1),
		   (3, '2023-02-15', 1, 3, 0)