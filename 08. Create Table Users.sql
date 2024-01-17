CREATE TABLE Users(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	CONSTRAINT CHK_ProfilePictureSize CHECK (LEN(ProfilePicture) <= 921600),
	LastLoginTime DATETIME2,
	IsDeleted BIT NOT NULL
)

INSERT INTO Users(Username, Password, LastLoginTime, IsDeleted)
	VALUES ('forever4', 'dk8h3kdoif', '2023-05-01 04:30:45', 0),
	       ('user456', '8dk2l00j', '2022-11-30 21:00:12', 1),
		   ('random', 'kduUJmEl1', '2020-04-07 09:54:00', 0),
		   ('krasiBG', '555stronG', '2023-09-07 23:08:45', 0),
		   ('sunRISE', '00_jh-98', '2020-12-13 19:21:03', 1)