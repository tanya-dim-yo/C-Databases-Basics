CREATE TABLE Majors(
	MajorID INT PRIMARY KEY,
	[Name] NVARCHAR(50)
)

CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(50)
)

CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	StudentNumber NVARCHAR(50),
	StudentName NVARCHAR(50),
	MajorID INT,
	CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda(
	StudentID INT,
	SubjectID INT,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID),
	CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
)

CREATE TABLE Payments(
	PaymentID INT PRIMARY KEY,
	PaymentDate DATETIME2,
	PaymentAmount DECIMAL(8,2),
	StudentID INT, 
	CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)