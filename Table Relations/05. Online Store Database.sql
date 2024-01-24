CREATE TABLE ItemTypes(
	ItemTypeID INT PRIMARY KEY,
	[Name] NVARCHAR(50)
)

CREATE TABLE Items(
	ItemID INT PRIMARY KEY,
	[Name] NVARCHAR(50),
	ItemTypeID INT
	CONSTRAINT FK_Items_ItemTypes FOREIGN KEY(ItemTypeID) REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Cities(
	CityID INT PRIMARY KEY,
	[Name] NVARCHAR(50)
)

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	[Name] NVARCHAR(50),
	Birthday DATE,
	CityID INT,
	CONSTRAINT FK_Customers_Cities FOREIGN KEY(CityID) REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	CONSTRAINT FK_Orders_Customers FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems(
	OrderID INT,
	ItemID INT,
	CONSTRAINT PK_OrderItems PRIMARY KEY(OrderID, ItemID),
	CONSTRAINT FK_OrderItems_Items FOREIGN KEY(ItemID) REFERENCES Items(ItemID),
	CONSTRAINT FK_OrderItems_Orders FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
)