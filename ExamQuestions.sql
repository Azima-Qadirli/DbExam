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

--24.  Write an SQL query to show the top n (say 5) records of Student table order by descending GPA. 
select Top 5 * 
from Student
order by GPA desc

--25.  Write an SQL query to determine the nth (say n=5) highest GPA from a table.

SELECT DISTINCT GPA
FROM Student
ORDER BY GPA DESC
OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;


--26.  Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.

select * from Student s1
where 4 = 
(
select count(distinct(s2.GPA)) 
from Student s2
where s1.GPA>s2.GPA
)

--27.  Write an SQL query to fetch the list of Students with the same GPA. 
--eyni data olsun deye elave etmisem
insert into Student
values('Murad','Sadigov',9,'11-05-2025','Computer Science')

select s1.FirstName,s1.LastName,s1.GPA 
from Student s1
join Student s2
on s1.GPA = s2.GPA and s1.StudentId <> s2.StudentId
order by s1.GPA

--or
select s1.FirstName,s1.LastName,s1.GPA 
from Student s1,Student s2
where s1.GPA=s2.GPA and s1.StudentId != s2.StudentId

--28.  Write an SQL query to show the second highest GPA from a Student table using sub-query. 

select Max(GPA) from Student
where GPA not in(select Max(GPA) from Student)

--29.  Write an SQL query to list STUDENT_ID who does not get Scholarship.

select * from ScholarShip
where ScholarShipAmount is null

--30.  Write an SQL query to fetch the first 50% records from a table. 
select top 50 percent *
from Student
order by FirstName

--31.  Write an SQL query to fetch the MAJOR subject that have less than 4 people in it. 
select Major,COUNT(Major) MajorCount
from Student
group by Major
having COUNT(Major)<4

--32.  Write an SQL query to show all MAJOR subject along with the number  of people in there. 
select Major,COUNT(Major) AllMajor
from Student
group by Major

--33.  Write an SQL query to show the last record from a table. 
Select StudentId,FirstName,LastName from Student
where StudentId = (select max(StudentId) from Student)


--34.  Write an SQL query to fetch the first row of a table. 
select StudentId,FirstName,LastName from Student
where StudentId = (select min(StudentId) from Student)

--35.  Write an SQL query to fetch the last five records from a table. 
SELECT TOP 5 *
FROM Student
WHERE StudentId IN (
    SELECT TOP 5 StudentId
    FROM Student
    ORDER BY StudentId DESC
)
ORDER BY StudentId ASC

--36.  Write an SQL query to fetch three max GPA from a table using co-related subquery. 
select distinct GPA from Student s1
where 3 >= (select count(distinct GPA) from Student s2 where s1.GPA < s2.GPA) order by s1.GPA desc

--37.  Write an SQL query to fetch three min GPA from a table using co-related subquery. 
select distinct GPA from Student s1
where 3 >= (select count(distinct GPA) from Student s2 where s1.GPA > s2.GPA) order by s1.GPA 

--38.  Write an SQL query to fetch nth max GPA from a table. 
select distinct GPA from Student s1
where GPA = (select count(distinct GPA) from Student s2 where s2.GPA < s1.GPA)
order by s1.GPA desc

--39.  Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects. 
select Major,Max(GPA) as MaxGpa
from Student
group by Major

--40.  Write an SQL query to fetch the names of Students who has highest GPA.
select FirstName + ' ' + LastName,GPA
from Student
where GPA=(select max(GPA) from Student)

--41.  Write an SQL query to show the current date and time. 
select GETDATE() 

--42.  Write a query to create a new table which consists of data and structure  copied from the other table (say Student) or clone the table named Student. 
select * 
into NewStudentTable
from Student	

--43.  Write an SQL query to update the GPA of all the students in 'Computer Science' MAJOR subject to 7.5. 
update Student
set GPA = 7.5
where Major = 'Computer Science'

--44.  Write an SQL query to find the average GPA for each major. 
select Major,AVG(Gpa) as AverageGPA
from Student
group by Major
order by AverageGPA

--45.  Write an SQL query to show the top 3 students with the highest GPA. 
select top 3 FirstName + ' ' + LastName,GPA
from Student
order by GPA desc

--46. Write an SQL query to find the number of students in each major who have a GPA greater than 7.5. 
select count(StudentId),MAJOR
from Student
where GPA >= 7.5
group by Major

--47.  Write an SQL query to find the students who have the same GPA as  'Shivansh Aliyev'. 
select * from Student
where GPA = (select GPA from Student where FirstName = 'Shivansh' and LastName = 'Aliyev')

--48.  Write an SQL query that returns the project number and name for projects with a budget greater than $100,000. (employee (eno, ename, 
--bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, 
--hours)) 
SELECT pno, pname
FROM Projects
WHERE budget > 100000;

