CREATE PROCEDURE SP_Select_Exam_Questions
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM Exam_Questions'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Exam_Questions 
    @Columns = N'Question_ID, Exam_ID',
    @Condition = N'Exam_ID = 5'


EXEC SP_Select_Exam_Questions 
    @Columns = N'Exam_ID'


EXEC SP_Select_Exam_Questions 
    @Condition = N'Exam_ID = 99'

