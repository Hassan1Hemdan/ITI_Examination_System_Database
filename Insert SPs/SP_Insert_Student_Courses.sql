CREATE PROCEDURE SP_Insert_Student_Courses
    @Student_ID NVARCHAR(50) = NULL,
    @Training_ID NVARCHAR(50) = NULL,
    @Course_ID NVARCHAR(50) = NULL,
    @Instructor_ID NVARCHAR(50) = NULL,
    @Attendence_Rate NVARCHAR(50) = NULL,
    @Tasks_Rate NVARCHAR(50) = NULL,
    @Total_Grade NVARCHAR(50) = NULL,
    @ST_Q1_Rating_Answers NVARCHAR(50) = NULL,
    @ST_Q2_Rating_Answers NVARCHAR(50) = NULL,
    @ST_Q3_Rating_Answers NVARCHAR(50) = NULL,
    @ST_Q4_Rating_Answers NVARCHAR(50) = NULL,
    @ST_Q5_Rating_Answers NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Student_ID IS NULL
        SET @Errors += 'Student_ID cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Student_ID AS INT) IS NULL
        SET @Errors += 'Student_ID must be INT.' + @NewLine

    IF @Training_ID IS NULL
        SET @Errors += 'Training_ID cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Training_ID AS INT) IS NULL
        SET @Errors += 'Training_ID must be INT.' + @NewLine

    IF @Course_ID IS NULL
        SET @Errors += 'Course_ID cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Course_ID AS INT) IS NULL
        SET @Errors += 'Course_ID must be INT.' + @NewLine

    IF @Instructor_ID IS NOT NULL AND TRY_CAST(@Instructor_ID AS INT) IS NULL
        SET @Errors += 'Instructor_ID must be INT.' + @NewLine

    IF @Attendence_Rate IS NOT NULL AND TRY_CAST(@Attendence_Rate AS FLOAT) IS NULL
        SET @Errors += 'Attendence_Rate must be FLOAT.' + @NewLine

    IF @Tasks_Rate IS NOT NULL AND TRY_CAST(@Tasks_Rate AS FLOAT) IS NULL
        SET @Errors += 'Tasks_Rate must be FLOAT.' + @NewLine

    IF @Total_Grade IS NOT NULL AND TRY_CAST(@Total_Grade AS FLOAT) IS NULL
        SET @Errors += 'Total_Grade must be FLOAT.' + @NewLine

    IF @ST_Q1_Rating_Answers IS NOT NULL AND TRY_CAST(@ST_Q1_Rating_Answers AS INT) IS NULL
        SET @Errors += 'ST_Q1_Rating_Answers must be INT.' + @NewLine

    IF @ST_Q2_Rating_Answers IS NOT NULL AND TRY_CAST(@ST_Q2_Rating_Answers AS INT) IS NULL
        SET @Errors += 'ST_Q2_Rating_Answers must be INT.' + @NewLine

    IF @ST_Q3_Rating_Answers IS NOT NULL AND TRY_CAST(@ST_Q3_Rating_Answers AS INT) IS NULL
        SET @Errors += 'ST_Q3_Rating_Answers must be INT.' + @NewLine

    IF @ST_Q4_Rating_Answers IS NOT NULL AND TRY_CAST(@ST_Q4_Rating_Answers AS INT) IS NULL
        SET @Errors += 'ST_Q4_Rating_Answers must be INT.' + @NewLine

    IF @ST_Q5_Rating_Answers IS NOT NULL AND TRY_CAST(@ST_Q5_Rating_Answers AS INT) IS NULL
        SET @Errors += 'ST_Q5_Rating_Answers must be INT.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Student_Courses (
        Student_ID,
        Training_ID,
        Course_ID,
        Instructor_ID,
        Attendence_Rate,
        Tasks_Rate,
        Total_Grade,
        ST_Q1_Rating_Answers,
        ST_Q2_Rating_Answers,
        ST_Q3_Rating_Answers,
        ST_Q4_Rating_Answers,
        ST_Q5_Rating_Answers
    )
    VALUES (
        TRY_CAST(@Student_ID AS INT),
        TRY_CAST(@Training_ID AS INT),
        TRY_CAST(@Course_ID AS INT),
        TRY_CAST(@Instructor_ID AS INT),
        TRY_CAST(@Attendence_Rate AS FLOAT),
        TRY_CAST(@Tasks_Rate AS FLOAT),
        TRY_CAST(@Total_Grade AS FLOAT),
        TRY_CAST(@ST_Q1_Rating_Answers AS INT),
        TRY_CAST(@ST_Q2_Rating_Answers AS INT),
        TRY_CAST(@ST_Q3_Rating_Answers AS INT),
        TRY_CAST(@ST_Q4_Rating_Answers AS INT),
        TRY_CAST(@ST_Q5_Rating_Answers AS INT)
    )
END
GO

EXEC SP_Insert_Student_Courses
    @Student_ID = N'1',
    @Training_ID = N'101',
    @Course_ID = N'5',
    @Instructor_ID = N'3',
    @Attendence_Rate = N'85.5',
    @Tasks_Rate = N'90',
    @Total_Grade = N'88',
    @ST_Q1_Rating_Answers = N'4',
    @ST_Q2_Rating_Answers = N'5',
    @ST_Q3_Rating_Answers = N'4',
    @ST_Q4_Rating_Answers = N'3',
    @ST_Q5_Rating_Answers = N'5'
