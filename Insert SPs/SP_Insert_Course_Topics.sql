CREATE PROCEDURE SP_Insert_Course_Topics
    @Course_ID NVARCHAR(50) = NULL,
    @Topic NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Course_ID IS NULL
        SET @Errors += 'Course_ID cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Course_ID AS INT) IS NULL
        SET @Errors += 'Course_ID must be INT.' + @NewLine

    IF @Topic IS NULL
        SET @Errors += 'Topic cannot be NULL.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Course_Topics (Course_ID, Topic)
    VALUES (
        CAST(@Course_ID AS INT),
        @Topic
    )
END
GO

EXEC SP_Insert_Course_Topics
    @Course_ID = N'1',
    @Topic = N'Introduction to Programming'
