
----- Exam Generation ( Random Exam ) -----


CREATE PROCEDURE Create_Random_Exam
    @Course_Name VARCHAR(100),
    @Instructor_Email VARCHAR(100),
    @TF_Count INT,
    @MCQ_Count INT,
	@Duration INT,
	@Training_ID INT
AS
BEGIN
    SET NOCOUNT ON;            ----- Do not print "X rows affected" messages.

    -- Declare variables
    DECLARE @Course_ID INT, @Instructor_ID INT, @Exam_ID INT, @Max_Degree INT;

    -- Get Course_ID based on Course_Name
    SELECT @Course_ID = Course_ID
    FROM Course
    WHERE Course_Name = @Course_Name;

    -- Get Instructor_ID based on Email
    SELECT @Instructor_ID = Instructor_ID
    FROM Instructors
    WHERE ITI_Account_email = @Instructor_Email;

    -- Check if course exists
    IF @Course_ID IS NULL
    BEGIN
        PRINT 'Course not found.';
        RETURN;
    END

    -- Check if enough True/False questions exist
    IF (
        SELECT COUNT(*) 
        FROM Questions 
        WHERE Question_Type = 'True/False' 
          AND Course_ID = @Course_ID 
          AND Instructor_ID = @Instructor_ID
    ) < @TF_Count
    BEGIN
        PRINT 'Not enough True/False questions available for this course. You did not create ' 
            + CAST(@TF_Count AS VARCHAR) + ' True/False questions.';
        RETURN;
    END

    -- Check if enough MCQ questions exist
    IF (
        SELECT COUNT(*) 
        FROM Questions 
        WHERE Question_Type = 'MCQ' 
          AND Course_ID = @Course_ID 
          AND Instructor_ID = @Instructor_ID
    ) < @MCQ_Count
    BEGIN
        PRINT 'Not enough MCQ questions available for this course. You did not create ' 
            + CAST(@MCQ_Count AS VARCHAR) + ' MCQ questions.';
        RETURN;
    END

    -- Temporary table to hold selected questions
    DECLARE @SelectedQuestions TABLE (Question_ID INT, Question_Grade INT);

    -- Get random True/False questions
    INSERT INTO @SelectedQuestions(Question_ID, Question_Grade)
    SELECT TOP (@TF_Count) Q.Question_ID, Q.Question_Grade
    FROM Questions Q
    WHERE Q.Question_Type = 'True/False'
        AND Q.Course_ID = @Course_ID
        AND Q.Instructor_ID = @Instructor_ID
    ORDER BY NEWID(); -- Random order

    -- Get random MCQ questions
    INSERT INTO @SelectedQuestions(Question_ID, Question_Grade)
    SELECT TOP (@MCQ_Count) Q.Question_ID, Q.Question_Grade
    FROM Questions Q
    WHERE Q.Question_Type = 'MCQ'
        AND Q.Course_ID = @Course_ID
        AND Q.Instructor_ID = @Instructor_ID
    ORDER BY NEWID(); -- Random order

    -- Calculate total exam grade
    SELECT @Max_Degree = SUM(Question_Grade) FROM @SelectedQuestions;

    -- Insert exam info
    INSERT INTO Exams (Max_Degree, Course_ID, Duration, Training_ID)
    VALUES (@Max_Degree, @Course_ID, @Duration, @Training_ID);

    -- Get the newly created Exam_ID
    SET @Exam_ID = SCOPE_IDENTITY();

    -- Link selected questions to the created exam
    INSERT INTO Exam_Questions(Question_ID, Exam_ID)
    SELECT Question_ID, @Exam_ID
    FROM @SelectedQuestions;

    -- Print confirmation message
    PRINT 'Exam created successfully with Exam_ID = ' + CAST(@Exam_ID AS VARCHAR);
END


EXEC Create_Random_Exam 'SQL for Data Engineering', 'fatmaibrahim123@gmail.com', 5, 5, 40 , 65