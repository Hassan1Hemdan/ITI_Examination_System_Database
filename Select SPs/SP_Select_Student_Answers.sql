CREATE PROCEDURE SP_Select_Student_Answers
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Student_Answers'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Student_Answers 
    @Columns = N'Student_ID, Exam_ID, St_Grade',
    @Condition = N'St_Grade < 5'


EXEC SP_Select_Student_Answers 
    @Columns = N'Student_ID, St_Answer'


EXEC SP_Select_Student_Answers 
    @Condition = N'Exam_ID = 10'
