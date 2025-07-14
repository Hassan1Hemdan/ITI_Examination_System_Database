
---4-•Report that takes course ID and returns its topics

CREATE PROCEDURE SP_Course_Topics_Given_Course_ID
    @Course_ID INT
AS
BEGIN
    SELECT
        Topic
    FROM Course_Topics
    WHERE Course_ID = @Course_ID
END


EXEC SP_Course_Topics_Given_Course_ID 4



