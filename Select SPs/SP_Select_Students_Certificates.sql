CREATE PROCEDURE SP_Select_Students_Certificates
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Students_Certificates'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Students_Certificates 
    @Columns = N'Student_ID, Certificate_Name, Company_Institute',
    @Condition = N'Expire_Duration IS NOT NULL AND Price > 200'


EXEC SP_Select_Students_Certificates 
    @Columns = N'Student_Certificate_ID, Duration, Price'


EXEC SP_Select_Students_Certificates 
    @Condition = N'Certificate_Name LIKE ''%Azure%'''

