
--6-  Report that takes exam number and the student ID then
--    returns the Questions in this exam with the student answers. 

CREATE PROCEDURE SP_Student_Exam_Answers
    @Student_ID INT,
    @Exam_ID INT
AS
BEGIN
    -- MCQ Questions
    SELECT 
	    Q.Question_Type,
		Q.Question_Content,
        MQ.Question,
		Q.Question_Grade,
        SA.St_Answer,
		MQ.Correct_Answer
    FROM Exam_Questions EQ
    JOIN Questions Q ON EQ.Question_ID = Q.Question_ID
    JOIN MCQ_Questions MQ ON Q.Question_ID = MQ.Question_ID
    LEFT JOIN Student_Answers SA ON SA.Question_ID = Q.Question_ID 
	AND SA.Exam_ID = EQ.Exam_ID AND SA.Student_ID = @Student_ID
    WHERE EQ.Exam_ID = @Exam_ID AND Q.Question_Type = 'MCQ'

    UNION ALL

    -- True/False Questions
    SELECT
	    Q.Question_Type,
		Q.Question_Content,
        TF.Question,
		Q.Question_Grade,
        SA.St_Answer,
		TF.Correct_Answer
    FROM Exam_Questions EQ
    JOIN Questions Q ON EQ.Question_ID = Q.Question_ID
    JOIN True_False_Questions TF ON Q.Question_ID = TF.Question_ID
    LEFT JOIN Student_Answers SA ON SA.Question_ID = Q.Question_ID 
	AND SA.Exam_ID = EQ.Exam_ID AND SA.Student_ID = @Student_ID
    WHERE EQ.Exam_ID = @Exam_ID AND Q.Question_Type = 'True/False'
END


EXEC SP_Student_Exam_Answers 6 , 42

