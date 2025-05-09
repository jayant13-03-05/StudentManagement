-- View: Students Enrolled in Courses
CREATE VIEW StudentEnrollments AS
SELECT s.StudentID,s.Name AS StudentName,c.CourseID,c.CourseName,e.EnrollmentDate
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- View: Average Marks per Student
CREATE VIEW StudentAverageMarks AS
SELECT s.StudentID,s.Name AS StudentName,
AVG(m.MarksObtained) AS AverageMarks
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
GROUP BY s.StudentID, s.Name;

-- View: Toppers in Each Course
CREATE VIEW CourseToppers AS
SELECT s.StudentID,s.Name AS StudentName,c.CourseID,c.CourseName,m.MarksObtained
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
WHERE m.MarksObtained = (
SELECT MAX(m2.MarksObtained)
FROM Enrollments e2
JOIN Marks m2 ON e2.EnrollmentID = m2.EnrollmentID
WHERE e2.CourseID = c.CourseID);

-- View: Courses Not Opted by Any Student
CREATE VIEW CoursesNotOpted AS
SELECT c.CourseID,c.CourseName
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.CourseID IS NULL;

-- View: Students Sorted by Total Marks
CREATE VIEW StudentsTotalMarks AS
SELECT s.StudentID,s.Name AS StudentName,SUM(m.MarksObtained) AS TotalMarks
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
GROUP BY s.StudentID, s.Name
ORDER BY TotalMarks DESC;



