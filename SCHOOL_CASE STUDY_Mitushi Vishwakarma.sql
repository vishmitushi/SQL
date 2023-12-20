create database school;
use school;

create table courseMaster(
cid int primary key,
courseName varchar(40) not null,
category char(1) null check (category in ('B','M','A')),
fee smallmoney not null check(fee >= 0),
);

create table studentMaster(
sid tinyint primary key,
studentName varchar(40) not null,
origin char(1) not null check(origin in ('L','F')),
type char(1) not null check(type in ('U','G'))
);

create table enrollmentMaster(
cid int not null foreign key(cid) references courseMaster(cid) on delete cascade,
sid tinyint not null foreign key(sid) references studentMaster(sid) on delete cascade,
doe datetime not null,
fwf bit not null,
grade char(1) check(grade in ('O','A','B','C'))
);

insert into courseMaster values
(101, 'Java', 'B', 200), 
(102, 'Python', 'B', 200),
(103, 'DSA', 'A', 300),
(104, 'DBMS', 'M', 200), 
(105, 'Computer Networks', 'B', 150 ),
(106, 'Cyber Security','B',100), 
(107, 'Biz skill', 'B', 100 ),
(108, 'Machine Learning' , 'A', 400 );

insert into studentMaster values
(1, 'John Doe', 'L', 'G'), 
(2, 'Jane Smith', 'F', 'U'),
(3, 'Robert Johnson', 'L', 'G'),
(4, 'Sarah Brown', 'L', 'U'), 
(5, 'David Lee', 'F', 'U' ),
(6, 'Laura Hall', 'F', 'G'), 
(7, 'Michael Davis', 'F', 'U'),
(8, 'Emma Wilson' , 'L', 'U'),
(9, 'William Taylor', 'F', 'G'),
(10, 'Olivia Adams','L', 'U'),
(11, 'VISHESH SINGH', 'F', 'U'), 
(12, 'POOJA PANDEY','L', 'G'),
(13, 'SHRISTI SHARMA' , 'L', 'U'),
(14, 'SHUBHAM PATIDAR', 'L', 'G'),
(15, 'Olivia Ken', 'F', 'G');

insert into studentMaster values
(16, 'AMY CAESAR', 'F', 'G'), 
(17, 'NEERA SINGH', 'F', 'U'),
(18, 'ROHIT SHARMA', 'F', 'G'),
(19, 'MS DHONI', 'F', 'U'), 
(20, 'SHIV KUMAR', 'F', 'U' );

insert into studentMaster values
(21, 'jen aniston', 'L', 'G');

insert into enrollmentMaster values
(101,1,'2023-01-05 08:30:00',0,'O'),
(102,2,'2023-02-10 15:45:00',0,'O'),
(103,3,'2023-03-15 12:00:00',0,'B'),
(104,4,'2023-04-20 12:20:00',1,'O'),
(105,5,'2023-05-25 09:00:00',1,'O'),
(106,6,'2023-06-30 14:10:00',0,'A'),
(107,7,'2023-07-05 14:30:00',0,'O'),
(108,8,'2023-08-10 10:45:00',1,'A'),
(104,9,'2023-09-15 02:15:00',1,'C'),
(105,10,'2023-05-25 07:30:00',1,'B'),
(106,11,'2023-06-30 11:20:00',0,'A'),
(103,12,'2023-07-05 13:00:00',0,'O'),
(102,13,'2023-08-10 07:30:00',1,'C'),
(101,14,'2023-09-15 07:30:00',1,'B'),
(105,15,'2023-10-20 07:30:00',1,'O');

insert into enrollmentMaster values
(101,2,'2023-02-10 15:45:00',0,'O'),
(101,3,'2023-03-15 12:00:00',0,'B'),
(101,4,'2023-04-20 12:20:00',1,'O'),
(101,5,'2023-05-25 09:00:00',1,'O'),
(101,6,'2023-06-30 14:10:00',0,'A'),
(101,7,'2023-07-05 14:30:00',0,'O'),
(101,8,'2023-08-10 10:45:00',1,'A'),
(101,9,'2023-09-15 02:15:00',1,'C'),
(101,10,'2023-05-25 07:30:00',1,'B'),
(101,11,'2023-06-30 11:20:00',0,'A'),
(101,12,'2023-07-05 13:00:00',0,'O'),
(101,13,'2023-08-10 07:30:00',1,'C'),
(101,15,'2023-10-20 07:30:00',1,'O');

insert into enrollmentMaster values
(101,16,'2023-01-05 08:30:00',0,'O'),
(102,17,'2023-02-10 15:45:00',0,'O'),
(103,18,'2023-03-15 12:00:00',0,'B'),
(104,19,'2023-04-20 12:20:00',1,'O'),
(105,10,'2023-05-25 09:00:00',1,'O');

insert into enrollmentMaster values
(102,17,'2020-02-10 15:45:00',0,'O'),
(103,18,'2022-03-15 12:00:00',0,'B'),
(104,19,'2021-04-20 12:20:00',1,'O'),
(105,10,'2020-05-25 09:00:00',1,'O');


insert into enrollmentMaster values
(101,20,'2023-01-05 08:30:00',0,'O');

