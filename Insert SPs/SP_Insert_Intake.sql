CREATE PROCEDURE SP_Insert_Intake
    @Intake_ID NVARCHAR(50) = NULL,
    @Intake_Name NVARCHAR(255) = NULL,
    @Start_Date NVARCHAR(50) = NULL,
    @End_Date NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Intake_ID IS NULL
        SET @Errors += 'Intake_ID cannot be NULL.' + @NewLine

    IF @Intake_Name IS NULL
        SET @Errors += 'Intake_Name cannot be NULL.' + @NewLine

    IF @Start_Date IS NULL
        SET @Errors += 'Start_Date cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Start_Date AS DATE) IS NULL
        SET @Errors += 'Start_Date must be DATE.' + @NewLine

    IF @End_Date IS NULL
        SET @Errors += 'End_Date cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@End_Date AS DATE) IS NULL
        SET @Errors += 'End_Date must be DATE.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Intake (Intake_ID, Intake_Name, Start_Date, End_Date)
    VALUES (
        @Intake_ID,
        @Intake_Name,
        TRY_CAST(@Start_Date AS DATE),
        TRY_CAST(@End_Date AS DATE)
    )
END
GO

EXEC SP_Insert_Intake
    @Intake_ID = N'INT25',
    @Intake_Name = N'Summer 2025',
    @Start_Date = N'2025-07-01',
    @End_Date = N'2025-10-01'
