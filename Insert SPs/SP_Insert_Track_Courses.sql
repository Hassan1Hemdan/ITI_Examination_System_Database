CREATE PROCEDURE SP_Insert_Track_Courses
    @Track_ID INT = NULL,
    @Course_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Track_ID IS NULL
        SET @Errors += 'Track ID cannot be NULL.' + @NewLine
    ELSE IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
        SET @Errors += 'Track ID does not exist.' + @NewLine

    IF @Course_ID IS NULL
        SET @Errors += 'Course ID cannot be NULL.' + @NewLine
    ELSE IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
        SET @Errors += 'Course ID does not exist.' + @NewLine

    IF @Track_ID IS NOT NULL AND @Course_ID IS NOT NULL
        AND EXISTS (SELECT 1 FROM Track_Courses 
                   WHERE Track_ID = @Track_ID AND Course_ID = @Course_ID)
        SET @Errors += 'This course is already assigned to this track.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    BEGIN TRY
        INSERT INTO Track_Courses (
            Track_ID,
            Course_ID
        )
        VALUES (
            @Track_ID,
            @Course_ID
        )

        PRINT 'Course successfully assigned to track.'
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO


EXEC SP_Insert_Track_Courses @Track_ID = 1, @Course_ID = 101