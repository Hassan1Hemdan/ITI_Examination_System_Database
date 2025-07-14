CREATE PROCEDURE SP_Insert_Teaches
    @Instructor_ID INT,
    @Course_ID INT,
    @Start_teaching_Date DATE,
    @End_teaching_Date DATE = NULL,
    @Teaching_times INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    -- Validate Instructor exists
    IF NOT EXISTS (SELECT 1 FROM Instructors WHERE Instructor_ID = @Instructor_ID)
        SET @Errors += 'Instructor ID does not exist.' + @NewLine

    -- Validate Course exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
        SET @Errors += 'Course ID does not exist.' + @NewLine

    -- Validate primary key not already exists
    IF EXISTS (SELECT 1 FROM Teaches WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Course_ID)
        SET @Errors += 'This instructor is already assigned to teach this course.' + @NewLine

    -- Validate date logic
    IF @End_teaching_Date IS NOT NULL AND @End_teaching_Date < @Start_teaching_Date
        SET @Errors += 'End date cannot be before start date.' + @NewLine

    -- Validate teaching times
    IF @Teaching_times IS NOT NULL AND @Teaching_times <= 0
        SET @Errors += 'Teaching times must be positive if provided.' + @NewLine

    -- Return errors if any
    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    -- Insert the record
    BEGIN TRY
        INSERT INTO Teaches (
            Instructor_ID,
            Course_ID,
            Start_teaching_Date,
            End_teaching_Date,
            Teaching_times
        )
        VALUES (
            @Instructor_ID,
            @Course_ID,
            @Start_teaching_Date,
            @End_teaching_Date,
            @Teaching_times
        )

        PRINT 'Teaching assignment added successfully.'
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO


EXEC SP_Insert_Teaches
    @Instructor_ID = 101,
    @Course_ID = 1,
    @Start_teaching_Date = '2023-09-01',
    @End_teaching_Date = '2023-12-15',
    @Teaching_times = 30