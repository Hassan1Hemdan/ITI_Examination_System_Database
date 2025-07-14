CREATE PROCEDURE SP_Insert_Student_Training
    @Student_ID INT = NULL,
    @Training_ID INT = NULL,
    @English_grade INT = NULL,
    @IQ_grade INT = NULL,
    @Technical_Interview_grade INT = NULL,
    @Soft_Skills_Interview_grade INT = NULL,
    @ITI_Graduation_Status NVARCHAR(255) = NULL,
    @ITI_Graduation_Year INT = NULL,
    @ST_Q1_Rating_Answers INT = NULL,
    @ST_Q2_Rating_Answers INT = NULL,
    @ST_Q3_Rating_Answers INT = NULL,
    @ST_Q4_Rating_Answers INT = NULL,
    @ST_Q5_Rating_Answers INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)


    IF EXISTS (
        SELECT 1 FROM Student_Training 
        WHERE Student_ID = @Student_ID 
          AND Training_ID = @Training_ID
    )
    BEGIN
        SET @Errors += 'Record with the same Student_ID and Training_ID already exists.' + @NewLine
    END


    IF @Student_ID IS NULL
        SET @Errors += 'Student_ID cannot be NULL.' + @NewLine

    IF @Training_ID IS NULL
        SET @Errors += 'Training_ID cannot be NULL.' + @NewLine

    IF @English_grade IS NULL
        SET @Errors += 'English_grade cannot be NULL.' + @NewLine

    IF @IQ_grade IS NULL
        SET @Errors += 'IQ_grade cannot be NULL.' + @NewLine

    IF @Technical_Interview_grade IS NULL
        SET @Errors += 'Technical_Interview_grade cannot be NULL.' + @NewLine

    IF @Soft_Skills_Interview_grade IS NULL
        SET @Errors += 'Soft_Skills_Interview_grade cannot be NULL.' + @NewLine


    IF @ITI_Graduation_Year IS NOT NULL AND @ITI_Graduation_Year < 1900
        SET @Errors += 'ITI_Graduation_Year must be a valid year (>= 1900).' + @NewLine

    IF @ST_Q1_Rating_Answers IS NOT NULL AND (@ST_Q1_Rating_Answers < 1 OR @ST_Q1_Rating_Answers > 5)
        SET @Errors += 'ST_Q1_Rating_Answers must be between 1 and 5.' + @NewLine

    IF @ST_Q2_Rating_Answers IS NOT NULL AND (@ST_Q2_Rating_Answers < 1 OR @ST_Q2_Rating_Answers > 5)
        SET @Errors += 'ST_Q2_Rating_Answers must be between 1 and 5.' + @NewLine

    IF @ST_Q3_Rating_Answers IS NOT NULL AND (@ST_Q3_Rating_Answers < 1 OR @ST_Q3_Rating_Answers > 5)
        SET @Errors += 'ST_Q3_Rating_Answers must be between 1 and 5.' + @NewLine

    IF @ST_Q4_Rating_Answers IS NOT NULL AND (@ST_Q4_Rating_Answers < 1 OR @ST_Q4_Rating_Answers > 5)
        SET @Errors += 'ST_Q4_Rating_Answers must be between 1 and 5.' + @NewLine

    IF @ST_Q5_Rating_Answers IS NOT NULL AND (@ST_Q5_Rating_Answers < 1 OR @ST_Q5_Rating_Answers > 5)
        SET @Errors += 'ST_Q5_Rating_Answers must be between 1 and 5.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    -- 6. Try to insert
    BEGIN TRY
        INSERT INTO Student_Training (
            Student_ID,
            Training_ID,
            English_grade,
            IQ_grade,
            Technical_Interview_grade,
            Soft_Skills_Interview_grade,
            ITI_Graduation_Status,
            ITI_Graduation_Year,
            ST_Q1_Rating_Answers,
            ST_Q2_Rating_Answers,
            ST_Q3_Rating_Answers,
            ST_Q4_Rating_Answers,
            ST_Q5_Rating_Answers
        )
        VALUES (
            @Student_ID,
            @Training_ID,
            @English_grade,
            @IQ_grade,
            @Technical_Interview_grade,
            @Soft_Skills_Interview_grade,
            @ITI_Graduation_Status,
            @ITI_Graduation_Year,
            @ST_Q1_Rating_Answers,
            @ST_Q2_Rating_Answers,
            @ST_Q3_Rating_Answers,
            @ST_Q4_Rating_Answers,
            @ST_Q5_Rating_Answers
        )

        PRINT 'Student training record inserted successfully.'
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 2627
            PRINT 'Error: Duplicate primary key. Student_ID and Training_ID combination already exists.'
        ELSE
            PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO

EXEC SP_Insert_Student_Training
    @Student_ID = 123,
    @Training_ID = 456,
    @English_grade = 80,
    @IQ_grade = 90,
    @Technical_Interview_grade = 85,
    @Soft_Skills_Interview_grade = 75,
    @ITI_Graduation_Status = 'Graduated',
    @ITI_Graduation_Year = 2023,
    @ST_Q1_Rating_Answers = 4,
    @ST_Q2_Rating_Answers = 5,
    @ST_Q3_Rating_Answers = 3,
    @ST_Q4_Rating_Answers = 4,
    @ST_Q5_Rating_Answers = 5