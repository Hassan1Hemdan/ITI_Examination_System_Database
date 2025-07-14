create PROCEDURE SP_Insert_Question
    @Question_Type NVARCHAR(255)= NULL,
    @Question_Content NVARCHAR(255) = NULL,
    @Question_Grade INT,
    @Instructor_ID INT,
    @Course_ID INT,
    -- MCQ data
    @Option1 NVARCHAR(255) = NULL,
    @Option2 NVARCHAR(255) = NULL,
    @Option3 NVARCHAR(255) = NULL,
    @Option4 NVARCHAR(255) = NULL,
    @Correct_Answer_MCQ NVARCHAR(255) = NULL,
    -- True/False data
    @Option1_TF NVARCHAR(255) = NULL,
    @Option2_TF NVARCHAR(255) = NULL,
    @Correct_Answer_TF NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @NewQuestionID INT;
    DECLARE @Errors NVARCHAR(MAX) = '';
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10);
    
    -- Validate basic data
    IF @Question_Type IS NULL OR LTRIM(RTRIM(@Question_Type)) = ''
        SET @Errors += 'Question type is required.' + @NewLine;
    
    IF @Question_Grade IS NULL OR @Question_Grade <= 0
        SET @Errors += 'Question grade must be a positive number.' + @NewLine;
    
    IF @Instructor_ID IS NULL OR NOT EXISTS (SELECT 1 FROM Instructors WHERE Instructor_ID = @Instructor_ID)
        SET @Errors += 'Invalid Instructor ID.' + @NewLine;
    
    IF @Course_ID IS NULL OR NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
        SET @Errors += 'Invalid Course ID.' + @NewLine;
    
    -- Validate question type specific data
    IF @Question_Type = 'MCQ'
    BEGIN
        IF @Option1 IS NULL OR LTRIM(RTRIM(@Option1)) = '' OR
           @Option2 IS NULL OR LTRIM(RTRIM(@Option2)) = '' OR
           @Option3 IS NULL OR LTRIM(RTRIM(@Option3)) = '' OR
           @Option4 IS NULL OR LTRIM(RTRIM(@Option4)) = '' OR
           @Correct_Answer_MCQ IS NULL OR LTRIM(RTRIM(@Correct_Answer_MCQ)) = ''
            SET @Errors += 'All MCQ options and correct answer are required.' + @NewLine;
    END
    ELSE IF @Question_Type = 'True/False'
    BEGIN
        IF @Option1_TF IS NULL OR LTRIM(RTRIM(@Option1_TF)) = '' OR
           @Option2_TF IS NULL OR LTRIM(RTRIM(@Option2_TF)) = '' OR
           @Correct_Answer_TF IS NULL OR LTRIM(RTRIM(@Correct_Answer_TF)) = ''
            SET @Errors += 'All True/False options and correct answer are required.' + @NewLine;
    END
    ELSE
    BEGIN
        SET @Errors += 'Question type must be either MCQ or True/False.' + @NewLine;
    END
    
    -- If there are errors, return them
    IF @Errors <> ''
    BEGIN
        PRINT @Errors;
        RETURN;
    END
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- First: Insert into main Questions table
        INSERT INTO Questions (
            Question_Type,
            Question_Content,
            Question_Grade,
            Instructor_ID,
            Course_ID
        )
        VALUES (
            @Question_Type,
            @Question_Content,
            @Question_Grade,
            @Instructor_ID,
            @Course_ID
        );
        
        -- Second: Get the new ID
        SET @NewQuestionID = SCOPE_IDENTITY();
        
        -- Third: Insert into detail table based on question type
        IF @Question_Type = 'MCQ'
        BEGIN
            INSERT INTO MCQ_Questions (
                Question_ID,
                Question,
                Option1,
                Option2,
                Option3,
                Option4,
                Correct_Answer
            )
            VALUES (
                @NewQuestionID,
                @Question_Content,
                @Option1,
                @Option2,
                @Option3,
                @Option4,
                @Correct_Answer_MCQ
            );
        END
        ELSE IF @Question_Type = 'True/False'
        BEGIN
            INSERT INTO True_False_Questions (
                Question_ID,
                Question,
                Option1,
                Option2,
                Correct_Answer
            )
            VALUES (
                @NewQuestionID,
                @Question_Content,
                @Option1_TF,
                @Option2_TF,
                @Correct_Answer_TF
            );
        END
        
        COMMIT TRANSACTION;
        
        -- Return the new ID
        SELECT @NewQuestionID AS NewQuestionID;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END
GO



EXEC SP_Insert_Question
    @Question_Type = 'True/False',
    @Question_Content = 'The Earth is flat',
    @Question_Grade = 3,
    @Instructor_ID = 1,
    @Course_ID = 101,
    @Option1_TF = 'True',
    @Option2_TF = 'False',
    @Correct_Answer_TF = 'False';


EXEC SP_Insert_Question
    @Question_Type = 'MCQ',
    @Question_Content = 'What is the capital of France?',
    @Question_Grade = 5,
    @Instructor_ID = 1,
    @Course_ID = 101,
    @Option1 = 'London',
    @Option2 = 'Paris',
    @Option3 = 'Berlin',
    @Option4 = 'Madrid',
    @Correct_Answer_MCQ = 'Paris';




