INSERT INTO Students (Name, DOB, Gender, Email, Phone) VALUES
('Alice Johnson', '2004-03-15', 'F', 'alice.j@example.com', '9876543210'),
('Bob Smith', '2003-07-22', 'M', 'bob.smith@example.com', '9876543211'),
('Charlie Brown', '2005-01-10', 'M', 'charlie.b@example.com', '9876543212');

-- Inserting into Courses
INSERT INTO Courses (CourseName, Credits) VALUES
('Mathematics', 4),
('Physics', 3),
('Chemistry', 4),
('English Literature', 2);

-- Inserting into Teachers (Optional)
INSERT INTO Teachers (Name, Subject, Email) VALUES
('Dr. Emily Clark', 'Mathematics', 'emily.clark@college.edu'),
('Mr. John Green', 'Physics', 'john.green@college.edu');

-- Inserting into Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2025-01-01'),
(1, 2, '2025-01-01'),
(2, 1, '2025-01-02'),
(2, 3, '2025-01-02'),
(3, 4, '2025-01-03');

-- Inserting into Marks
INSERT INTO Marks (EnrollmentID, MarksObtained) VALUES
(1, 85.5),
(2, 90.0),
(3, 78.0),
(4, 88.5),
(5, 92.0);
