CREATE PROCEDURE SP_Update_Teaches
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

    DECLARE @SQL NVARCHAR(MAX) = 'UPDATE Teaches SET ' + @ColumnUpdates;

    IF @Condition IS NOT NULL AND LTRIM(RTRIM(@Condition)) <> ''
        SET @SQL += ' WHERE ' + @Condition;

    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) updated.'';';

    EXEC sp_executesql @SQL;
END

EXEC SP_Update_Teaches 
    @ColumnUpdates = N'Teaching_times = 15, End_teaching_Date = ''2025-08-01''',
    @Condition = N'Instructor_ID = 2 AND Course_ID = 3';
