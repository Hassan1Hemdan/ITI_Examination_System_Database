CREATE PROCEDURE SP_Select_Courses
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM Course'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END


EXEC SP_Select_Courses 
    @Columns = N'Course_ID, Course_Name',
    @Condition = N'Course_Period >= 50'

EXEC SP_Select_Courses 
    @Columns = N'Course_ID, Course_Name'
	
EXEC SP_Select_Courses 
    @Condition = N'Course_Period >= 50'
