CREATE PROCEDURE SP_Update_Students_Freelence
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

    DECLARE @SQL NVARCHAR(MAX) = 'UPDATE Students_Freelence SET ' + @ColumnUpdates;

    IF @Condition IS NOT NULL AND LTRIM(RTRIM(@Condition)) <> ''
        SET @SQL += ' WHERE ' + @Condition;

    SET @SQL += '; PRINT CAST(@@ROWCOUNT AS NVARCHAR) + '' row(s) updated.'';';

    EXEC sp_executesql @SQL;
END

EXEC SP_Update_Students_Freelence 
    @ColumnUpdates = N'Freelence_Income = 5000, PlatForm = ''Upwork''',
    @Condition = N'Student_Freelence_ID = 2';
