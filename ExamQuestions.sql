--3.  Create a table (person) in SQL with id, name,phno,email and address . 
create table Person
(
Id int primary key identity,
[Name] nvarchar(100),
Phone char(20),
Email nvarchar(100),
Address nvarchar(100)
)
--4.  Write a SQL query to fetch "FIRST_NAME" from the Student table in 
--upper case and use ALIAS name as STUDENT_NAME. 
create table Student
(
StudentId int primary key identity,
FirstName nvarchar(100),
LastName nvarchar(100),
GPA float,
EnrollmentDate Datetime,
Major nvarchar(50)
)

insert into Student
values('Azima','Qadirli',9,'12.05.2024','IT'),('Shivansh','Aliyev',5,'11.06.2025','Finance')

select upper(FirstName) [Student_Name]
from Student

--5. Write a SQL query to print the first 3 characters of FIRST_NAME from 
--Student table. 

select SUBSTRING(FirstName,1,3) from Student

--6.  Write a SQL query to find the position of alphabet ('a') int the first name 
--column 'Shivansh' from Student table. 

select CharIndex('a',FirstName) from Student
where FirstName = 'Shivansh'

--7.  Write a SQL query to fetch unique values of MAJOR Subjects from 
--Student table. 
select distinct Major from Student

--8.  Write a SQL query that fetches the unique values of MAJOR Subjects 
--from Student table and print its length. 
select distinct Major, Len(Major) from Student

--9.  Write a SQL query to print FIRST_NAME from the Student table after 
--replacing 'a' with 'A'. 
select REPLACE(FirstName,'a','A') from Student

--10.  Write a SQL query to print the FIRST_NAME and LAST_NAME from 
--Student table into single column COMPLETE_NAME. 

select CONCAT(FirstName,' ',LastName) as CompleteName
from Student

--11.  Write a SQL query to print all Student details from Student table order 
--by FIRST_NAME Ascending and MAJOR Subject descending . 

select * from Student 
order by FirstName,
Major desc

--12.  Write a SQL query to print details of the Students with the 
--FIRST_NAME as 'Prem' and 'Shivansh' from Student table. 
select * from Student
where FirstName in('Prem','Shivansh')

--13.  Write a SQL query to print details of the Students excluding 
--FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
select * from Student
where FirstName not in ('Prem','Shivansh')

--14.  Write a SQL query to print details of the Students whose FIRST_NAME 
--ends with 'a'. 
select * from Student
where FirstName like '%a'

--15.  Write an SQL query to print details of the Students whose FIRST_NAME 
--ends with ‘a’ and contains six alphabets. 
select * from Student
where FirstName like '%a' and Len(FirstName)=6

select * from Student
where FirstName like '_____a'

--16.  Write an SQL query to print details of the Students whose GPA lies 
--between 9.00 and 9.99. 
select * from Student
where GPA between 9.00 and 9.99

--17.  Write an SQL query to fetch the count of Students having Major Subject 
--‘Computer Science’. 
select Count(*) as TotalCount
from Student
where Major = 'Computer Science'

--18. Write an SQL query to fetch Students full names with GPA >= 8.5 and 
--<= 9.5. 

select CONCAT(FirstName, ' ', LastName)  FullName 
from Student
where GPA between 8.5 and 9.5
 --or
select FirstName + ' ' + LastName 
from Student
where GPA>=8.5 and GPA<=9.5

--19.  Write an SQL query to fetch the no. of Students for each MAJOR subject 
--in the descending order. 

select Major,COUNT(Major) 
from Student
group by Major
order by COUNT(Major) desc

--20.  Display the details of students who have received scholarships, including 
--their names, scholarship amounts, and scholarship dates. 
--burda student table-dan elave scholarship table yarada bilerik

create table ScholarShip
(
ScholarShipId int primary key identity,
FirstName nvarchar(100),
LastName nvarchar(100),
ScholarShipAmount decimal,
ScholarShipDate datetime
)

insert into ScholarShip
values('Azima','Qadirli',5000,'11-05-2024'),('Shivansh','Aliyev',3500,'10-05-2025')

select s.FirstName,s.LastName,sh.ScholarShipAmount,sh.ScholarShipDate
from Student s
inner join ScholarShip sh
on s.StudentId = sh.ScholarShipId

--21.  Write an SQL query to show only odd rows from Student table. 
select * from Student
where StudentId %2 !=0

--22.  Write an SQL query to show only even rows from Student table. 
select * from Student
where StudentId %2 = 0

--23.  List all students and their scholarship amounts if they have received any. 
--If a student has not received a scholarship, display NULL for the 
--scholarship details. 

select s.FirstName,s.LastName,sh.ScholarShipAmount,sh.ScholarShipDate
from Student s 
left join ScholarShip sh
on s.StudentId = sh.ScholarShipId

--24.  Write an SQL query to show the top n (say 5) records of Student table 
--order by descending GPA. 
select Top 5 * 
from Student
order by GPA desc

--25.  Write an SQL query to determine the nth (say n=5) highest GPA from a table.

SELECT DISTINCT GPA
FROM Student
ORDER BY GPA DESC
OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;
