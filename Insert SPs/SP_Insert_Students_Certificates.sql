create PROCEDURE SP_Insert_Students_Certificates
    @Student_ID INT = NULL,
    @Certificate_Name NVARCHAR(255) = NULL,
    @Company_Institute NVARCHAR(255) = NULL,
    @Duration INT = NULL,
    @Price INT = NULL,
    @Expire_Duration INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Student_ID IS NULL
        SET @Errors += 'Student ID cannot be NULL.' + @NewLine
    ELSE IF NOT EXISTS (SELECT 1 FROM Students WHERE Student_ID = @Student_ID)
        SET @Errors += 'Student ID does not exist.' + @NewLine

    IF @Certificate_Name IS NULL OR LTRIM(RTRIM(@Certificate_Name)) = ''
        SET @Errors += 'Certificate Name cannot be empty.' + @NewLine

    IF @Company_Institute IS NULL OR LTRIM(RTRIM(@Company_Institute)) = ''
        SET @Errors += 'Company/Institute cannot be empty.' + @NewLine

    IF @Duration IS NULL
        SET @Errors += 'Duration cannot be NULL.' + @NewLine
    ELSE IF @Duration <= 0
        SET @Errors += 'Duration must be greater than 0.' + @NewLine

    IF @Price IS NULL
        SET @Errors += 'Price cannot be NULL.' + @NewLine
    ELSE IF @Price < 0
        SET @Errors += 'Price cannot be negative.' + @NewLine

    IF @Expire_Duration IS NULL
        SET @Errors += 'Expire Duration cannot be NULL.' + @NewLine
    ELSE IF @Expire_Duration <= 0
        SET @Errors += 'Expire Duration must be greater than 0.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    BEGIN TRY
        INSERT INTO Students_Certificates (
            Student_ID,
            Certificate_Name,
            Company_Institute,
            Duration,
            Price,
            Expire_Duration
        )
        VALUES (
            @Student_ID,
            @Certificate_Name,
            @Company_Institute,
            @Duration,
            @Price,
            @Expire_Duration
        )

        SELECT SCOPE_IDENTITY() AS NewCertificateID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO


EXEC SP_Insert_Students_Certificates
    @Student_ID = 1001,
    @Certificate_Name = 'Oracle Certified',
    @Company_Institute = 'Oracle',
    @Duration = 60,
    @Price = 250,
    @Expire_Duration = 365
