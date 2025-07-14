CREATE DATABASE ITIPortsaid
GO

USE ITIPortsaid
GO


CREATE TABLE [Course] (
  [Course_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Course_Name] nvarchar(255) NOT NULL,
  [Course_Type] nvarchar(225) NOT NULL,
  [Course_Period] int NOT NULL,
  [Max_Grade] int NOT NULL,
  [Min_Grade] int NOT NULL
)
GO

CREATE TABLE [Course_Topics] (
  [Course_ID] int NOT NULL,
  [Topic] nvarchar(255) NOT NULL,
  PRIMARY KEY ([Course_ID], [Topic])
)
GO

CREATE TABLE [Questions] (
  [Question_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Question_Type] nvarchar(255) NOT NULL,
  [Question_Content] nvarchar(255) ,
  [Question_Grade] int NOT NULL,
  [Instructor_ID] int NOT NULL,
  [Course_ID] int NOT NULL
)
GO

CREATE TABLE [MCQ_Questions] (
  [Question_ID] int PRIMARY KEY,
  [Question] nvarchar(MAX) NOT NULL,
  [Option1] nvarchar(255) NOT NULL,
  [Option2] nvarchar(255) NOT NULL,
  [Option3] nvarchar(255) NOT NULL,
  [Option4] nvarchar(255) NOT NULL,
  [Correct_Answer] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [True_False_Questions] (
  [Question_ID] int PRIMARY KEY,
  [Question] nvarchar(MAX) NOT NULL,
  [Option1] nvarchar(255) NOT NULL,
  [Option2] nvarchar(255) NOT NULL,
  [Correct_Answer] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Track] (
  [Track_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Track_Name] nvarchar(255) NOT NULL,
  [Duration] int Not NULL
)
GO

CREATE TABLE [Track_Courses] (
  [Track_ID] int NOT NULL,
  [Course_ID] int NOT NULL,
  PRIMARY KEY ([Track_ID], [Course_ID])
)
GO

CREATE TABLE [Branches] (
  [Branch_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Branch_Name] nvarchar(255) NOT NULL,
  [Branch_Location] nvarchar(255),
  [Branch_Phone] nvarchar(255),
  [Manager_F_Name] nvarchar(255),
  [Manager_L_Name] nvarchar(255),
  [Gender] char(1)CHECK ([Gender] IN ('M', 'F', 'm', 'f')),
  [Manager_DOB] date,
  [Manager_Hire_Date] date,
  [Manager_Address] nvarchar(255),
  [Manager_Email] nvarchar(255),
  [Manager_Phone] nvarchar(255)
)
GO

CREATE TABLE [Training] (
  [Training_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Intake_ID] int NOT NULL,
  [Branch_ID] int NOT NULL,
  [Track_ID] int NOT NULL,
  [Num_Accepted] int NOT NULL,
  [Num_Registrants] int NOT NULL
)
GO

CREATE TABLE [Intake] (
  [Intake_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Intake_Name] nvarchar(255) NOT NULL,
  [Start_Date] date NOT NULL,
  [End_Date] date NOT NULL
)
GO

CREATE TABLE [Student_Training] (
  [Student_ID] int,
  [Training_ID] int,
  [English_grade] int NOT NULL,
  [IQ_grade] int NOT NULL,
  [Technical_Interview_grade] int NOT NULL,
  [Soft_Skills_Interview_grade] int NOT NULL,
  [ITI_Graduation_Status] nvarchar(255),
  [ITI_Graduation_Year] int,
  [ST_Q1_Rating_Answers] int,
  [ST_Q2_Rating_Answers] int,
  [ST_Q3_Rating_Answers] int,
  [ST_Q4_Rating_Answers] int,
  [ST_Q5_Rating_Answers] int,
  PRIMARY KEY ([Student_ID], [Training_ID])
)
GO

CREATE TABLE [Exams] (
  [Exam_ID] int IDENTITY(1,1) PRIMARY KEY,
  [Course_ID] int NOT NULL,
  [Training_ID] int NOT NULL,
  [Exam_Date] date,
  [Max_Degree] int NOT NULL,
  [Start_Time] time,
  [End_Time] time,
  [Duration] int
)
GO

CREATE TABLE [Student_Answers] (
  [Student_ID] int,
  [Exam_ID] int,
  [Question_ID] int,
  [St_Answer] nvarchar(MAX) NOT NULL,
  [St_Grade] int,
  PRIMARY KEY ([Student_ID], [Exam_ID], [Question_ID])
)
GO

CREATE TABLE [Teaches] (
  [Instructor_ID] int,
  [Course_ID] int,
  [Start_teaching_Date] date NOT NULL,
  [End_teaching_Date] date,
  [Teaching_times] int,
  PRIMARY KEY ([Instructor_ID], [Course_ID])
)
GO

CREATE TABLE [Student_Courses] (
  [Student_ID] int,
  [Training_ID] int,
  [Course_ID] int,
  [Instructor_ID] int,
  [Attendence_Rate] float,
  [Tasks_Rate] float,
  [Total_Grade] float,
  [ST_Q1_Rating_Answers] int,
  [ST_Q2_Rating_Answers] int,
  [ST_Q3_Rating_Answers] int,
  [ST_Q4_Rating_Answers] int,
  [ST_Q5_Rating_Answers] int,
  PRIMARY KEY ([Student_ID], [Course_ID], [Training_ID])
)
GO

CREATE TABLE [Exam_Questions] (
  [Question_ID] int,
  [Exam_ID] int,
  PRIMARY KEY ([Question_ID], [Exam_ID])
)
GO

CREATE TABLE [Instructors] (
  [Instructor_ID] int IDENTITY(1,1) PRIMARY KEY,
  [F_Name] nvarchar(255) NOT NULL,
  [L_Name] nvarchar(255) NOT NULL,
  [Gender] char(1) NOT NULL CHECK ([Gender] IN ('M', 'F', 'm', 'f')),
  [DOB] date NOT NULL,
  [Address] nvarchar(255) NOT NULL,
  [Phone] nvarchar(255) NOT NULL,
  [Department] nvarchar(255) NOT NULL,
  [Hire_Date] date NOT NULL,
  [ITI_Account_email] nvarchar(255) NOT NULL,
  [ITI_Account_Name] nvarchar(255) NOT NULL,
  [ITI_Account_Password_Hashed] varbinary(256) NOT NULL,
  [ITI_Account_Last_Modified] datetime
)
GO

CREATE TABLE [Students] (
  [Student_ID] int IDENTITY(1,1) PRIMARY KEY,
  [F_Name] nvarchar(255) NOT NULL,
  [L_Name] nvarchar(255) NOT NULL,
  [Gender] char(1) NOT NULL CHECK ([Gender] IN ('M', 'F', 'm', 'f')),
  [DOB] date NOT NULL,
  [Address] nvarchar(255) NOT NULL,
  [Phone] nvarchar(255) NOT NULL,
  [University] nvarchar(255) NOT NULL,
  [Faculty] nvarchar(255) NOT NULL,
  [Department] nvarchar(255),
  [Graduation_Year] int NOT NULL,
  [ITI_Account_Email] nvarchar(255) NOT NULL,
  [ITI_Account_Name] nvarchar(255) NOT NULL,
  [ITI_Account_Password_Hashed] varbinary(256) NOT NULL,
  [ITI_Account_Last_Modified] datetime,
  [Facebook_Account] nvarchar(255),
  [Twitter_Account] nvarchar(255)
)
GO

CREATE TABLE [Students_Jobs] (
  [Student_ID] int,
  [Job_ID] int,
  [Job_Position] nvarchar(255) NOT NULL,
  [Company] nvarchar(255) NOT NULL,
  PRIMARY KEY ([Student_ID], [Job_ID])
)
GO

CREATE TABLE [Students_Certificates] (
  [Student_ID] int,
  [Certificate_ID] int,
  [Certificate_Name] nvarchar(255) NOT NULL,
  [Company_Institute] nvarchar(255) NOT NULL,
  [Duration] int NOT NULL,
  [Price] int NOT NULL,
  [Expire_Duration] int NOT NULL,
  PRIMARY KEY ([Student_ID], [Certificate_ID])
)
GO


CREATE TABLE [Students_Freelence] (
  [Student_ID] int,
  [Project_Title] nvarchar(255),
  [PlatForm] nvarchar(255),
  PRIMARY KEY ([Student_ID], [Project_Title], [PlatForm])
)
GO

ALTER TABLE [Students_Certificates] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO

ALTER TABLE [Course_Topics] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [Questions] ADD FOREIGN KEY ([Instructor_ID]) REFERENCES [Instructors] ([Instructor_ID])
GO

ALTER TABLE [Questions] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [MCQ_Questions] ADD FOREIGN KEY ([Question_ID]) REFERENCES [Questions] ([Question_ID])
GO

ALTER TABLE [True_False_Questions] ADD FOREIGN KEY ([Question_ID]) REFERENCES [Questions] ([Question_ID])
GO

ALTER TABLE [Track_Courses] ADD FOREIGN KEY ([Track_ID]) REFERENCES [Track] ([Track_ID])
GO

ALTER TABLE [Track_Courses] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [Training] ADD FOREIGN KEY ([Intake_ID]) REFERENCES [Intake] ([Intake_ID])
GO

ALTER TABLE [Training] ADD FOREIGN KEY ([Branch_ID]) REFERENCES [Branches] ([Branch_ID])
GO

ALTER TABLE [Training] ADD FOREIGN KEY ([Track_ID]) REFERENCES [Track] ([Track_ID])
GO

ALTER TABLE [Student_Training] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO

ALTER TABLE [Student_Training] ADD FOREIGN KEY ([Training_ID]) REFERENCES [Training] ([Training_ID])
GO

ALTER TABLE [Exams] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [Student_Answers] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO

ALTER TABLE [Student_Answers] ADD FOREIGN KEY ([Exam_ID]) REFERENCES [Exams] ([Exam_ID])
GO

ALTER TABLE [Student_Answers] ADD FOREIGN KEY ([Question_ID]) REFERENCES [Questions] ([Question_ID])
GO

ALTER TABLE [Exams] ADD FOREIGN KEY ([Training_ID]) REFERENCES [Training] ([Training_ID])
GO

ALTER TABLE [Teaches] ADD FOREIGN KEY ([Instructor_ID]) REFERENCES [Instructors] ([Instructor_ID])
GO

ALTER TABLE [Teaches] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [Student_Courses] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO

ALTER TABLE [Student_Courses] ADD FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([Course_ID])
GO

ALTER TABLE [Student_Courses] ADD FOREIGN KEY ([Training_ID]) REFERENCES [Training] ([Training_ID])
GO

ALTER TABLE [Student_Courses] ADD FOREIGN KEY ([Instructor_ID]) REFERENCES [Instructors] ([Instructor_ID])
GO

ALTER TABLE [Exam_Questions] ADD FOREIGN KEY ([Question_ID]) REFERENCES [Questions] ([Question_ID])
GO

ALTER TABLE [Exam_Questions] ADD FOREIGN KEY ([Exam_ID]) REFERENCES [Exams] ([Exam_ID])
GO

ALTER TABLE [Students_Jobs] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO

ALTER TABLE [Students_Freelence] ADD FOREIGN KEY ([Student_ID]) REFERENCES [Students] ([Student_ID])
GO
