
--5-  Report that takes exam number and returns the
---   Questions in it and chocies [freeform report]

Create PROCEDURE SP_Exam_Questions_Given_Exam_ID
    @Exam_ID INT
AS
BEGIN
    -- MCQ Questions
    SELECT 
        MQ.Question,
        MQ.Option1,
        MQ.Option2,
        MQ.Option3,
        MQ.Option4
    FROM Exam_Questions EQ
    JOIN Questions Q ON EQ.Question_ID = Q.Question_ID
    JOIN MCQ_Questions MQ ON Q.Question_ID = MQ.Question_ID
    WHERE EQ.Exam_ID = @Exam_ID AND Q.Question_Type = 'MCQ'

    UNION ALL

    -- True/False Questions
    SELECT 
        TF.Question,
        TF.Option1,
        TF.Option2,
        NULL AS Option3,
        NULL AS Option4
    FROM Exam_Questions EQ
    JOIN Questions Q ON EQ.Question_ID = Q.Question_ID
    JOIN True_False_Questions TF ON Q.Question_ID = TF.Question_ID
    WHERE EQ.Exam_ID = @Exam_ID AND Q.Question_Type = 'True/False'
END


EXEC SP_Exam_Questions_Given_Exam_ID 22