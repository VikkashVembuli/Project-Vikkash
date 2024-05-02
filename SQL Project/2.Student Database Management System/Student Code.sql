create table Student(Student_id integer, Stu_name text, Department text, email_id text,
					 Phone_no numeric, Address text,Date_of_birth date, Gender Text, 
					 Major text, GPA numeric,Grade text);

Insert Into Student Values (201,'Nandha', 'Computer Science', 'Nandha@example.com', 1234567890, '123 Main St', '2000-01-01', 'Male', 'CS', 3.5, 'B'),
    (202,'Rani', 'Mathematics', 'Rani@example.com', 9876543210, '456 Sriramlu St', '2001-02-02', 'Female', 'Math', 3.8, 'A'),
    (203,'Akshaya', 'Physics', 'Akshaya@example.com', 1122334455, '789 Periyar St', '1999-03-03', 'Female', 'Phys', 6.0, 'A'),
    (204,'Ramesh', 'Chemistry', 'Ramesh@example.com', 2233445566, '321 Nerhu St', '2002-04-04', 'Male', 'Chem', 2.8, 'C'),
    (205,'Charles', 'Biology', 'Charles@example.com', 3344556677, '654 Thiruvalur St', '2003-05-05', 'Male', 'Bio', 3.2, 'B'),
    (206,'Evanjelin', 'English', 'Evanjelin@example.com', 4455667788, '987 Lake St', '2000-06-06', 'Female', 'Eng', 3.7, 'A'),
    (207,'Ram', 'History', 'Ram@example.com', 5566778899, '159 West St', '2001-07-07', 'Male', 'Hist', 2.5, 'C'),
    (208,'Gayathri', 'Art', 'Gayathri@example.com', 6677889900, '753 East St', '1998-08-08', 'Female', 'Art', 3.9, 'A'),
    (209,'Jai', 'Music', 'Jai@example.com', 7788990011, '357 Ambethkar St', '2002-09-09', 'Male', 'Mus', 7.0, 'C'),
    (210,'Sushmitha', 'Philosophy', 'Sushmitha@example.com', 8899001122, '246 Pillaiyar kovil St', '1999-10-10', 'Female', 'Phil', 4.0, 'A');

Select * from Student;

Select * from Student order by grade desc; 

Select * from Student where Gender = 'Male'; 

Select * from Student where Gpa < 5.0;

Update Student Set Grade = 'B', Email_id = 'Ramesh@gmail.com' where Student_id = 204;

Select stu_name, date_of_birth from Student where Grade = 'B';

Select Department, Gender, avg(GPA) from student group by Department, Gender;

Alter table Student rename to studentsinfo;

Select Stu_Name from studentsinfo WHERE GPA = (select max(GPA) from studentsinfo);

