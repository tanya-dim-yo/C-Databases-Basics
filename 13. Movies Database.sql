CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY(1,1),
	DirectorName NVARCHAR(50) UNIQUE NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY(1,1),
	GenreName NVARCHAR(50) UNIQUE NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY(1,1),
	CategoryName NVARCHAR(50) UNIQUE NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Title NVARCHAR(255) UNIQUE NOT NULL,
	DirectorId INT NOT NULL,
	FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	CopyrightYear SMALLINT,
	[Length] INT NOT NULL,
	GenreId INT NOT NULL,
	FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	CategoryId INT NOT NULL,
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	Rating DECIMAL(2,1),
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors(DirectorName)
	VALUES ('Frank Darabont'),
	       ('Christopher Nolan'),
		   ('Peter Jackson'),
		   ('Steven Spielberg'),
		   ('James Cameron')

INSERT INTO Genres(GenreName)
	VALUES ('Drama'),
	       ('Science Fiction'),
		   ('Fantasy'),
		   ('Adventure'),
		   ('Action')

INSERT INTO Categories(CategoryName)
	VALUES ('Classic'),
	       ('Sci-Fi'),
		   ('Adventure'),
		   ('Superhero'),
		   ('Romance')

INSERT INTO Movies(Title, DirectorId, Length, GenreId, CategoryId, Rating)
	VALUES ('The Shawshank Redemption', 1, 142, 1, 1, 5.0),
	       ('Inception', 2, 148, 2, 2, 3.8),
		   ('The Lord of the Rings: The Fellowship of the Ring', 3, 178, 3, 3, 4.5),
		   ('Jurassic Park', 4, 152, 2, 4, 4.2),
		   ('The Dark Knight', 2, 152, 5, 4, 3.5)