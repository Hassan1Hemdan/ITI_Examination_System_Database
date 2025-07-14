CREATE PROCEDURE SP_Select_Exams
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Exams'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Exams 
    @Columns = N'Exam_ID, Exam_Date, Max_Degree',
    @Condition = N'Max_Degree >= 80'


EXEC SP_Select_Exams 
    @Columns = N'Exam_ID, Duration'


EXEC SP_Select_Exams 
    @Condition = N'Course_ID = 57'
