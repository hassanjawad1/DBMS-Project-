use Jawad;

CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    StudentRollNumber VARCHAR(20)
);
insert into student(StudentID, StudentName, StudentRollNumber)
values
 (1, 'Jawad Ahmed', '21CS036'),
    (2, 'Shaheer Ahmed', '21CS034'),
    (3, 'Hamid Mir', '21CS068'),
    (4, 'Ali Khan', '21CS012'),
    (5, 'Hammad Ahmed', '21CS004'),
    (6, 'Alish', '21CS006'),
    (7, 'Nawal Ahmed', '21CS008'),
    (8, 'Bilal Khan', '21CS078'),
    (9, 'Aisha Ahmed', '21CS089'),
    (10, 'Kamran Ali', '21CS067'),
    (11, 'Maria Khan', '21CS032'),
    (12, 'Imran Ahmed', '21CS014'),
    (13, 'Samina Malik', '21CS098'),
    (14, 'Nadia Ali', '21CS042'),
    (15, 'Usman Khan', '21CS076'),
    (16, 'Farah Ahmed', '21CS055'),
    (17, 'Khalid Hasan', '21CS011'),
    (18, 'Hina Khan', '21CS044'),
    (19, 'Saad Malik', '21CS022'),
    (20, 'Saima Ali', '21CS099'),
    (21, 'Zain Khan', '21CS033');
SELECT * FROM student;

CREATE TABLE assignment (
    AssignmentID INT PRIMARY KEY,
    AssignmentName VARCHAR(50),
    Deadline DATE
);


-- Insert data into the 'assignment' table
INSERT INTO assignment (AssignmentID, AssignmentName, Deadline)
VALUES
  (1, 'Assignment1', '2023-12-01'),
  (2, 'Assignment2', '2023-12-05'),
  (3, 'Assignment3', '2023-12-10'),
  (4, 'Assignment4', '2023-12-15'),
  (5, 'Assignment5', '2023-12-20');


SELECT * FROM assignment;


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName varchar(50)
);
INSERT INTO Courses (CourseID, CourseName)
VALUES
  (101, 'Computer Science'),
  (102, 'Mathematics'),
  (103, 'Physics'),
  (104, 'DSA'),
  (105, 'CAAP');



  SELECT * FROM Courses;


   
CREATE TABLE submission (
    SubmissionID INT PRIMARY KEY,
    StudentID INT,
    AssignmentID INT,
    SubmissionDate DATE,
    PDFFilePath VARCHAR(255),
    CourseID INT, -- Assuming CourseID is part of the 'submission' table
    FOREIGN KEY (StudentID) REFERENCES student(StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES assignment(AssignmentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID)
);

-- Insert data into the 'submission' table
INSERT INTO submission (SubmissionID, StudentID, AssignmentID, SubmissionDate, PDFFilePath, CourseID)
VALUES
  (1, 1, 1, '2024-01-05', 'E:\\MUET CONTENT INTERN\\RADAR\\dumy PDFS\\Assignment1.pdf', 101),
  (2, 2, 2, '2024-01-10', 'E:\\MUET CONTENT INTERN\\RADAR\\dumy PDFS\\Assignment2.pdf', 102),
  (3, 3, 3, '2024-01-15', 'E:\\MUET CONTENT INTERN\\RADAR\\dumy PDFS\\Assignment3.pdf', 103),
  (4, 4, 4, '2024-01-20', 'E:\\MUET CONTENT INTERN\\RADAR\\dumy PDFS\\Assignment4.pdf', 104),
  (5, 5, 5, '2024-01-25', 'E:\\MUET CONTENT INTERN\\RADAR\\dumy PDFS\\Assignment5.pdf', 105);

    SELECT * FROM submission;




SELECT * FROM information_schema.tables WHERE table_name = 'submission';


SELECT name FROM sys.database_principals WHERE type_desc = 'DATABASE_ROLE';
