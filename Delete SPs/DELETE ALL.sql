-- DELETE Stored Procedures for All Tables in ITIPortsaid

-- Branches
CREATE PROCEDURE SP_Delete_Branches
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Branches WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

EXEC SP_Delete_Students_Jobs @Condition = N'Student_ID = 5';


-- Course
CREATE PROCEDURE SP_Delete_Course
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Course WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Course_Topics
CREATE PROCEDURE SP_Delete_Course_Topics
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Course_Topics WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Exam_Questions
CREATE PROCEDURE SP_Delete_Exam_Questions
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Exam_Questions WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Exams
CREATE PROCEDURE SP_Delete_Exams
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Exams WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Instructors
CREATE PROCEDURE SP_Delete_Instructors
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Instructors WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Intake
CREATE PROCEDURE SP_Delete_Intake
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Intake WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- MCQ_Questions
CREATE PROCEDURE SP_Delete_MCQ_Questions
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM MCQ_Questions WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Questions
CREATE PROCEDURE SP_Delete_Questions
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Questions WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Student_Answers
CREATE PROCEDURE SP_Delete_Student_Answers
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Student_Answers WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Students
CREATE PROCEDURE SP_Delete_Students
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Students WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Student_Courses
CREATE PROCEDURE SP_Delete_Student_Courses
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Student_Courses WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Student_Training
CREATE PROCEDURE SP_Delete_Student_Training
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Student_Training WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Students_Freelence
CREATE PROCEDURE SP_Delete_Students_Freelence
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Students_Freelence WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Students_Jobs
CREATE PROCEDURE SP_Delete_Students_Jobs
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Students_Jobs WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Teaches
CREATE PROCEDURE SP_Delete_Teaches
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Teaches WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Track
CREATE PROCEDURE SP_Delete_Track
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Track WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Track_Courses
CREATE PROCEDURE SP_Delete_Track_Courses
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Track_Courses WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Training
CREATE PROCEDURE SP_Delete_Training
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Training WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- True_False_Questions
CREATE PROCEDURE SP_Delete_True_False_Questions
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM True_False_Questions WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END

-- Students_Certificates
CREATE PROCEDURE SP_Delete_Students_Certificates
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Condition IS NULL OR LTRIM(RTRIM(@Condition)) = ''
    BEGIN
        PRINT 'Error: You must provide a WHERE condition to delete records.';
        RETURN;
    END
    DECLARE @SQL NVARCHAR(MAX) = 'DELETE FROM Students_Certificates WHERE ' + @Condition;
    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) deleted.'';';
    EXEC sp_executesql @SQL;
END



EXEC SP_Delete_Branches @Condition = N'Branch_ID = 1';
EXEC SP_Delete_Course @Condition = N'Course_ID = 1';
EXEC SP_Delete_Course_Topics @Condition = N'Course_Topic_ID = 1';
EXEC SP_Delete_Exam_Questions @Condition = N'Exam_ID = 1';
EXEC SP_Delete_Exams @Condition = N'Exam_ID = 1';
EXEC SP_Delete_Instructors @Condition = N'Instructor_ID = 1';
EXEC SP_Delete_Intake @Condition = N'Intake_ID = 1';
EXEC SP_Delete_MCQ_Questions @Condition = N'Question_ID = 1';
EXEC SP_Delete_Questions @Condition = N'Question_ID = 1';
EXEC SP_Delete_Student_Answers @Condition = N'Student_ID = 1';
EXEC SP_Delete_Students @Condition = N'Student_ID = 1';
EXEC SP_Delete_Student_Courses @Condition = N'Student_ID = 1';
EXEC SP_Delete_Student_Training @Condition = N'Student_ID = 1';
EXEC SP_Delete_Students_Freelence @Condition = N'Student_ID = 1';
EXEC SP_Delete_Students_Jobs @Condition = N'Student_ID = 1';
EXEC SP_Delete_Teaches @Condition = N'Instructor_ID = 1';
EXEC SP_Delete_Track @Condition = N'Track_ID = 1';
EXEC SP_Delete_Track_Courses @Condition = N'Track_ID = 1';
EXEC SP_Delete_Training @Condition = N'Training_ID = 1';
EXEC SP_Delete_True_False_Questions @Condition = N'Question_ID = 1';
EXEC SP_Delete_Students_Certificates @Condition = N'Student_ID = 1';
