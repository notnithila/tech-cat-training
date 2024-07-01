USE schema STUDENT.PUBLIC;

-- DROP TABLE students;
-- DROP TABLE enrollments;

-- Create the 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);

-- Create the 'enrollments' table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50)
);


-- Insert data into the 'students' table
INSERT INTO students (student_id, student_name, age) VALUES
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21),
(4, 'David', 23),
(5, 'Eve', 22),
(6, 'Frank', 24),
(7, 'Grace', 20),
(8, 'Hannah', 25),
(9, 'Ian', 21),
(10, 'Jack', 22),
(11, 'Karen', 23),
(12, 'Liam', 24),
(13, 'Mia', 25),
(14, 'Noah', 22),
(15, 'Olivia', 23),
(16, 'Paul', 24),
(17, 'Quinn', 25),
(18, 'Rachel', 21),
(19, 'Steve', 20),
(20, 'Tina', 22),
(21, 'Francis', 26);

-- Insert data into the 'enrollments' table
INSERT INTO enrollments (enrollment_id, student_id, course_name) VALUES
(1, 1, 'Maths'),
(2, 2, 'Science'),
(3, 3, 'History'),
(4, 4, 'Maths'),
(5, 5, 'Science'),
(6, 6, 'History'),
(7, 7, 'Maths'),
(8, 8, 'Science'),
(9, 9, 'History'),
(10, 1, 'English'),
(11, 11, 'Maths'),
(12, 12, 'Science'),
(13, 13, 'History'),
(14, 14, 'Maths'),
(15, 15, 'Science'),
(16, 3, 'English'),
(17, 16, 'History'),
(18, 17, 'Maths'),
(19, 18, 'Science'),
(20, 19, 'History'),
(21, 0, 'N/A');


-- INNER JOIN: This will return records that have matching values in both tables.
SELECT s.student_name, e.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id;


SELECT s.student_name, e.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id;


-- LEFT JOIN: This will return all records from the left table (students), and the matched records from the right table (enrollments). The result is NULL for right side when there is no match.
SELECT s.student_name, e.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id;

SELECT s.student_name, e.course_name
FROM students s
LEFT OUTER JOIN enrollments e ON s.student_id = e.student_id;



-- RIGHT JOIN: This will return all records from the right table (enrollments), and the matched records from the left table (students). The result is NULL for left side when there is no match.
SELECT s.student_name, e.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id;

SELECT s.student_name, e.course_name
FROM students s
RIGHT OUTER JOIN enrollments e ON s.student_id = e.student_id;


-- FULL OUTER JOIN: This will return all records when there is a match in either the left (students) or the right (enrollments) table records.
SELECT s.student_name, e.course_name
FROM students s
FULL OUTER JOIN enrollments e ON s.student_id = e.student_id;


-- CROSS JOIN
SELECT s.student_name, e.course_name
FROM students s
CROSS JOIN enrollments e;


-- NATURAL JOIN
SELECT s.student_name, e.course_name
FROM students s
NATURAL JOIN enrollments e;