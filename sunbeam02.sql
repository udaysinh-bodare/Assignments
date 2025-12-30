create database sunbeam_db;
use sunbeam_db;

create table users(
email varchar(20) ,
password varchar(20),
role enum('admin','student')
);
ALTER TABLE users
DROP FOREIGN KEY fk1;

alter table users
modify column password varchar(200);

create table students(
reg_no int primary key,
name varchar(20),
email varchar(20),
course_id int,
mobile_no int,
profile_pic blob
);
show create table students;
ALTER TABLE students
MODIFY reg_no INT NOT NULL AUTO_INCREMENT;

alter table students add unique(email), add constraint fk2 foreign key(course_id) references courses(course_id);
alter table students add unique(mobile_no);
alter table students modify column mobile_no varchar(10);

create table courses(
course_id int primary key,
course_name varchar(20),
discription varchar(20),
fees int,
start_date date,
end_date date,
video_expire_days int
);

ALTER TABLE courses
MODIFY course_id INT AUTO_INCREMENT ;



create table videos(
video_id int primary key,
course_id int,
title varchar(20),
discription varchar(20),
youtube_url varchar(30),
added_at date
);
ALTER TABLE videos
MODIFY video_id INT AUTO_INCREMENT,
MODIFY added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE students DROP FOREIGN KEY fk2;

alter table videos
add constraint fk3 foreign key(course_id) references courses(course_id);

insert into user(email,password,role)
values('s1',12389,'student'),
		('s2',12389,'student'),
        ('s3',12389,'student');
        
insert into users(email,password,role)
values('uday@gmail.com','uday','admin');
update users set role='admin' where email="uday123@gmail.com";


insert into students (reg_no,name,email,course_id,mobile_no,profile_pic)
values(1,'student1','s1',1,123456,0101111),
		(6,'student2','s2',3,1234567,10011),
		(3,'stusent3','s3',1,1234568,1110001);
insert into students (reg_no,name,email,course_id,mobile_no,profile_pic)
values(10,'uday','uday@gmail.com',1,9284111111,0101111);        
        
insert into courses(course_id,course_name,description,fees,start_date,end_date,video_expire_days)
values(1,'IIT-MERN-2025','MERN',4000,'2025-12-20','2026-1-20',30),
		(7,'AI','COURSE RELATED AI',10000,'2025-12-24','2026-1-24',5),
        (8,'ANDROID','ANDROID COURSE',9999,'2025-12-24','2026-1-24',7),
        (11,'PYTHON','PY',10000,'2025-12-24','2026-1-24',20),
        (3,'IIT-MERN-2025-JULY','MERN',4000,'2025-12-20','2026-1-20',30);
        
        
insert into videos(video_id,course_id,title,description,youtube_url,added_at)
values(12,1,'mern video 6','MERN','url1','2025-11-26 23:26:18'),
		(14,1,'mern 10','MERN','url2','2025-11-26 23:52:13');
        

        
select *from courses;
select *from users;
select *from students;
select *from videos;
update courses set start_date='2025-12-10' where course_id=3;



-- Q1. Write a Sql query that will fetch all upcoming courses.

select * from courses where start_date>'2025-12-12';


--  Q2. Write a Sql query that will fetch all the registered students along with course name


select reg_no,name,email,mobile_no,course_id,course_name from students natural join courses;



-- Q3. Write an SQL query to fetch the complete details of a student (based on their email) along with the details of the course they are enrolled in.

select * from students natural join courses where email='s1';



-- Q4 Write an SQL query to retrieve the course details and the list of non-expired videos for a specific student
--    using their email address. A video is considered active (not expired) if its added_at date plus the course’s
--    video_expire_days has not yet passed compared to the current date



select course_id,course_name,start_date,end_date,video_expire_days,video_id,title,added_at 
from courses natural join videos natural join students  where email='s1' and date_add(added_at,INTERVAL video_expire_days day)>= curdate();

ALTER TABLE user RENAME TO users;


