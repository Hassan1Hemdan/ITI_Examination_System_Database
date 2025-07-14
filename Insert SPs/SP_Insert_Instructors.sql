CREATE PROCEDURE SP_Insert_Instructors
    @F_Name NVARCHAR(255) = NULL,
    @L_Name NVARCHAR(255) = NULL,
    @Gender CHAR(1) = NULL,
    @DOB NVARCHAR(50) = NULL,
    @Address NVARCHAR(255) = NULL,
    @Phone NVARCHAR(255) = NULL,
    @Department NVARCHAR(255) = NULL,
    @Hire_Date NVARCHAR(50) = NULL,
    @ITI_Account_email NVARCHAR(255) = NULL,
    @ITI_Account_Name NVARCHAR(255) = NULL,
    @ITI_Account_Password_Hashed NVARCHAR(255) = NULL,
    @ITI_Account_Last_Modified NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @F_Name IS NULL
        SET @Errors += 'F_Name cannot be NULL.' + @NewLine

    IF @L_Name IS NULL
        SET @Errors += 'L_Name cannot be NULL.' + @NewLine

    IF @Gender IS NULL
        SET @Errors += 'Gender cannot be NULL.' + @NewLine
    ELSE IF @Gender NOT IN ('m','f','M','F')
        SET @Errors += 'Gender must be one of (M, F).' + @NewLine

    IF @DOB IS NULL
        SET @Errors += 'DOB cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@DOB AS DATE) IS NULL
        SET @Errors += 'DOB must be DATE.' + @NewLine

    IF @Address IS NULL
        SET @Errors += 'Address cannot be NULL.' + @NewLine

    IF @Phone IS NULL
        SET @Errors += 'Phone cannot be NULL.' + @NewLine

    IF @Department IS NULL
        SET @Errors += 'Department cannot be NULL.' + @NewLine

    IF @Hire_Date IS NULL
        SET @Errors += 'Hire_Date cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@Hire_Date AS DATE) IS NULL
        SET @Errors += 'Hire_Date must be DATE.' + @NewLine

    IF @ITI_Account_email IS NULL
        SET @Errors += 'ITI_Account_email cannot be NULL.' + @NewLine

    IF @ITI_Account_Name IS NULL
        SET @Errors += 'ITI_Account_Name cannot be NULL.' + @NewLine

    IF @ITI_Account_Last_Modified IS NOT NULL AND TRY_CAST(@ITI_Account_Last_Modified AS DATETIME) IS NULL
        SET @Errors += 'ITI_Account_Last_Modified must be DATETIME.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Instructors (
        F_Name,
        L_Name,
        Gender,
        DOB,
        Address,
        Phone,
        Department,
        Hire_Date,
        ITI_Account_email,
        ITI_Account_Name,
        ITI_Account_Password_Hashed,
        ITI_Account_Last_Modified
    )
    VALUES (
        @F_Name,
        @L_Name,
        @Gender,
        TRY_CAST(@DOB AS DATE),
        @Address,
        @Phone,
        @Department,
        TRY_CAST(@Hire_Date AS DATE),
        @ITI_Account_email,
        @ITI_Account_Name,
        @ITI_Account_Password_Hashed,
        TRY_CAST(@ITI_Account_Last_Modified AS DATETIME)
    )
END
GO

EXEC SP_Insert_Instructors
    @F_Name = N'Ahmed',
    @L_Name = N'Youssef',
    @Gender = 'M',
    @DOB = N'1980-04-12',
    @Address = N'22 Ahmed Maher St',
    @Phone = N'01001234567',
    @Department = N'CS',
    @Hire_Date = N'2018-07-01',
    @ITI_Account_email = N'ayoussef@iti.gov.eg',
    @ITI_Account_Name = N'ayoussef',
    @ITI_Account_Password_Hashed = N'123456Hashed',
    @ITI_Account_Last_Modified = N'2025-06-01 10:00:00'
