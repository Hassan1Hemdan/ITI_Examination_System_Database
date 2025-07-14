CREATE PROCEDURE Set_Exam_Schedule
    @Exam_ID INT,
    @Exam_Date DATE,
    @Start_Time TIME,
    @End_Time TIME
AS
BEGIN
    UPDATE Exams
    SET 
        Exam_Date = @Exam_Date,
        Start_Time = @Start_Time,
        End_Time = @End_Time
    WHERE 
        Exam_ID = @Exam_ID
END


EXEC Set_Exam_Schedule 4,'2025-04-09', '12:00:00', '12:40:00'