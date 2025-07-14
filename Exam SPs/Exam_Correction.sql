

----- Exam Correction -----

ALTER PROCEDURE Exam_Correction
    @Student_ID INT,
    @Exam_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    --  MCQ Correction
    UPDATE SA
    SET SA.St_Grade = 
        CASE 
            WHEN SA.St_Answer = MQ.Correct_Answer THEN Q.Question_Grade
            ELSE 0
        END
    FROM Student_Answers SA
    JOIN Questions Q ON SA.Question_ID = Q.Question_ID
    JOIN MCQ_Questions MQ ON SA.Question_ID = MQ.Question_ID
    WHERE 
        SA.Student_ID = @Student_ID AND
        SA.Exam_ID = @Exam_ID AND
        Q.Question_Type = 'MCQ';

    -- True/False Correction
    UPDATE SA
    SET SA.St_Grade = 
        CASE 
            WHEN SA.St_Answer = TF.Correct_Answer THEN Q.Question_Grade
            ELSE 0
        END
    FROM Student_Answers SA
    JOIN Questions Q ON SA.Question_ID = Q.Question_ID
    JOIN True_False_Questions TF ON SA.Question_ID = TF.Question_ID
    WHERE 
        SA.Student_ID = @Student_ID AND
        SA.Exam_ID = @Exam_ID AND
        Q.Question_Type = 'True/False';


		  -- Calculate total grade
    DECLARE @Total_Grade INT;
    SELECT @Total_Grade = SUM(St_Grade)
    FROM Student_Answers
    WHERE Student_ID = @Student_ID AND Exam_ID = @Exam_ID;

    PRINT 'Answers corrected successfully.Total Grade = ' + CAST(@Total_Grade AS VARCHAR)
END

-----Call Exam Correction -----

EXEC Exam_Correction 
    @Student_ID = 1,
    @Exam_ID = 100
