CREATE PROCEDURE SP_Select_Student_Courses
    @Columns NVARCHAR(MAX) = N'*',
    @Condition NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'SELECT ' + @Columns + ' FROM ITIPortsaid.dbo.Student_Courses'

    IF @Condition IS NOT NULL
        SET @SQL = @SQL + ' WHERE ' + @Condition

    EXEC sp_executesql @SQL
END
GO

EXEC SP_Select_Student_Courses 
    @Columns = N'Student_ID, Course_ID, Total_Grade',
    @Condition = N'Total_Grade >= 85'


EXEC SP_Select_Student_Courses 
    @Columns = N'Student_ID, Attendence_Rate, Tasks_Rate'


EXEC SP_Select_Student_Courses 
    @Condition = N'Instructor_ID = 12 AND Attendence_Rate < 70'


