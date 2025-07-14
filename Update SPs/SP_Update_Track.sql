CREATE PROCEDURE SP_Update_Track
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

    DECLARE @SQL NVARCHAR(MAX) = 'UPDATE Track SET ' + @ColumnUpdates;

    IF @Condition IS NOT NULL AND LTRIM(RTRIM(@Condition)) <> ''
        SET @SQL += ' WHERE ' + @Condition;

    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) updated.'';';

    EXEC sp_executesql @SQL;
END

EXEC SP_Update_Track 
    @ColumnUpdates = N'Duration = 180',
    @Condition = N'Track_Name = ''Data Science''';
