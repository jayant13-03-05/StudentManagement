-- Procedure to fetch students enrolled in a given course
DELIMITER //

CREATE PROCEDURE GetStudentsInCourse(IN course_name VARCHAR(100))
BEGIN
    SELECT 
        s.StudentID,
        s.Name AS StudentName,
        c.CourseName
    FROM 
        Students s
    JOIN 
        Enrollments e ON s.StudentID = e.StudentID
    JOIN 
        Courses c ON e.CourseID = c.CourseID
    WHERE 
        c.CourseName = course_name;
END //

DELIMITER ;

-- Procedure to get average marks per student
DELIMITER //

CREATE PROCEDURE GetAverageMarksPerStudent()
BEGIN
    SELECT 
        s.StudentID,
        s.Name AS StudentName,
        AVG(m.MarksObtained) AS AverageMarks
    FROM 
        Students s
    JOIN 
        Enrollments e ON s.StudentID = e.StudentID
    JOIN 
        Marks m ON e.EnrollmentID = m.EnrollmentID
    GROUP BY 
        s.StudentID, s.Name;
END //

DELIMITER ;

-- Procedure to get toppers in each course
DELIMITER //

CREATE PROCEDURE GetCourseToppers()
BEGIN
    SELECT 
        s.StudentID,
        s.Name AS StudentName,
        c.CourseID,
        c.CourseName,
        m.MarksObtained
    FROM 
        Students s
    JOIN 
        Enrollments e ON s.StudentID = e.StudentID
    JOIN 
        Courses c ON e.CourseID = c.CourseID
    JOIN 
        Marks m ON e.EnrollmentID = m.EnrollmentID
    WHERE 
        m.MarksObtained = (
            SELECT MAX(m2.MarksObtained)
            FROM Enrollments e2
            JOIN Marks m2 ON e2.EnrollmentID = m2.EnrollmentID
            WHERE e2.CourseID = c.CourseID
        );
END //

DELIMITER ;

-- Procedure to list courses not opted by any student
DELIMITER //

CREATE PROCEDURE GetUnoptedCourses()
BEGIN
    SELECT 
        c.CourseID,
        c.CourseName
    FROM 
        Courses c
    LEFT JOIN 
        Enrollments e ON c.CourseID = e.CourseID
    WHERE 
        e.CourseID IS NULL;
END //

DELIMITER ;

-- Procedure to list students sorted by total marks
DELIMITER //

CREATE PROCEDURE GetStudentsByTotalMarks()
BEGIN
    SELECT 
        s.StudentID,
        s.Name AS StudentName,
        SUM(m.MarksObtained) AS TotalMarks
    FROM 
        Students s
    JOIN 
        Enrollments e ON s.StudentID = e.StudentID
    JOIN 
        Marks m ON e.EnrollmentID = m.EnrollmentID
    GROUP BY 
        s.StudentID, s.Name
    ORDER BY 
        TotalMarks DESC;
END //

DELIMITER ;

CALL GetStudentsInCourse('Mathematics');
CALL GetAverageMarksPerStudent();
