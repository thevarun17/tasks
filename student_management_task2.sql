
-- SQL DEVELOPER TASK - 2

-- Step 1: Create Required Tables

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT
);

-- Enrolments Table
CREATE TABLE Enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(StudentID),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Step 2: Insert Sample Data

-- Insert into Courses
INSERT INTO Courses (course_name, course_description) VALUES
('Mathematics', 'Advanced mathematics course'),
('Physics', 'Basic physics course'),
('Chemistry', 'Organic and inorganic chemistry'),
('Computer Science', 'Intro to programming and databases');

-- Insert into Enrolments
INSERT INTO Enrolments (student_id, course_id, enrolment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(1, 3, '2024-02-01'),
(4, 2, '2024-03-15'),
(5, 1, '2024-04-20'),
(2, 1, '2024-05-10'),
(6, 4, '2024-05-18');

-- Task 1: List all students and the courses they are enrolled in
SELECT s.Name AS StudentName, c.course_name AS CourseName
FROM Students s
INNER JOIN Enrolments e ON s.StudentID = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- Task 2: Find number of students enrolled in each course
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS StudentCount
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Task 3: List students who have enrolled in more than one course
SELECT s.StudentID, s.Name, COUNT(e.course_id) AS NumberOfCourses
FROM Students s
JOIN Enrolments e ON s.StudentID = e.student_id
GROUP BY s.StudentID, s.Name
HAVING COUNT(e.course_id) > 1;

-- Task 4: Find courses with no enrolled students
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;
