CREATE DATABASE Epam4
GO
use Epam4;

CREATE TABLE TaskStatus
(
	Id INT IDENTITY,
	[Status] NVARCHAR(250) NOT NULL UNIQUE,
	CONSTRAINT PK_TaskStatus_Id PRIMARY KEY (Id)
)

CREATE TABLE Project
(
	Id INT IDENTITY,
	ProjectName NVARCHAR(250) NOT NULL UNIQUE,
	Created DATE NOT NULL,
	Finished DATE NOT NULL,
	ProjectStatus BIT NOT NULL,
	CONSTRAINT PK_Project_Id PRIMARY KEY (Id)
)

CREATE TABLE Task
(
	Id INT IDENTITY,
	TaskContent NVARCHAR(250) NOT NULL UNIQUE,
	TaskStatus INT NOT NULL,
	Deadline Date NOT NULL,
	Project INT NOT NULL,
	CONSTRAINT PK_Task_Id PRIMARY KEY(Id),
	CONSTRAINT FK_Task_TaskStatus FOREIGN KEY (TaskStatus) REFERENCES TaskStatus(Id),
	CONSTRAINT FK_Task_Project FOREIGN KEY (Project) REFERENCES Project(Id)
)

CREATE TABLE Employee
(
	Id INT IDENTITY,
	Name NVARCHAR(250) NOT NULL,
	CONSTRAINT PK_Employee_Id PRIMARY KEY(Id)
)

CREATE TABLE Position
(
	Id INT IDENTITY,
	Position NVARCHAR(250) NOT NULL UNIQUE,
	CONSTRAINT PK_Position_Id PRIMARY KEY(Id)
)

CREATE TABLE Worker
(
	Id INT IDENTITY,
	EmpId INT NOT NULL,
	PosId INT NOT NULL,
	CONSTRAINT PK_EmplPos_Id PRIMARY KEY(Id),
	CONSTRAINT FK_EmplPos_EmpId FOREIGN KEY(EmpId) REFERENCES Employee(Id),
	CONSTRAINT FK_EmplPos_PosId FOREIGN KEY(PosId) REFERENCES Position(Id)
)

CREATE TABLE TaskWorker
(
	Id INT IDENTITY,
	TaskId INT NOT NULL,
	WorkerId INT NOT NULL,
	CONSTRAINT PK_TaskWorker_Id PRIMARY KEY(Id),
	CONSTRAINT FK_TaskWorker_TaskId FOREIGN KEY(TaskId) REFERENCES Task(Id),
	CONSTRAINT FK_TaskWorker_WorkerId FOREIGN KEY(WorkerId) REFERENCES Worker(Id)
)
