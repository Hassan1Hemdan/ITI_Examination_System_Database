----- Exam Answers -----
 

-- Create a table type to hold student answers before inserting

-- CREATE TYPE AnswerTableType AS TABLE (Question_ID INT,St_Answer TEXT)

-------------------------------------------------------------------

CREATE PROCEDURE Exam_Answers
    @Student_ID INT,
    @Exam_ID INT,
    @Answers AnswerTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert student answers into Student_Answers table
    INSERT INTO Student_Answers (Student_ID, Exam_ID, Question_ID, St_Answer)
    SELECT 
        @Student_ID,
        @Exam_ID,
        A.Question_ID,
        A.St_Answer
    FROM @Answers A;

    -- Confirmation message
    PRINT 'Student answers submitted successfully.';
END

-------------------------------------------------------------------

-- Step 1: Declare a variable of the table type
DECLARE @Ans AnswerTableType;

-- Step 2: Fill the table with answers (example)
INSERT INTO @Ans (Question_ID, St_Answer) VALUES 
(61	,'WHERE'),
(62	,'Combine rows from two or more tables'),
(63	,'SELECT INTO'),
(64	,'DISTINCT'),
(66	,'Creating indexes'),
(71	,'TRUE'),
(72	,'FALSE'),
(73	,'TRUE'),
(74	,'FALSE'),
(76	,'TRUE')


-- Step 3: Call the stored procedure
EXEC Exam_Answers 
    @Student_ID = 1,
    @Exam_ID = 1,
    @Answers = @Ans

