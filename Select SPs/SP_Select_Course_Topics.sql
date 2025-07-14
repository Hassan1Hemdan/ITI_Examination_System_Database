CREATE PROCEDURE SP_Select_Course_Topics
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM Course_Topics'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Course_Topics 
    @Columns = N'Course_ID, Topic',
    @Condition = N'Course_ID = 2'


EXEC SP_Select_Course_Topics 
    @Columns = N'Course_Topic_ID, Topic'


EXEC SP_Select_Course_Topics 
    @Condition = N'Topic LIKE ''%Sensors and Actuators - Introduction%'''

