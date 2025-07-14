CREATE PROCEDURE SP_UpdateMulti_Branches
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

    DECLARE @SQL NVARCHAR(MAX) = 'UPDATE Branches SET ' + @ColumnUpdates;

    IF @Condition IS NOT NULL AND LTRIM(RTRIM(@Condition)) <> ''
        SET @SQL += ' WHERE ' + @Condition;

    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) updated.'';';

    EXEC sp_executesql @SQL;
END

EXEC SP_UpdateMulti_Branches 
    @ColumnUpdates = N'Branch_Location = ''Alexandria'', Manager_Phone = ''01200000000''',
    @Condition = N'Branch_ID = 1';
