

--2.•  Report that takes the student ID and returns 
--     the grades of the student in all courses. %

CREATE PROCEDURE SP_Courses_Grades_given_Student_ID
    @Student_ID INT,
    @Track_ID INT
AS
BEGIN
    SELECT 
        C.Course_Name,
        CONCAT(I.F_Name, ' ', I.L_Name) AS Instructor_Name,
        SC.Attendence_Rate,
        SC.Tasks_Rate,
        SC.Total_Grade,
        C.Max_Grade,
        CAST(SC.Total_Grade * 1.0 / C.Max_Grade * 100 AS DECIMAL(5,2)) AS Grade_Percentage
    FROM Student_Courses SC
    JOIN Course C ON SC.Course_ID = C.Course_ID
    JOIN Instructors I ON SC.Instructor_ID = I.Instructor_ID
    JOIN Training T ON SC.Training_ID = T.Training_ID
    WHERE SC.Student_ID = @Student_ID
      AND T.Track_ID = @Track_ID
END

EXEC SP_Courses_Grades_given_Student_ID 1, 1


