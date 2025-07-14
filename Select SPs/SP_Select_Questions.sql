CREATE PROCEDURE SP_Select_Questions
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Questions'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Questions 
    @Columns = N'Question_ID, Question_Content, Question_Grade',
    @Condition = N'Question_Grade >= 5'


EXEC SP_Select_Questions 
    @Columns = N'Question_ID, Question_Type, Course_ID'


EXEC SP_Select_Questions 
    @Condition = N'Instructor_ID =48'

