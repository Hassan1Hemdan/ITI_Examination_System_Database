
---3-•	Report that takes the instructor ID and returns the name of the courses
---     that he teaches and the number of student per course.

CREATE PROCEDURE SP_Courses_And_NO_Of_Students_Given_Instructor_ID
    @Instructor_ID INT
AS
BEGIN
    SELECT 
        C.Course_Name,
        T.Start_teaching_Date,
		T.End_teaching_Date,
        T.Teaching_times,
        COUNT(SC.Student_ID) AS Number_of_Students
    FROM Teaches T
    JOIN Course C ON T.Course_ID = C.Course_ID
    LEFT JOIN Student_Courses SC
        ON T.Course_ID = SC.Course_ID
        AND T.Instructor_ID = SC.Instructor_ID
    WHERE T.Instructor_ID = @Instructor_ID
    GROUP BY C.Course_Name, T.Start_teaching_Date,T.End_teaching_Date, T.Teaching_times
END

EXEC SP_Courses_And_NO_Of_Students_Given_Instructor_ID 101
