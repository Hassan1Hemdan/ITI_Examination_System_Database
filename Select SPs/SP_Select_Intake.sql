CREATE PROCEDURE SP_Select_Intake
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Intake'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Intake 
    @Columns = N'Intake_ID, Intake_Name, Start_Date',
    @Condition = N'Start_Date >= ''2024-01-01'''


EXEC SP_Select_Intake 
    @Columns = N'Intake_ID, End_Date'


EXEC SP_Select_Intake 
    @Condition = N'End_Date < ''2025-12-31'''
