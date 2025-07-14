CREATE PROCEDURE SP_Insert_Students_Freelence
    @Student_ID INT = NULL,
    @Project_Title NVARCHAR(255) = NULL,
    @PlatForm NVARCHAR(255) = NULL,
    @Freelence_Income INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    -- Validate Student_ID exists if provided
    IF @Student_ID IS NOT NULL 
        AND NOT EXISTS (SELECT 1 FROM Students WHERE Student_ID = @Student_ID)
        SET @Errors += 'Student ID ' + CAST(@Student_ID AS NVARCHAR(10)) + ' does not exist.' + @NewLine

    -- Validate Project_Title if provided
    IF @Project_Title IS NOT NULL AND LTRIM(RTRIM(@Project_Title)) = ''
        SET @Errors += 'Project Title cannot be empty.' + @NewLine

    -- Validate PlatForm if provided
    IF @PlatForm IS NOT NULL AND LTRIM(RTRIM(@PlatForm)) = ''
        SET @Errors += 'Platform cannot be empty.' + @NewLine

    -- Validate Freelence_Income if provided
    IF @Freelence_Income IS NOT NULL AND @Freelence_Income < 0
        SET @Errors += 'Freelance Income cannot be negative.' + @NewLine

    -- Return errors if any
    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    -- Insert the record
    BEGIN TRY
        INSERT INTO Students_Freelence (
            Student_ID,
            Project_Title,
            PlatForm,
            Freelence_Income
        )
        VALUES (
            @Student_ID,
            @Project_Title,
            @PlatForm,
            @Freelence_Income
        )

        -- Return the newly generated ID
        SELECT SCOPE_IDENTITY() AS NewFreelanceRecordID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO



EXEC SP_Insert_Students_Freelence
    @Student_ID = 1001,
    @Project_Title = 'E-commerce Website Development',
    @PlatForm = 'Upwork',
    @Freelence_Income = 1500