insert into enrollmentMaster values
(101,19,'2023-01-05 08:30:00',0,'O'),
(101,17,'2023-02-10 15:45:00',0,'O'),
(101,18,'2023-03-15 12:00:00',0,'B');

-- 1. List the course wise total no. of Students enrolled. Provide the information 
--    only for students of foreign origin and only if the total exceeds 10.

select c.courseName,count(e.cid) as no_of_students_enrolled from courseMaster as C 
join enrollmentMaster as e on e.cid = C.Cid
join studentMaster as S on S.Sid=e.Sid
WHERE s.origin = 'F'
group by c.courseName
HAVING COUNT(E.cID)>10;

-- 2. List the names of the Students who have not enrolled for Java course.
select studentName,c.courseName from studentMaster as s
join enrollmentMaster as e on e.sid = s.sid
join courseMaster as c on c.cid=e.cid
where not c.courseName = 'Java';

--3. List the name of the advanced course where the enrollment by foreign students is the highest.
SELECT COURSENAME,COUNT(courseName) FROM courseMaster AS C
join enrollmentMaster as e on e.Cid = C.Cid
join studentMaster as S on S.Sid=e.Sid
WHERE S.ORIGIN = 'F' AND C.category='A'
GROUP BY C.courseName
ORDER BY COUNT(C.courseName) DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--4. List the names of the students who have enrolled for at least one basic course in the current month.
SELECT studentName FROM studentMaster AS S
join enrollmentMaster as e on e.sid = s.sid
join courseMaster as c on c.cid=e.cid
WHERE C.category = 'B' AND MONTH(E.DOE) = MONTH(2023-06-30);

--5. List the names of the Undergraduate, local students who have got a “C” grade in any basic course.
SELECT studentName,courseName FROM studentMaster AS S
join enrollmentMaster as e on e.sid = s.sid
join courseMaster as c on c.cid=e.cid
WHERE E.grade = 'C' AND S.ORIGIN = 'L' AND C.category = 'B' AND S.type='U';

--6.	List the names of the courses for which no student has enrolled in the month of May 2020.
SELECT DISTINCT courseName FROM courseMaster AS C
WHERE NOT EXISTS (SELECT CID FROM enrollmentMaster AS em WHERE em.CID = C.cid AND YEAR(EM.DOE) = 2023 AND MONTH(EM.DOE) = 5); 

--7.	List name, Number of Enrollments and Popularity for all Courses. Popularity has to be 
--      displayed as “High” if number of enrollments is higher than 50,  “Medium” if greater than or
--      equal to 20 and less than 50, and “Low” if the no.  Is less than 20.
SELECT C.[courseName],COUNT(E.CID) AS NO_OF_ENROLLMENTS, 
CASE 
	WHEN COUNT(E.CID)>10 THEN 'HIGH'
	WHEN COUNT(E.CID) BETWEEN 5 AND 10 THEN 'MEDIUM'
	ELSE 'LOW'
END AS POPULARITY FROM courseMaster AS C
JOIN enrollmentMaster AS E ON E.CID=C.CID
GROUP BY C.courseName
ORDER BY NO_OF_ENROLLMENTS;

-- 8.	List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days.
SELECT TOP 1 studentName,courseName,DATEDIFF(DAY, E.DOE, GETDATE()) AS AgeOfEnrollmentInDays FROM EnrollmentMaster AS E
JOIN studentMaster AS S ON E.SID = S.SID
JOIN courseMaster AS C ON E.CID = C.CID
ORDER BY AgeOfEnrollmentInDays;

--9.	List the names of the Local students who have enrolled for exactly 3 basic courses. 
--  //    My data doesn't have local students for this query so changed the condition to foreign students  //
Select [studentName],count(e.sid) as no_of_courses from [dbo].[studentMaster] as s
join [dbo].[enrollmentMaster] as e on e.sid=s.sid
join [dbo].[courseMaster] as c on e.cid=c.cid
where c.category='B' and s.origin='F' 
group by [studentName]
having count(e.sid)=3;

--10.	List the names of the Courses enrolled by all (every) students.
select c.[courseName] from [dbo].[courseMaster] as c
join [dbo].[enrollmentMaster] as e on e.cid=c.cid
join [dbo].[studentMaster] as s on e.sid=s.sid
group by c.[courseName]
having count(e.sid) = (select count(sid) from studentMaster)

--11.	For those enrollments for which fee have been waived, provide the names of students who have got ‘O’ grade.
select studentName from studentMaster as s
join enrollmentMaster as e on e.sid=s.sid
where fwf = 1 and grade = 'O';

--12.	List the names of the foreign, undergraduate students who have got grade ‘C’ in any basic course.
select studentName from studentMaster as s
join enrollmentMaster as e on e.sid=s.sid
join [dbo].[courseMaster] as c on e.cid=c.cid
where origin='F' and grade = 'C' and category='B' and type = 'U';

--13.	List the course name, total no. of enrollments in the current month.
select courseName, count(e.cid) from courseMaster as c
join enrollmentMaster as e on e.cid=c.cid
where MONTH(doe)=Month(GETDATE())
group by courseName;


SELECT * FROM courseMaster;
SELECT * FROM studentMaster;
SELECT * FROM enrollmentMaster;



