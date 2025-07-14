CREATE PROCEDURE SP_Insert_Students
    @F_Name NVARCHAR(255) = NULL,
    @L_Name NVARCHAR(255) = NULL,
    @Gender CHAR(1) = NULL,
    @DOB NVARCHAR(50) = NULL,
    @Address NVARCHAR(255) = NULL,
    @Phone NVARCHAR(255) = NULL,
    @University NVARCHAR(255) = NULL,
    @Faculty NVARCHAR(255) = NULL,
    @Department NVARCHAR(255) = NULL,
    @Graduation_Year INT = NULL,
    @ITI_Account_Email NVARCHAR(255) = NULL,
    @ITI_Account_Name NVARCHAR(255) = NULL,
    @ITI_Account_Password_Hashed NVARCHAR(255) = NULL,
    @Facebook_Account NVARCHAR(255) = NULL,
    @Twitter_Account NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @F_Name IS NULL OR LTRIM(RTRIM(@F_Name)) = ''
        SET @Errors += 'First name (F_Name) cannot be empty.' + @NewLine

    IF @L_Name IS NULL OR LTRIM(RTRIM(@L_Name)) = ''
        SET @Errors += 'Last name (L_Name) cannot be empty.' + @NewLine

    IF @Gender IS NULL
        SET @Errors += 'Gender cannot be NULL.' + @NewLine
    ELSE IF @Gender NOT IN ('M', 'F', 'm', 'f')
        SET @Errors += 'Gender must be either M or F.' + @NewLine

    IF @DOB IS NULL
        SET @Errors += 'Date of birth (DOB) cannot be NULL.' + @NewLine
    ELSE IF TRY_CAST(@DOB AS DATE) IS NULL
        SET @Errors += 'Invalid date format for DOB (use YYYY-MM-DD).' + @NewLine
    ELSE IF DATEDIFF(YEAR, TRY_CAST(@DOB AS DATE), GETDATE()) < 16
        SET @Errors += 'Student must be at least 16 years old.' + @NewLine

    IF @Address IS NULL OR LTRIM(RTRIM(@Address)) = ''
        SET @Errors += 'Address cannot be empty.' + @NewLine

    IF @Phone IS NULL OR LTRIM(RTRIM(@Phone)) = ''
        SET @Errors += 'Phone number cannot be empty.' + @NewLine

    IF @University IS NULL OR LTRIM(RTRIM(@University)) = ''
        SET @Errors += 'University cannot be empty.' + @NewLine

    IF @Faculty IS NULL OR LTRIM(RTRIM(@Faculty)) = ''
        SET @Errors += 'Faculty cannot be empty.' + @NewLine

    IF @Graduation_Year IS NULL
        SET @Errors += 'Graduation year cannot be NULL.' + @NewLine
    ELSE IF @Graduation_Year < 1900 OR @Graduation_Year > YEAR(GETDATE()) + 5
        SET @Errors += 'Graduation year must be between 1900 and ' + CAST(YEAR(GETDATE()) + 5 AS NVARCHAR(10)) + '.' + @NewLine

    IF @ITI_Account_Email IS NULL OR LTRIM(RTRIM(@ITI_Account_Email)) = ''
        SET @Errors += 'ITI account email cannot be empty.' + @NewLine
    ELSE IF @ITI_Account_Email NOT LIKE '%_@__%.__%'
        SET @Errors += 'Invalid ITI account email format.' + @NewLine

    IF @ITI_Account_Name IS NULL OR LTRIM(RTRIM(@ITI_Account_Name)) = ''
        SET @Errors += 'ITI account name cannot be empty.' + @NewLine

    IF @ITI_Account_Email IS NOT NULL
        AND EXISTS (SELECT 1 FROM Students WHERE ITI_Account_Email = @ITI_Account_Email)
    BEGIN
        SET @Errors += 'ITI account email already exists in the system.' + @NewLine
    END

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    BEGIN TRY
        INSERT INTO Students (
            F_Name,
            L_Name,
            Gender,
            DOB,
            Address,
            Phone,
            University,
            Faculty,
            Department,
            Graduation_Year,
            ITI_Account_Email,
            ITI_Account_Name,
            ITI_Account_Password_Hashed,
            ITI_Account_Last_Modified,
            Facebook_Account,
            Twitter_Account
        )
        VALUES (
            @F_Name,
            @L_Name,
            UPPER(@Gender),
            CAST(@DOB AS DATE),
            @Address,
            @Phone,
            @University,
            @Faculty,
            @Department,
            @Graduation_Year,
            @ITI_Account_Email,
            @ITI_Account_Name,
            @ITI_Account_Password_Hashed,
            GETDATE(),
            @Facebook_Account,
            @Twitter_Account
        )

        SELECT SCOPE_IDENTITY() AS NewStudentID
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE()
    END CATCH
END
GO



EXEC SP_Insert_Students
    @F_Name = 'John',
    @L_Name = 'Smith',
    @Gender = 'M',
    @DOB = '1995-08-20',
    @Address = '123 Main St, New York',
    @Phone = '01001234567',
    @University = 'Cairo University',
    @Faculty = 'Engineering',
    @Department = 'Computer Science',
    @Graduation_Year = 2021,
    @ITI_Account_Email = 'john.smith@iti.gov.eg',
    @ITI_Account_Name = 'john.smith',
    @ITI_Account_Password_Hashed = 'hashed_password_123',
    @Facebook_Account = 'fb.com/john.smith',
    @Twitter_Account = 'twitter.com/john_smith';