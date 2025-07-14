CREATE PROCEDURE SP_Insert_Branches
    @Branch_Name NVARCHAR(255) = NULL,
    @Branch_Location NVARCHAR(255) = NULL,
    @Branch_Phone NVARCHAR(255) = NULL,
    @Manager_F_Name NVARCHAR(255) = NULL,
    @Manager_L_Name NVARCHAR(255) = NULL,
    @Gender CHAR(1) = NULL,
    @Manager_DOB NVARCHAR(50) = NULL,
    @Manager_Hire_Date NVARCHAR(50) = NULL,
    @Manager_Address NVARCHAR(255) = NULL,
    @Manager_Email NVARCHAR(255) = NULL,
    @Manager_Phone NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Errors NVARCHAR(MAX) = N''
    DECLARE @NewLine NVARCHAR(2) = CHAR(13) + CHAR(10)

    IF @Branch_Name IS NULL
        SET @Errors += 'Branch_Name cannot be NULL.' + @NewLine

    IF @Gender IS NOT NULL AND @Gender NOT IN ('m','f','M','F')
        SET @Errors += 'Gender must be one of (M, F).' + @NewLine

    IF @Manager_DOB IS NOT NULL AND TRY_CAST(@Manager_DOB AS DATE) IS NULL
        SET @Errors += 'Manager_DOB must be DATE.' + @NewLine

    IF @Manager_Hire_Date IS NOT NULL AND TRY_CAST(@Manager_Hire_Date AS DATE) IS NULL
        SET @Errors += 'Manager_Hire_Date must be DATE.' + @NewLine

    IF @Errors <> ''
    BEGIN
        PRINT @Errors
        RETURN
    END

    INSERT INTO Branches (
        Branch_Name,
        Branch_Location,
        Branch_Phone,
        Manager_F_Name,
        Manager_L_Name,
        Gender,
        Manager_DOB,
        Manager_Hire_Date,
        Manager_Address,
        Manager_Email,
        Manager_Phone
    )
    VALUES (
        @Branch_Name,
        @Branch_Location,
        @Branch_Phone,
        @Manager_F_Name,
        @Manager_L_Name,
        @Gender,
        TRY_CAST(@Manager_DOB AS DATE),
        TRY_CAST(@Manager_Hire_Date AS DATE),
        @Manager_Address,
        @Manager_Email,
        @Manager_Phone
    )
END
GO

EXEC SP_Insert_Branches
    @Branch_Name = N'Mansoura',
    @Branch_Location = N'Dakahlia',
    @Branch_Phone = N'01234567890',
    @Manager_F_Name = N'Mohamed',
    @Manager_L_Name = N'Gamal',
    @Gender = 'M',
    @Manager_DOB = N'1985-05-10',
    @Manager_Hire_Date = N'2020-01-15',
    @Manager_Address = N'12 El Nasr St',
    @Manager_Email = N'manager@example.com',
    @Manager_Phone = N'01098765432'
