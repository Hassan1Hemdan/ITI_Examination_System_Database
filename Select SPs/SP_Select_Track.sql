CREATE PROCEDURE SP_Select_Track
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Track'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Track 
    @Columns = N'Track_ID, Track_Name',
    @Condition = N'Duration >= 6'


EXEC SP_Select_Track 
    @Columns = N'Track_Name, Duration'


EXEC SP_Select_Track 
    @Condition = N'Track_Name LIKE ''%Data%'''
