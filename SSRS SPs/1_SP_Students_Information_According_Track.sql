
---1-•	Report that returns the students information 
--      according to Department No parameter.

CREATE PROCEDURE SP_Students_Information_According_Track
AS
BEGIN
   SELECT 
    S.Student_ID,
    CONCAT(S.F_Name, ' ', S.L_Name) AS Student_Name,
    S.Gender,
    S.University,
    S.Faculty,
	S.Department,
    S.Graduation_Year,
    S.ITI_Account_Email,
	S.Phone,
	S.Facebook_Account,
	S.Twitter_Account,
    Tr.Track_ID,
    Tr.Track_Name,
    B.Branch_Name,
    I.Intake_Name
   FROM Students S
   JOIN Student_Training ST ON S.Student_ID = ST.Student_ID
   JOIN Training T ON ST.Training_ID = T.Training_ID
   JOIN Track Tr ON T.Track_ID = Tr.Track_ID
   JOIN Branches B ON T.Branch_ID = B.Branch_ID
   JOIN Intake I ON T.Intake_ID = I.Intake_ID
   ORDER BY Tr.Track_Name, B.Branch_Name, I.Intake_Name, S.Student_ID
END


exec SP_Students_Information_According_Track

