
-- 1. Database Setup
CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

-- 2. Insert Sample Data
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES 
('Ravi', 'M', 16, 'A', 88, 92, 85),
('Priya', 'F', 15, 'B', 75, 80, 78),
('Amit', 'M', 17, 'C', 65, 70, 68),
('Sita', 'F', 16, 'A', 90, 95, 93),
('John', 'M', 15, 'B', 82, 85, 80),
('Meena', 'F', 17, 'C', 60, 62, 58),
('Raj', 'M', 16, 'B', 78, 76, 80),
('Anita', 'F', 15, 'A', 92, 89, 90),
('Karan', 'M', 17, 'C', 58, 60, 55),
('Geeta', 'F', 16, 'B', 84, 87, 82);

-- 3. Tasks

-- 3.1 Display all students
SELECT * FROM Students;

-- 3.2 Calculate average scores
SELECT 
    AVG(MathScore) AS AvgMath,
    AVG(ScienceScore) AS AvgScience,
    AVG(EnglishScore) AS AvgEnglish
FROM Students;

-- 3.3 Find student(s) with highest total score
SELECT *, (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- 3.4 Count students in each grade
SELECT Grade, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Grade;

-- 3.5 Average score by gender
SELECT Gender,
       AVG(MathScore) AS AvgMath,
       AVG(ScienceScore) AS AvgScience,
       AVG(EnglishScore) AS AvgEnglish
FROM Students
GROUP BY Gender;

-- 3.6 Students with Math score > 80
SELECT * 
FROM Students
WHERE MathScore > 80;

-- 3.7 Update grade of student with specific ID (e.g., ID = 3)
UPDATE Students
SET Grade = 'B'
WHERE StudentID = 3;
