-- fetching student enrolled in a courses
SELECT s.StudentID,s.Name AS StudentName,c.CourseID,c.CourseName
FROM Students 
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY CourseName, s.Name; 

-- Calculating average marks per student
SELECT s.StudentID,s.Name AS StudentName,AVG(m.MarksObtained) AS AverageMarks
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
GROUP BY s.StudentID, s.Name
ORDER BY AverageMarks DESC;

-- Finding toppers in each course
SELECT s.StudentID,s.Name AS StudentName,c.CourseID,c.CourseName,m.MarksObtained
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
WHERE m.MarksObtained = 
(SELECT MAX(m2.MarksObtained)
FROM Enrollments e2
JOIN Marks m2 ON e2.EnrollmentID = m2.EnrollmentID
WHERE e2.CourseID = c.CourseID)
ORDER BY c.CourseName;

-- Listing courses not opted by any student
SELECT c.CourseID,c.CourseName
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.CourseID IS NULL;

-- Sorting students by total marks
SELECT s.StudentID,s.Name AS StudentName,SUM(m.MarksObtained) AS TotalMarks
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Marks m ON e.EnrollmentID = m.EnrollmentID
GROUP BY s.StudentID, s.Name
ORDER BY TotalMarks DESC;


