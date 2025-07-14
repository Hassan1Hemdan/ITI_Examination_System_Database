CREATE PROCEDURE SP_Insert_Course
    @Course_Name NVARCHAR(255) = NULL,
    @Course_Type NVARCHAR(225) = NULL,
    @Course_Period NVARCHAR(50) = NULL,
    @Max_Grade NVARCHAR(50) = NULL,
    @Min_Grade NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Course_Name IS NULL
        SET @Errors += 'Course_Name cannot be NULL.' + @NewLine

    IF @Course_Type IS NULL
        SET @Errors += 'Course_Type cannot be NULL.' + @NewLine

    IF @Course_Period IS NULL
        SET @Errors += 'Course_Period cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Course_Period AS INT) IS NULL
        SET @Errors += 'Course_Period must be INT.' + @NewLine

    IF @Max_Grade IS NULL
        SET @Errors += 'Max_Grade cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Max_Grade AS INT) IS NULL
        SET @Errors += 'Max_Grade must be INT.' + @NewLine

    IF @Min_Grade IS NULL
        SET @Errors += 'Min_Grade cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Min_Grade AS INT) IS NULL
        SET @Errors += 'Min_Grade must be INT.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Course (Course_Name, Course_Type, Course_Period, Max_Grade, Min_Grade)
    VALUES (
        @Course_Name,
        @Course_Type,
        CAST(@Course_Period AS INT),
        CAST(@Max_Grade AS INT),
        CAST(@Min_Grade AS INT)
    )
END
GO

EXEC SP_Insert_Course
    @Course_Name = N'Python Basics',
    @Course_Type = N'Technical',
    @Course_Period = N'60',
    @Max_Grade = N'100',
    @Min_Grade = N'50'
