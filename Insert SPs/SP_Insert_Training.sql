CREATE PROCEDURE SP_Insert_Training
    @Intake_ID INT = NULL,
    @Branch_ID INT = NULL,
    @Track_ID INT = NULL,
    @Num_Accepted INT = NULL,
    @Num_Registrants INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Branch_ID IS NULL
        SET @Errors += 'Branch ID is required.' + @NewLine
    ELSE IF NOT EXISTS (SELECT 1 FROM Branches WHERE Branch_ID = @Branch_ID)
        SET @Errors += 'Branch ID does not exist.' + @NewLine

    IF @Track_ID IS NULL
        SET @Errors += 'Track ID is required.' + @NewLine
    ELSE IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
        SET @Errors += 'Track ID does not exist.' + @NewLine


    IF @Intake_ID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
        SET @Errors += 'Intake ID does not exist.' + @NewLine


    IF @Num_Accepted IS NULL
        SET @Errors += 'Number of accepted students is required.' + @NewLine
    ELSE IF @Num_Accepted < 0
        SET @Errors += 'Number of accepted students cannot be negative.' + @NewLine

    IF @Num_Registrants IS NULL
        SET @Errors += 'Number of registrants is required.' + @NewLine
    ELSE IF @Num_Registrants < 0
        SET @Errors += 'Number of registrants cannot be negative.' + @NewLine

    IF @Num_Accepted IS NOT NULL AND @Num_Registrants IS NOT NULL 
        AND @Num_Accepted > @Num_Registrants
        SET @Errors += 'Accepted students cannot exceed registrants.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    BEGIN TRY
        INSERT INTO Training (
            Intake_ID,
            Branch_ID,
            Track_ID,
            Num_Accepted,
            Num_Registrants
        )
        VALUES (
            @Intake_ID,
            @Branch_ID,
            @Track_ID,
            @Num_Accepted,
            @Num_Registrants
        )

        SELECT SCOPE_IDENTITY() AS NewTrainingID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO


EXEC SP_Insert_Training
    @Branch_ID = 1,
    @Track_ID = 2,
    @Num_Accepted = 20,
    @Num_Registrants = 30,
    @Intake_ID = 5