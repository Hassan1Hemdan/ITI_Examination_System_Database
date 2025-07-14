CREATE PROCEDURE SP_Select_Branches
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Branches'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Branches 
    @Columns = N'Branch_ID, Branch_Name, Manager_F_Name',
    @Condition = N'Gender = ''F'''

EXEC SP_Select_Branches 
    @Columns = N'Branch_Name, Branch_Location, Manager_Phone'

EXEC SP_Select_Branches 
    @Condition = N'Manager_Hire_Date >= ''2020-01-01'''

