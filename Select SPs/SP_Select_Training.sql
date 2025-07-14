CREATE PROCEDURE SP_Select_Training
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Training'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Training 
    @Columns = N'Training_ID, Track_ID, Num_Accepted',
    @Condition = N'Num_Registrants > 50'


EXEC SP_Select_Training 
    @Columns = N'Intake_ID, Branch_ID'


EXEC SP_Select_Training 
    @Condition = N'Track_ID = 2 AND Branch_ID = 1'
