-------=====Exercise 2.1
------The following code is used to create the Sparta Academy database and the required tables.
------This includes the foreign/primary keys and restraints requested in exercise 4.
--USE master
--DROP DATABASE [Sparta Academy]
--CREATE DATABASE [Sparta Academy]
--USE [Sparta Academy]

----Academy
--DROP TABLE Academies
--CREATE TABLE Academies
--(
--[Academy ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Academy Name] VARCHAR(15)
--);

----Rooms;
--DROP TABLE Rooms
--CREATE TABLE Rooms
--(
--[Room ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Academy ID] INT,
--FOREIGN KEY ([Academy ID]) REFERENCES Academies ([Academy ID]),
--[Room Name] VARCHAR(15),
--"Description" VARCHAR(MAX),
--Capacity INT CHECK(Capacity <= 25)
--);

----Course Catalog
--DROP TABLE [Course Catalog]
--CREATE TABLE [Course Catalog]
--(
--[Course Catalog ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Course Name] VARCHAR(20),
--[Duration] INT
--);

----Employees
--DROP TABLE [Employees]
--CREATE TABLE Employees
--(
--[Employee ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[First Name] VARCHAR(20),
--[Last Name] VARCHAR(20),
--[Employee Type] VARCHAR(2),
--[Start Date] DATE
--);

---- Course Schedule
--DROP TABLE [Course Schedule]
--CREATE TABLE [Course Schedule]
--(
--[Course Schedule ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Academy ID] INT,
--FOREIGN KEY ([Academy ID]) REFERENCES Academies ([Academy ID]),
--[Room ID] INT,
--FOREIGN KEY ([Room ID]) REFERENCES Rooms ([Room ID]),
--[Course Catalog ID],
--FOREIGN KEY ([Course Catalog ID]) REFERENCES [Course Catalog] ([Course Catalog ID]),
--[Start Date] DATE,
--[End Date] DATE
--);

----Course Schedule Trainers
--DROP TABLE [Course Schedule Trainers]
--CREATE TABLE [Course Schedule Trainers]
--(
--[Trainer ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Employee ID] INT,
--FOREIGN KEY ([Employee ID]) REFERENCES Employees ([Employee ID]),
--[Course Schedule ID] INT,
--FOREIGN KEY ([Course Schedule ID]) REFERENCES [Course Schedule] ([Course Schedule ID]),
--[Trainer Type] VARCHAR(3)
--);

----Course Schedule Attendees
--DROP TABLE [Course Schedule Attendees]
--CREATE TABLE [Course Schedule Attendees]
--(
--[Attendee ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--[Course Catalog ID] INT,
--FOREIGN KEY ([Course Catalog ID]) REFERENCES [Course Catalog] ([Course Catalog ID]),
--[Trainer ID] INT,
--FOREIGN KEY ([Trainer ID]) REFERENCEs [Course Schedule Trainers] ([Trainer ID]),
--[Active] BIT
--);



---Exercise 2.2 Continued 
--- The following code is to insert the DML values into the created tables.
--SET IDENTITY_INSERT Academies ON
--INSERT INTO Academies
--[Academy Name])
--VALUES 
--('Richmond'),
--('Birmingham'),
--('Leeds');
--SET IDENTITY_INSERT Academies OFF

--SET IDENTITY_INSERT Rooms ON
--INSERT INTO Rooms
--(
--[Room Name],
--[Academy ID],
--[Room Description],
--[Capacity]
--)
--VALUES 
--('Room 1',1,'Next to the new Lo; sign',12),
--('Room 2',1,'Behind the new Sparta sign',18),
--('Room 3',1,'No air-con',18),
--('Room 4',1,'Has second door with number lock',10)
--('Room 1',2, 'Engineering 51's Room',12);
--SET IDENTITY_INSERT Rooms OFF

--SET IDENTITY_INSERT [Course Schedule] ON
--INSERT INTO [Course Schedule]
--(
--[Academy ID],
--[Room ID],
--[Course ID],
--[Start Date],
--[End Date]
--)
--VALUES
--(1,1,1,'01-15-2018','02-03-2018'),
--(1,3,2,'01-22-2018','03-03-2018'),
--(2,4,2,';
--SET IDENTITY_INSERT [Course Schedule] OFF

--SET IDENTITY_INSERT Employees ON
--INSERT INTO Employees
--(
--[Employee ID],
--[First Name],
--[Last Name],
--[Employee Type],
--[Start Date]
--)
--VALUES
--(1,'Tim','Cawte','T','01-15-2018'),
--(2,'Richard','Gurney','T','07-14-2017'),
--(3,'Adam','Smith','S','01-15-2018'),
--(4,'John','Williams','S','01-15-2018'),
--(5,'Nick','Willis','S','01-15-2018'),
--(6,'Jenny','Jones','S','01-15-2018'),
--(7,'Katie','Prince','S','01-15-2018'),
--(8,'Peter','Brown','S','01-15-2018'),
--(9,'Mo','Khan','S','01-22-2018'),
--(10,'Juan','Carlos','S','01-22-2018'),
--(11,'Jan','Miller','S','01-22-2018'),
--(12,'Kyle','Carpenter','S','01-22-2018'),
--(13,'Alvarao','Carlos','S','01-22-2018'),
--(14,'Margaret','Baker','S','01-22-2018'),
--(15,'Oti','Mwase','S','01-22-2018'),
--(16,'Joe','Mann','S',NULL),
--(17,'Steve','Harris','S',NULL);
--SET IDENTITY_INSERT Employees OFF

--SET IDENTITY_INSERT [Course Schedule Attendees] ON
--INSERT INTO [Course Schedule Attendees]
--(
--[Course ID],
--[Course Schedule ID],
--[Attendee ID],
--[Active]
--)
--VALUES
--(1,1,3,1),
--(1,1,4,1),
--(1,1,5,1),
--(1,1,6,1),
--(1,1,7,1),
--(1,1,8,1),
--(2,2,9,1),
--(2,2,10,1),
--(2,2,11,1),
--(2,2,12,1),
--(2,2,13,1),
--(2,2,14,1),
--(2,2,15,1);
--SET IDENTITY_INSERT [Course Schedule Attendees] OFF

--SET IDENTITY_INSERT [Course Catalog] ON
--INSERT INTO [Course Catalog]
--(
--[Course ID],
--[Course Name],
--[Duration]
--)
--VALUES
--(1,'BA-Test',7),
--(2,'Engineering',12);
--SET IDENTITY_INSERT [Course Catalog] OFF

--SET IDENTITY_INSERT [Course Schedule Trainers] ON
--INSERT INTO [Course Schedule Trainers]
--(
--[Course Schedule ID],
--[Trainer ID],
--[Trainer Type]
--)
--VALUES
--(1,1,'T'),
--(2,2,'T');
--SET IDENTITY_INSERT [Course Schedule Trainers] OFF

------Exercise 2.3 This section wil add the Spartans in my current class to the databse
--INSERT INTO Employees
--([First Name],
--[Last Name],
--[Employee Type],
--[Start Date])
--VALUES
--('Nishant', 'Mandal', 'T', '09-07-2012'),
--('Cathy', 'French', 'TA', '02-07-2012');

--INSERT INTO [Course Schedule Trainers]
--([Course Schedule ID],
--[Trainer Type],
--[Employee ID])
--VALUES
--(2, 'T', 16),
--(2, 'TA', 17);

--INSERT INTO Employees
--([First Name],
--[Last Name],
--[Employee Type],
--[Start Date])
--VALUES
--('Joshua', 'Bailey', 'S', '01-27-2020'),
--('Mitchell', 'Clark', 'S', '01-27-2020'),
--('Jason', 'Evans', 'S', '01-27-2020'),
--('Abdirashiid', 'Jama', 'S', '01-27-2020'),
--('Michael', 'Jesney', 'S', '01-27-2020'),
--('Hamzah', 'Khan', 'S', '01-27-2020'),
--('Jared', 'Mackay', 'S', '01-27-2020'),
--('Dushan', 'Puvaneswaren', 'S', '01-27-2020'),
--('Nabil', 'Sufi', 'S', '01-27-2020');

--INSERT INTO [Course Schedule Attendees]
--([First Name],
--[Last Name],
--[Course Schedule ID],
--[Course Catalog ID],
--[Trainer ID],
--[Start Date],
--Active)
--VALUES
--('Joshua', 'Bailey', 2,2,3,'01-27-2020'),
--('Mitchell', 'Clark', 2,2,3, '01-27-2020'),
--('Jason', 'Evans', 2,2,3, '01-27-2020'),
--('Abdirashiid', 'Jama', 2,2,3, '01-27-2020'),
--('Michael', 'Jesney', 2,2,3, '01-27-2020'),
--('Hamzah', 'Khan', 2,2,3, '01-27-2020'),
--('Jared', 'Mackay', 2,2,3, '01-27-2020'),
--('Dushan', 'Puvaneswaren', 2,2,3, '01-27-2020'),
--('Nabil', 'Sufi', 2,2,3, '01-27-2020');


----=======Exercise 3.1 Querying the created databases.
--SELECT 
--[Course Name],
--FORMAT(cs.[Start Date], 'dd/MM/yyy'),
--FORMAT(cs.[End Date], 'dd/MM/yyy'),
--a.[Academy Name],
--r.[Room Name],
--e.[First Name] + ' ' + e.[Last Name] AS Trainer,
--csa.[First Name] + ' ' + csa.[Last Name] AS Spartan
--FROM [Course Schedule] cs
--LEFT JOIN [Course Catalog] cc ON cc.[Course Catalog ID] = cs.[Course Catalog ID]
--LEFT JOIN [Course Schedule Attendees] csa ON csa.[Course Catalog ID] = cc.[Course Catalog ID]
--LEFT JOIN [Course Schedule Trainers] cst ON cst.[Trainer ID] = csa[Trainer ID]
--LEFT JOIN Employees e ON e.[Employee ID] = e.[Employee ID]
--LEFT JOIN Rooms r ON r.[Room ID] = cs.[Room ID]
--LEFT JOIN Academies a ON a.[Academy ID] = r.[Academy ID]
--ORDER BY cc.[Course Name];

-----========Exercise 3.2 
--SELECT 
--[Course Name],
--FORMAT(cs.[Start Date], 'dd/MM/yyy'),
--FORMAT(cs.[End Date], 'dd/MM/yyy'),
--a.[Academy Name],
--r.[Room Name],
--e.[First Name] + ' ' + e.[Last Name] AS Trainer,
--SUBTSTRING(csa.[First Name], 1, 1) + SUBSTRING(csa.[Last Name], 1, 1) AS 'Spartan Initials'
--FROM [Course Schedule] cs
--LEFT JOIN [Course Catalog] cc ON cc.[Course Catalog ID] = cs.[Course Catalog ID]
--LEFT JOIN [Course Schedule Attendees] csa ON csa.[Course Catalog ID] = cc.[Course Catalog ID]
--LEFT JOIN [Course Schedule Trainers] cst ON cst.[Trainer ID] = csa[Trainer ID]
--LEFT JOIN Employees e ON e.[Employee ID] = e.[Employee ID]
--LEFT JOIN Rooms r ON r.[Room ID] = cs.[Room ID]
--LEFT JOIN Academies a ON a.[Academy ID] = r.[Academy ID]
--ORDER BY cc.[Course Name];

-----========Exercise 3.3
--SELECT 
--[Course Name],
--FORMAT(cs.[Start Date], 'dd/MM/yyy'),
--FORMAT(cs.[End Date], 'dd/MM/yyy'),
--FORMAT(DATEADD(week, 8, cs.[Start Date]), 'dd/MM/yyyy') AS 'Check Date',
--a.[Academy Name],
--r.[Room Name],
--e.[First Name] + ' ' + e.[Last Name] AS Trainer,
--csa.[First Name] + ' ' + csa.[Last Name] AS Spartan,
--CASE WHEN cc.[Course Name] = 'BA-Test' 
--THEN FORMAT(DATEADD(week, 8, cs.[Start Date]), 'dd/MM/yyyy'),
--ELSE FORMATDATEADD(week, 12, cs.[Start Date]), 'dd/MM/yyyy') AS 'Check Date',
--END AS 'Check Date'
--FROM [Course Schedule] cs
--LEFT JOIN [Course Catalog] cc ON cc.[Course Catalog ID] = cs.[Course Catalog ID]
--LEFT JOIN [Course Schedule Attendees] csa ON csa.[Course Catalog ID] = cc.[Course Catalog ID]
--LEFT JOIN [Course Schedule Trainers] cst ON cst.[Trainer ID] = csa[Trainer ID]
--LEFT JOIN Employees e ON e.[Employee ID] = e.[Employee ID]
--LEFT JOIN Rooms r ON r.[Room ID] = cs.[Room ID]
--LEFT JOIN Academies a ON a.[Academy ID] = r.[Academy ID]
--ORDER BY cs.[Start Date];