CREATE PROCEDURE SP_Update_Questions
    @ColumnUpdates NVARCHAR(MAX),
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @ColumnUpdates IS NULL OR LTRIM(RTRIM(@ColumnUpdates)) = ''
    BEGIN
        PRINT 'Error: No columns provided to update.';
        RETURN;
    END

    DECLARE @SQL NVARCHAR(MAX) = 'UPDATE Questions SET ' + @ColumnUpdates;

    IF @Condition IS NOT NULL AND LTRIM(RTRIM(@Condition)) <> ''
        SET @SQL += ' WHERE ' + @Condition;

    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) updated.'';';

    EXEC sp_executesql @SQL;
END

EXEC SP_Update_Questions 
    @ColumnUpdates = N'Question_Grade = 5',
    @Condition = N'Question_ID = 7';
