CREATE PROCEDURE SP_Insert_Students_Jobs
    @Student_ID INT = NULL,
    @Job_Position NVARCHAR(255) = NULL,
    @Company NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    -- Validate Student_ID exists if provided
    IF @Student_ID IS NOT NULL 
        AND NOT EXISTS (SELECT 1 FROM Students WHERE Student_ID = @Student_ID)
        SET @Errors += 'Student ID ' + CAST(@Student_ID AS NVARCHAR(10)) + ' does not exist.' + @NewLine

    -- Validate required fields
    IF @Job_Position IS NULL OR LTRIM(RTRIM(@Job_Position)) = ''
        SET @Errors += 'Job Position cannot be empty.' + @NewLine

    IF @Company IS NULL OR LTRIM(RTRIM(@Company)) = ''
        SET @Errors += 'Company cannot be empty.' + @NewLine

    -- Return errors if any
    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    -- Insert the record
    BEGIN TRY
        INSERT INTO Students_Jobs (
            Student_ID,
            Job_Position,
            Company
        )
        VALUES (
            @Student_ID,
            @Job_Position,
            @Company
        )

        -- Return the newly generated ID
        SELECT SCOPE_IDENTITY() AS NewJobID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO



EXEC SP_Insert_Students_Jobs
    @Student_ID = 1001,
    @Job_Position = 'Software Engineer',
    @Company = 'Microsoft'
