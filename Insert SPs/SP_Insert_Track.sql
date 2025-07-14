CREATE PROCEDURE SP_Insert_Track
    @Track_Name NVARCHAR(255)=NULL,
    @Duration INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)


    IF @Track_Name IS NULL OR LTRIM(RTRIM(@Track_Name)) = ''
        SET @Errors += 'Track Name cannot be empty.' + @NewLine

    IF @Duration IS NULL
        SET @Errors += 'Duration cannot be NULL.' + @NewLine
    ELSE IF @Duration <= 0
        SET @Errors += 'Duration must be positive.' + @NewLine


    IF EXISTS (SELECT 1 FROM Track WHERE Track_Name = @Track_Name)
        SET @Errors += 'Track name already exists.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    BEGIN TRY
        INSERT INTO Track (
            Track_Name,
            Duration
        )
        VALUES (
            @Track_Name,
            @Duration
        )

        SELECT SCOPE_IDENTITY() AS NewTrackID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO



EXEC SP_Insert_Track
    @Track_Name = 'Web Development',
    @Duration = 180
