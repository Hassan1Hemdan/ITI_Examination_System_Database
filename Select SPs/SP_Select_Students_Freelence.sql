CREATE PROCEDURE SP_Select_Students_Freelence
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Students_Freelence'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Students_Freelence 
    @Columns = N'Student_ID, Project_Title, Freelence_Income',
    @Condition = N'Freelence_Income > 30'


EXEC SP_Select_Students_Freelence 
    @Columns = N'PlatForm, Project_Title'


EXEC SP_Select_Students_Freelence 
    @Condition = N'PlatForm = ''Upwork'''


