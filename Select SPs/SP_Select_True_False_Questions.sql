CREATE PROCEDURE SP_Select_True_False_Questions
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.True_False_Questions'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_True_False_Questions 
    @Columns = N'Question_ID, Question, Correct_Answer',
    @Condition = N'Correct_Answer = ''True'''


EXEC SP_Select_True_False_Questions 
    @Columns = N'Question, Option1, Option2'


EXEC SP_Select_True_False_Questions 
    @Condition = N'Question LIKE ''%OLAP%'''

