CREATE PROCEDURE SP_Select_Teaches
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Teaches'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Teaches 
    @Columns = N'Instructor_ID, Course_ID, Teaching_times',
    @Condition = N'Teaching_times >= 10'


EXEC SP_Select_Teaches 
    @Columns = N'Start_teaching_Date, End_teaching_Date'

EXEC SP_Select_Teaches 
    @Condition = N'Instructor_ID = 5'
