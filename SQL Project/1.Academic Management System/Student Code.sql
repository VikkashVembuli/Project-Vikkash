CREATE TABLE StudentInfo (
    STU_ID SERIAL PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS TEXT
);

CREATE TABLE CoursesInfo (
    COURSE_ID SERIAL PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID SERIAL PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

INSERT INTO StudentInfo (STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
    (151,'Sarath','08-04-2000','9055768756','Sarath@gmail.com','Adyar,chennai'),
    (152,'Gowtham','10-11-2000','9600769043','Gowtham@gmail','Navallur,Chennai'),
    (153,'Ganesh','25-08-2000','8374829102','Ganesh@gmail.com','Avadi,chennai');

INSERT INTO CoursesInfo (COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
    ('Database Systems', 'Dr.Karthik'),
    ('Computer Networks', 'Prof.Anand'),
    ('Software Engineering', 'Dr.Balaji');

INSERT INTO EnrollmentInfo (STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
    (1, 1, 'Enrolled'),  -- Sarath is enrolled in Database Systems
    (1, 2, 'Enrolled'),  -- Sarath is enrolled in Computer Networks
    (2, 1, 'Enrolled'),  -- Gowtham is enrolled in Database Systems
    (3, 3, 'Enrolled');  -- Ganesh is enrolled in Software Engineering

SELECT s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
ORDER BY s.STU_ID;

SELECT c.COURSE_NAME
FROM EnrollmentInfo e
JOIN CoursesInfo c ON e.COURSE_ID = c.COURSE_ID
WHERE e.STU_ID = 1;  -- For student with STU_ID = 1 (Sarath)

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID = 2;  -- For course with COURSE_ID = 2

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID IN (1, 2); 

SELECT c.COURSE_NAME, COUNT(e.ENROLLMENT_ID) AS Total_Enrolled
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME
ORDER BY Total_Enrolled DESC;

SELECT s.STU_NAME
FROM EnrollmentInfo e
JOIN StudentInfo s ON e.STU_ID = s.STU_ID
WHERE e.COURSE_ID = 1;  -- For course with COURSE_ID = 1

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(e.ENROLLMENT_ID) AS Total_Enrolled
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_INSTRUCTOR_NAME;

SELECT s.STU_NAME
FROM EnrollmentInfo e
JOIN StudentInfo s ON e.STU_ID = s.STU_ID
GROUP BY s.STU_NAME
HAVING COUNT(e.COURSE_ID) > 1;

SELECT c.COURSE_NAME, COUNT(e.ENROLLMENT_ID) AS Total_Enrolled
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME
ORDER BY Total_Enrolled DESC;
