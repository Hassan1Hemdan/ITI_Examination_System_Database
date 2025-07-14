CREATE PROCEDURE SP_Select_Students
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Students'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Students 
    @Columns = N'Student_ID, F_Name, L_Name, University',
    @Condition = N'Graduation_Year >= 2022'


EXEC SP_Select_Students 
    @Columns = N'Student_ID, ITI_Account_Email, Facebook_Account'


EXEC SP_Select_Students 
    @Condition = N'Gender = ''F'''

