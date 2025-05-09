DELIMITER //

CREATE TRIGGER PreventDuplicateEnrollment
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Enrollments 
        WHERE StudentID = NEW.StudentID AND CourseID = NEW.CourseID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student already enrolled in this course';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AutoInsertMarks
AFTER INSERT ON Enrollments
FOR EACH ROW
BEGIN
    INSERT INTO Marks (EnrollmentID, MarksObtained)
    VALUES (NEW.EnrollmentID, 0);  -- default mark = 0
END //

DELIMITER ;

-- Add this column to Students table first:
-- ALTER TABLE Students ADD COLUMN LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DELIMITER //

CREATE TRIGGER UpdateStudentTimestamp
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
    SET NEW.LastUpdated = CURRENT_TIMESTAMP;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER PreventNegativeMarks
BEFORE INSERT ON Marks
FOR EACH ROW
BEGIN
    IF NEW.MarksObtained < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot be negative';
    END IF;
END //

//

CREATE TRIGGER PreventNegativeMarksUpdate
BEFORE UPDATE ON Marks
FOR EACH ROW
BEGIN
    IF NEW.MarksObtained < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot be negative';
    END IF;
END //

DELIMITER ;
