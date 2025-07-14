CREATE PROCEDURE SP_Select_Track_Courses
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Track_Courses'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Track_Courses 
    @Columns = N'Track_ID, Course_ID',
    @Condition = N'Track_ID = 3'

EXEC SP_Select_Track_Courses 
    @Columns = N'Course_ID'


EXEC SP_Select_Track_Courses 
    @Condition = N'Course_ID IN (1, 2, 3)'


