CREATE PROCEDURE SP_Select_Instructors
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Instructors'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Instructors 
    @Columns = N'Instructor_ID, F_Name, L_Name, Department',
    @Condition = N'Gender = ''M'''

EXEC SP_Select_Instructors 
    @Columns = N'F_Name, Phone, Hire_Date'

EXEC SP_Select_Instructors 
    @Condition = N'Hire_Date >= ''2022-01-01'''

