create database QLSinhVien

use QLSinhVien
--Câu 1
CREATE TABLE student (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    name NVARCHAR(100),
	birthday date,
	email varchar(100)
);
insert into student
values
(N'Lê Minh Khoa','2003-09-11','khoa@gmail'),
(N'Nguyễn Huy Hoàng','2003-04-26','Hoang@gmail'),
(N'Trần Quý Bình','2004-02-01','Binh@gmail')

-- Câu 2
-- Thêm cột mới vào
alter table student
add address nvarchar(255)

-- Sửa tên của cột
EXEC sp_rename 'student.name',  'full_name', 'COLUMN';

-- Câu 3
select * from student

select full_name,email
from student
where YEAR(birthday) > 1985

select * from student
order by birthday desc

-- Câu 4
UPDATE student
SET email = NULL
WHERE full_name LIKE N'Nguyễn%';


delete student
where YEAR(birthday) < 1982
insert into Course 
values ('front-end','Giao diện'),
('back-end','Xử lý')
-- Câu 5
create table Course
(
	CourseId INT IDENTITY(1,1) PRIMARY KEY ,
	CourseName nvarchar(100),
	Coursedescription text,
)

create table Enrollments
(
	student_id int,
	course_id int,
	constraint FK_Enroll_Student foreign key(student_id) references student(id),
	constraint FK_Enroll_Course foreign key(course_id) references Course(CourseId)
)
-- Câu 6
select id,full_name,CourseName from student
INNER JOIN Enrollments ON student.id=Enrollments.student_id
INNER JOIN Course ON Enrollments.course_id=Course.CourseId


select id,full_name,CourseName from student 
LEFT JOIN Enrollments ON student.id=Enrollments.student_id
Left JOIN Course ON Enrollments.course_id=Course.CourseId