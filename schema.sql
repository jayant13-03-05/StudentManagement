CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    DOB DATE,
    Gender CHAR(1),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    Credits INT
);

-- Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Marks Table
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY AUTO_INCREMENT,
    EnrollmentID INT,
    MarksObtained DECIMAL(5,2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

-- Teachers Table (Optional)
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Subject VARCHAR(100),
    Email VARCHAR(100)
);
