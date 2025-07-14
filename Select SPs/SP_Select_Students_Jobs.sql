CREATE PROCEDURE SP_Select_Students_Jobs
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Students_Jobs'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Students_Jobs 
    @Columns = N'Student_ID, Job_Position, Company',
    @Condition = N'Company LIKE ''%Data%'''


EXEC SP_Select_Students_Jobs 
    @Columns = N'Student_Job_ID, Job_Position'


EXEC SP_Select_Students_Jobs 
    @Condition = N'Job_Position = ''BI Developer'''