--49.  Write an SQL query that returns all works on records where hours worked is less than 10 and the responsibility is 'Manager'. (employee 
--(eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT *
FROM Workson
WHERE hours < 10 AND resp = 'Manager';


--50.  Write an SQL query that returns the employees (number and name only) who have a title of 'EE' or 'SA' and make more than $35,000. (employee (eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
 
 SELECT eno, ename
FROM Employee
WHERE title IN ('EE', 'SA') AND salary > 35000;

--51.  Write an SQL query that returns the employees (name only) in department 'D1' ordered by decreasing salary. (employee (eno, ename, 
--bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT e.ename
FROM Employee e
JOIN Departments d
ON e.dno = d.dno
WHERE d.dname = 'D1'
ORDER BY e.salary DESC;


--52.  Write an SQL query that returns the departments (all fields) ordered by ascending department name. (employee (eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT *
FROM Departments
ORDER BY dname ASC;

--53.  Write an SQL query that returns the employee name, department name, and employee title. (employee (eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname,  mgreno) && workson (eno, pno, resp, hours)) 
SELECT e.ename AS EmployeeName, d.dname AS DepartmentName, e.title AS EmployeeTitle
FROM Employee e
JOIN Departments d
ON e.dno = d.dno;

--54.  Write an SQL query that returns the project name, hours worked, and project number for all works on records where hours > 10. (employee 
--(eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT p.pname AS ProjectName, w.hours AS HoursWorked, p.pno AS ProjectNumber
FROM Projects p
JOIN Workson w
ON p.pno = w.pno
WHERE w.hours > 10;

--55.  Write an SQL query that returns the project name, department name, and budget for all projects with a budget < $50,000. (employee (eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT p.pname AS ProjectName, d.dname AS DepartmentName, p.budget AS Budget
FROM Projects p
JOIN Departments d
ON p.dno = d.dno
WHERE p.budget < 50000;

--56.  Write an SQL query that returns the employee numbers and salaries of all employees in the 'Consulting' department ordered by descending 
--salary. (employee (eno, ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, hours)) 
SELECT e.eno AS EmployeeNumber, e.salary AS Salary
FROM Employee e
JOIN Departments d
ON e.dno = d.dno
WHERE d.dname = 'Consulting'
ORDER BY e.salary DESC;


--57.  Write an SQL query that returns the employee name, project name, employee title, and hours for all works on records. (employee (eno, 
--ename, bdate, title, salary, dno) && projects (pno, pname, budget, dno) && departments  (dno, dname, mgreno) && workson (eno, pno, resp, 
--hours)) 
SELECT e.ename AS EmployeeName, p.pname AS ProjectName, e.title AS EmployeeTitle, w.hours AS Hours
FROM Employee e
JOIN Workson w ON e.eno = w.eno
JOIN Projects p ON w.pno = p.pno;

--58.  Write the SQL query which Find the name and price of the cheapest item(s). 
SELECT Name, Price
FROM Items
WHERE Price = (SELECT MIN(Price) FROM Items);

--59.  Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'. 
SELECT SaleId, FORMAT(SaleDate, 'yyyy-MM-dd') AS sale_date
FROM Sales;

--60.  Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.  
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20 AND 600;

--61.  Calculate the total revenue generated from sales for each product category.  
SELECT p.category, SUM(s.TotalPrice) AS total_revenue
FROM Sales s
JOIN Products p ON s.ProductId = p.ProductId
GROUP BY p.category;
--62.  Identify products with total sales exceeding 30. 
SELECT p.ProductName
FROM Sales s
JOIN Products p ON s.ProductId = p.ProductId
GROUP BY p.ProductName
HAVING SUM(s.TotalPrice) > 30;
--63.  Count the number of sales made in each month.
SELECT FORMAT(SaleDate,'yyyy-MM') AS month, COUNT(*) AS sales_count
FROM Sales s
GROUP BY FORMAT(SaleDate,'yyyy-MM')
--64.  Determine the average quantity sold for products with a unit price greater than $100. 
SELECT AVG(s.QuantitySold) AS average_quantity_sold
FROM Sales s
JOIN Products p ON s.ProductId = p.ProductId
WHERE p.UnitPrice > 100;
--65.  Retrieve the product name and total sales revenue for each product.
SELECT p.ProductName, SUM(s.TotalPrice) AS total_revenue
FROM Sales s
JOIN Products p ON s.ProductId = p.ProductId
GROUP BY p.ProductName
--66.  List all sales along with the corresponding product names. 
SELECT s.SaleId, p.ProductName
FROM Sales s
JOIN Products p ON s.ProductId = p.ProductId;
--67.  Categorize sales as "High", "Medium", or "Low" based on total price (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low). 
SELECT SaleId, 
       CASE 
           WHEN TotalPrice > 200 THEN 'High'
           WHEN TotalPrice BETWEEN 100 AND 200 THEN 'Medium'
           ELSE 'Low'
       END AS sales_category
FROM Sales;
--68.  Identify sales where the quantity sold is greater than the average quantity sold.  
SELECT * FROM Sales
WHERE QuantitySold > (SELECT AVG(QuantitySold) FROM Sales);
--69.  Extract the month and year from the sale date and count the number of  sales for each month. 
 SELECT FORMAT(SaleDate, 'yyyy-MM') AS MonthYear, COUNT(*) AS SalesCount
FROM Sales
GROUP BY FORMAT(SaleDate, 'yyyy-MM')
ORDER BY MonthYear;

--70.  Retrieve the product details (name, category, unit price) for products that have a quantity sold greater than the average quantity sold across all products. 
SELECT ProductName, category, UnitPrice
FROM Products
WHERE ProductId IN (
    SELECT ProductId
    FROM Sales
    GROUP BY ProductId
    HAVING SUM(QuantitySold) > (SELECT AVG(QuantitySold) FROM Sales)
)