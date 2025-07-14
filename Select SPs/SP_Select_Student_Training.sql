CREATE PROCEDURE SP_Select_Student_Training
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Student_Training'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Student_Training 
    @Columns = N'Student_ID, English_grade, ITI_Graduation_Status',
    @Condition = N'English_grade >= 80 AND ITI_Graduation_Status = ''Graduate'''


EXEC SP_Select_Student_Training 
    @Columns = N'Student_ID, IQ_grade, Technical_Interview_grade'


EXEC SP_Select_Student_Training 
    @Condition = N'ITI_Graduation_Year = 2024'

