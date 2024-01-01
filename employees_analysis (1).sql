use employees;
show tables;

select * from employees;

select * from departments;

select * from dept_manager;

select * from dept_emp;

select * from titles;

select * from salaries;

-- Select the information from the “dept_no” column of the “departments” table(select)
select dept_no
from departments;

-- Select all data from the “departments” table.(from)
select * from departments;

-- Select all people from the “employees” table whose first name is “Elvis”.(where)
select * 
from employees
where first_name = 'Elvis';

-- Retrieve a list with all female employees whose first name is Kellie.(and)
select * 
from employees
where first_name = 'Kellie' and gender = 'F';

-- Retrieve a list with all employees whose first name is either Kellie or Aruna.(Or)
select * 
from employees
where first_name = 'Kellie' or first_name = 'Aruna';

-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.(and,or)
select * 
from employees
where gender = 'f' and (first_name = 'Kellie' or first_name = 'Aruna');

-- Use the IN operator to select all individuals from the “employees” table, 
-- whose first name is either “Denis”, or “Elvis”.
select * 
from employees
where first_name in ('Denis','Elvis');

-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
select * 
from employees
where
First_name not in ('John','Mark','Jacob');

-- select the data about all individuals, whose first name starts with “Mark”; 
-- specify that the name can be succeeded by any sequence of characters
select * 
from employees
where First_name like 'Mark%';

-- Retrieve a list with all employees who have been hired in the year 2000
select * 
from employees
where year(hire_date) like 2000;
-- Or
select * 
from employees
where hire_date like '%2000%';

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.
select * 
from employees
where emp_no like '1000_';

-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
select *
from employees
where first_name like '%jack%';

-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
select *
from employees
where first_name not like '%jack%';

-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
select * from salaries;

select * 
from salaries
where salary between 66000 and 70000;

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
select *
from employees
where emp_no not between 10004 and 10012;

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
select dept_name
from departments
where dept_no between 'd003' and 'd006';

select * from departments;

-- Select the names of all departments whose department number value is not null.
select dept_name
from departments
where dept_no is not null;

-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
select * 
from employees  
where gender = 'f' and year(hire_date) >= 2000;

select *
from employees 
where gender = 'f' and hire_date >= '2000-01-01' ;

-- Extract a list with all employees’ salaries higher than $150,000 per annum.
select *
from salaries
where salary > 150000 ;

-- Obtain a list with all different “hire dates” from the “employees” table.
select Distinct(hire_date)
from employees;

-- How many annual contracts with a value higher than or equal to $100,000 have been registered
-- in the salaries table?
select count(*) 
from salaries
where salary >= 100000;

-- How many managers do we have in the “employees” database?
-- Use the star symbol (*) in your code to solve this exercise.
select count(*)
from dept_manager;

-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
select *
from employees
order by hire_date desc;

-- Write a query that obtains two columns. The first column must contain annual salaries
-- higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, 
-- must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
select salary,count(emp_no) as emps_with_same_salary
from salaries
where salary > 80000
group by 1
order by 1;

-- Select all employees whose average salary is higher than $120,000 per annum.
select emp_no, avg(salary)
from salaries
group by 1
having avg(salary)>120000
order by 1;

-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
select emp_no
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no ; 

-- Select the first 100 rows from the ‘dept_emp’ table. 
select *
from dept_emp
limit 100;

-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
select count(distinct(dept_no))
from dept_emp;

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary)
from salaries
where from_date > '1997-01-01';

-- 1. Which is the lowest employee number in the database?
select min(emp_no)
from employees;

-- 2. Which is the highest employee number in the database?
select max(emp_no)
from employees;

-- What is the average annual salary paid to employees who started after the 1st of January 1997?alter
select avg(salary)
from salaries
where from_date > '1997-01-01';

-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997
-- to a precision of cents.
select Round(avg(salary),2)
from salaries
where from_date > '1997-01-01';

-- Extract a list containing information about all managers’ employee number, first and last name, 
-- department number, and hire date. 
select  e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
from employees e
inner join dept_manager d on e.emp_no = d.emp_no;

-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees 
-- whose last name is Markovitch. See if the output contains a manager with that name.  
select e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no 
where e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;

-- Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’,
-- ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

-- Extract a list containing information about all managers’ employee number, first and last name, department number,
-- and hire date. Use the old type of join syntax to obtain the result.
select e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
from employees e,
dept_manager dm
where
e.emp_no = dm.emp_no;

-- new
select e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
from employees e
join dept_manager dm on e.emp_no = dm.emp_no ;

-- prevent error code
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

-- Select the first and last name, the hire date, and the job title of all employees whose first name is
-- “Margareta” and have the last name “Markovitch”.
select e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch' 
order by e.emp_no ;

-- cross join example
select dm.*, d.*
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no ;

select dm.*, d.*
from dept_manager dm,
departments d
order by dm.emp_no, d.dept_no ;

select dm.*, d.*
from dept_manager dm
inner join departments d
order by dm.emp_no, d.dept_no ;

-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table
-- and department number 9.
select dm.*,d.*
from dept_manager dm
cross join departments d
where d.dept_no = 'd009'
order by d.dept_no ;

-- Return a list with the first 10 employees with all the departments they can be assigned to.
select e.*,d.*
from employees e
cross join departments d
where e.emp_no < 10011
order by e.emp_no, d.dept_name;

-- Select all managers’ first and last name, hire date, job title, start date, and department name.
select e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on d.dept_no = dm.dept_no 
join titles t on e.emp_no = t.emp_no
where t.title = 'manager'
order by e.emp_no ;

-- How many male and how many female managers do we have in the ‘employees’ database?
select e.gender, count(dm.emp_no) as Gender_count
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
group by e.gender
order by Gender_count ;

-- Extract the information about all department managers who were hired between the 1st of January 1990 and the
-- 1st of January 1995.
select * 
from dept_manager 
where emp_no in (select emp_no
					from employees
                    where
                    hire_date between '1990-01-01' and '1995-01-01') ;
                    
-- Select the entire information for all employees whose job title is “Assistant Engineer”. 
select *
from employees e
where exists (select *
				from titles t
                where t.emp_no = e.emp_no and title = 'Assistant Engineer') ;
                

-- Create a view that will extract the average salary of all managers registered in the database.
-- Round this value to the nearest cent.
create or replace view v_avg_salary_of_mngr as
select round(avg(salary),2)
from salaries s
join dept_manager dm on dm.emp_no = s.emp_no ;


-- Stored Procedures
Drop Procedure If Exists Select_employees;

delimiter $$
create procedure select_employee()
begin 
	select *
    from employees
    limit 1000;

end $$
delimiter ;

call employees.select_employee();

-- Create a procedure that will provide the average salary of all employees.
delimiter $$
create procedure average_salary()
begin 
	select avg(salary)
    from salaries;

end $$
delimiter ;

call average_salary();

-- stored procedures with an input parameter

delimiter $$
create procedure emp_salary(in p_emp_no integer)
begin 
	select e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    from employees e
    join salaries s on s.emp_no = e.emp_no
    where e.emp_no = p_emp_no;

end $$
delimiter ;

-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, 
-- and returns their employee number.
Delimiter $$
Create Procedure emp_info(in p_first_name varchar(25), in p_last_name varchar(25), out p_emp_no integer)
Begin 
	select e.emp_no
    into p_emp_no
    from employees e
    where e.first_name = p_first_name
		and e.last_name = p_last_name ;
End $$
Delimiter ;

-- Similar to the exercises done in the lecture, obtain a result set containing the employee number,
-- first name, and last name of all employees with a number higher than 109990.
-- Create a fourth column in the query, indicating whether this employee is also a manager,
-- according to the data provided in the dept_manager table, or a regular employee. 
select e.emp_no, e.first_name, e.last_name,
case 
	when dm.emp_no is not null then 'Manager'
    else 'Employee'
end as is_manager
    from employees e
join dept_manager dm on e.emp_no = dm.emp_no
where e.emp_no > 109990 ;


-- Extract a dataset containing the following information about the managers: employee number,
-- first name, and last name. Add two columns at the end – one showing the difference between 
-- the maximum and minimum salary of that employee, and another one saying whether this salary raise
-- was higher than $30,000 or NOT. (If possible, provide more than one solution.)
select dm.emp_no, e.first_name, e.last_name, 
max(s.salary) - min(s.salary) as salary_difference,
case
	when Max(s.salary)-min(s.salary) > 30000 then "Salary was raised is more than 30000"
    else "salary was not raised more than 30000"
end as salary_rise
from employees e
join salaries s on e.emp_no = s.emp_no
join dept_manager dm on s.emp_no = dm.emp_no
group by e.emp_no ;

-- Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
-- called “current_employee” saying “Is still employed” if the employee is still working in the company, or
-- “Not an employee anymore” if they aren’t.
-- Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

select e.emp_no, e.first_name, e.last_name,
case
	when max(de.to_date) > sysdate() then "is stilled employed"
    else "not an employee "
end as current_employee
from employees e
join dept_emp de on e.emp_no = de.emp_no 
group by e.emp_no
limit 100 ;

-- SQL Window Functions
-- 1. Row_number
-- Write a query that upon execution, assigns a row number to all managers we have information for in the "employees"
-- database (regardless of their department).
-- Let the numbering disregard the department the managers have worked in. Also, let it start from the value of
-- 1. Assign that value to the manager with the lowest employee number.
select emp_no, dept_no,
Row_Number() over(order by emp_no) as row_num
from dept_manager ;

-- Write a query that upon execution, assigns a sequential number for each employee number registered in the
-- "employees" table. Partition the data by the employee's first name and order it by their last name in
-- ascending order (for each partition).
select emp_no, first_name, last_name,
Row_Number() Over(partition by first_name order by last_name) as row_num
from employees ;

-- Obtain a result set containing the salary values each manager has signed a contract for.
-- To obtain the data, refer to the "employees" database.
-- Use window functions to add the following two columns to the final output:

-- a column containing the row number of each row from the obtained dataset, starting from 1.
-- a column containing the sequential row numbers associated to the rows for each manager,
-- where their highest salary has been given a number equal to the number of rows in the given partition,
-- and their lowest - the number 1.
-- Finally, while presenting the output, make sure that the data has been ordered by the values in the
-- first of the row number columns, and then by the salary values for each partition in ascending order.

select dm.emp_no, s.salary,
Row_Number() Over(Partition by s.emp_no order by s.salary ) as row_num1,
Row_Number() Over(partition by s.emp_no order by s.salary desc) as row_num2
from salaries s
join dept_manager dm on s.emp_no = dm.emp_no;

-- Obtain a result set containing the salary values each manager has signed a contract for.
-- To obtain the data, refer to the "employees" database.

-- Use window functions to add the following two columns to the final output:

-- a column containing the row numbers associated to each manager, where their highest salary has been given
-- a number equal to the number of rows in the given partition, and their lowest - the number 1.

-- a column containing the row numbers associated to each manager, where their highest salary has been
-- given the number of 1, and the lowest - a value equal to the number of rows in the given partition.

-- Let your output be ordered by the salary values associated to each manager in descending order.

-- Hint: Please note that you don't need to use an ORDER BY clause in your SELECT statement to
-- retrieve the desired output.
-- (solution space)


-- Write a query that provides row numbers for all workers from the "employees" table, partitioning the data
-- by their first names and ordering each partition by their employee number in ascending order.
select emp_no, first_name,
Row_Number() Over w as Row_num
from employees
window w as (Partition By first_name order by emp_no) ;

-- Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output,
-- use a subquery containing a window function, as well as a window specification introduced with the help of the
-- WINDOW keyword.

-- Also, to obtain the desired result set, refer only to data from the “salaries” table.
select emp_no, min(salary) as Min_salary
from 
(select emp_no, salary,
Row_Number() Over w as Row_num
from salaries
Window w as (partition by emp_no order by salary))
salaries
group by emp_no ;

-- Again, find out the lowest salary value each employee has ever signed a contract for. Once again,
-- to obtain the desired output, use a subquery containing a window function. This time, however,
-- introduce the window specification in the field list of the given subquery.

-- To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no, min(salary) as Min_salary
from 
(select emp_no, salary,
Row_Number() Over(Partition By emp_no order by salary) as Row_num
from salaries)
salaries
group by emp_no ;

-- Once again, find out the lowest salary value each employee has ever signed a contract for. This time,
-- to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.

-- To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no, Min(salary) as Min_salary
from 
(select emp_no, salary
from salaries)
salaries
group by emp_no;

-- Once more, find out the lowest salary value each employee has ever signed a contract for. To obtain
-- the desired output, use a subquery containing a window function, as well as a window specification
-- introduced with the help of the WINDOW keyword. Moreover, obtain the output without using a
-- GROUP BY clause in the outer query.

-- To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no, salary as Min_salary
from
(select emp_no, salary,
Row_Number() Over w As Row_num
from salaries
Window w as (Partition by emp_no order by salary))
salaries
where row_num = 1;

-- Find out the second-lowest salary value each employee has ever signed a contract for.
-- To obtain the desired output, use a subquery containing a window function, as well as a window
-- specification introduced with the help of the WINDOW keyword. Moreover,
-- obtain the desired result set without using a GROUP BY clause in the outer query.

-- To obtain the desired result set, refer only to data from the “salaries” table.
select emp_no, salary as Min_salary
from
(select emp_no, salary,
Row_Number() Over w as Row_num
from salaries
Window w as (Partition By emp_no order by salary))
salaries
where Row_num = 2 ;

-- Write a query containing a window function to obtain all salary values that employee number 10560 has
-- ever signed a contract for.

-- Order and display the obtained salary values from highest to lowest.
select emp_no, salary,
Row_Number() Over w as Row_num
from salaries
where emp_no = 10560
window w as (Partition By emp_no Order by salary desc);

-- Write a query that upon execution, displays the number of salary contracts that each manager has
-- ever signed while working in the company.
select dm.emp_no, count(s.salary)
from dept_manager dm
join salaries s on
dm.emp_no = s.emp_no
group by dm.emp_no
order by dm.emp_no ;

-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560
-- has ever signed a contract for. Use a window function to rank all salary values from highest to lowest
-- in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent
-- rows are allowed.
select emp_no, salary,
Rank() Over w as Rank_num
from salaries
where emp_no = 10560
Window w as (Partition By emp_no order by salary desc) ;

-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has
-- ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that
-- equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
select emp_no, salary,
Dense_Rank() Over w as Dense_Rank_num
from salaries
where emp_no = 10560
Window w as (Partition By emp_no order by salary desc) ;

-- Write a query that ranks the salary values in descending order of all contracts signed by employees numbered
-- between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank.
-- Also, allow gaps in the ranks obtained for their subsequent rows.

-- Use a join on the “employees” and “salaries” tables to obtain the desired result.
select e.emp_no,
Rank() Over w as emp_salary_ranking,
s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
and e.emp_no between 10500 and 10600
window w as (partition by e.emp_no order by s.salary desc) ;

-- Write a query that ranks the salary values in descending order of the following contracts from the "employees"
-- database:
-- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.

-- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the 
-- company for the first time.

-- In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks
-- obtained for their subsequent rows.

-- Use a join on the “employees” and “salaries” tables to obtain the desired result.
select e.emp_no,
Dense_Rank() Over w as Salary_ranking,
s.salary,
e.hire_date,
s.from_date,
year(s.from_date) - year(e.hire_date) as years_from_hired
from employees e
join salaries s on
s.emp_no = e.emp_no
where year(s.from_date) - year(e.hire_date) >=4
and e.emp_no between 10500 and 10600
Window w as (Partition By e.emp_no order by s.salary desc) ;

-- Write a query that can extract the following information from the "employees" database:

-- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600
-- inclusive

-- a column showing the previous salary from the given ordered list

-- a column showing the subsequent salary from the given ordered list

-- a column displaying the difference between the current salary of a certain employee and their previous salary

-- a column displaying the difference between the next salary of a certain employee and their current salary

-- Limit the output to salary values higher than $80,000 only.

-- Also, to obtain a meaningful result, partition the data by employee number
select e.emp_no,
s.salary,
Lag(s.salary) over w as Previous_salary,
Lead(s.salary) over w as Next_salary,
s.salary - lag(s.salary) over w as diff_curr_Prev_salary,
lead(s.salary) over w - s.salary as diff_next_curr_salary
from employees e
join salaries s on 
s.emp_no = e.emp_no
where e.emp_no between 10500 and 10600
and s.salary > 80000
Window w as (Partition By e.emp_no order by s.salary) ;


-- The MySQL LAG() and LEAD() value window functions can have a second argument, designating how many rows/steps back
-- (for LAG()) or forth (for LEAD()) we'd like to refer to with respect to a given record.

-- With that in mind, create a query whose result set contains data arranged by the salary values associated to
-- each employee number (in ascending order). Let the output contain the following six columns:

-- the employee number

-- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)

-- the employee's previous salary

-- the employee's contract salary value preceding their previous salary

-- the employee's next salary

-- the employee's contract salary value subsequent to their next salary

-- Restrict the output to the first 1000 records you can obtain.

select e.emp_no,
s.salary,
lag(s.salary) over w as Previous_salary,
lag(s.salary,2) over w as before_prev_salary,
lead(s.salary) over w as Next_salary,
lead(s.salary,2) over w as After_next_salary
from employees e
join salaries s on 
s.emp_no = e.emp_no
Window w as (Partition by emp_no order by s.salary)
limit 1000;


-- Create a query that upon execution returns a result set containing the employee numbers, contract salary values,
-- start, and end dates of the first ever contracts that each employee signed for the company.

-- To obtain the desired output, refer to the data stored in the "salaries" table.
select s1.emp_no,
s.salary,
s.from_date,
s.to_date
from salaries s
join 
(select 
emp_no,min(from_date) as From_date
from salaries 
group by emp_no) as s1 on s1.emp_no = s.emp_no
where s.from_date = s1.from_date ;


-- Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated before
-- the 1st of January 2002 (as registered in the "dept_emp" table).

-- Create a MySQL query that will extract the following information about these employees:

-- Their employee number

-- The salary values of the latest contracts they have signed during the suggested time period

-- The department they have been working in (as specified in the latest contract they've signed during the suggested
-- time period)

-- Use a window function to create a fourth field containing the average salary paid in the department the employee
-- was last working in during the suggested time period. Name that field "average_salary_per_department".

-- Note1: This exercise is not related neither to the query you created nor to the output you obtained while solving
-- the exercises after the previous lecture.

-- Note2: Now we are asking you to practically create the same query as the one we worked on during the video lecture;
-- the only difference being to refer to contracts that have been valid within the period between the 1st of
-- January 2000 and the 1st of January 2002.

-- Note3: We invite you solve this task after assuming that the "to_date" values stored in the "salaries" and
-- "dept_emp" tables are greater than the "from_date" values stored in these same tables.
-- If you doubt that, you could include a couple of lines in your code to ensure that this is the case anyway!

-- Hint: If you've worked correctly, you should obtain an output containing 200 rows.
select de.emp_no, d.dept_name, s.salary, avg(s.salary) over 
w as average_salary_per_department
from 
(select de.emp_no);
-- (blank)


-- (__COMMON__TABLE__EXPRESSION__)

-- Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many
-- male employees have never signed a contract with a salary value higher than or equal to the all-time company
-- salary average.
with cte as (
select avg(salary) as avg_salary from salaries as s1)
select
sum(case when s.salary < s1.avg_salary then 1 else 0 end) as No_of_salaries_above_avg,
count(s.salary) as No_of_Salary_counts
from salaries s
join employees e on e.emp_no = s.emp_no
and e.gender = 'M'
Cross JOIN
cte s1;

-- Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of a query to
-- find out how many male employees have never signed a contract with a salary value higher than or equal to the
-- all-time company salary average.
with cte as (
select avg(salary) as avg_salary from salaries as s1)
select
count(case when s.salary < s1.avg_salary then s.salary else null end) no_of_salaries_below_avg_count,
count(s.salary) as No_of_salary_counts
from salaries s
join employees e on
s.emp_no = e.emp_no
and gender = 'M'
join cte s1 ;

-- Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have
-- never signed a contract with a salary value higher than or equal to the all-time company salary average
-- (i.e. to obtain the same result as in the previous exercise).
select
sum(case when s.salary < a.avg_salary then 1 
else 0
end) as no_of_salaries_below_avg_count,
count(s.salary) as no_of_salary_count
from (select avg(salary) as avg_salary 
from salaries s) a
join salaries s
join employees e on e.emp_no = s.emp_no
and gender = 'M';

-- Use a cross join in a query to find out how many male employees have never signed a contract with a salary value
-- higher than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous
-- exercise).
with cte as (
select avg(salary) as avg_salary from salaries s1)
select 
sum(case when s.salary < s1.avg_salary then 1 else 0 end ) as No_of_avg_salary_below_count,
count(s.salary) as No_of_salary_count
from salaries s
join employees e
on e.emp_no = s.emp_no
and gender = 'M' 
cross join cte s1 ;

-- (MULTIPLE__SUBCLAUSE)

-- Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number
-- of male employees whose highest salaries have been below the all-time average.
with cte1 as (
select avg(salary) as avg_salary from salaries ),
cte2 as (
select e.emp_no, max(s.salary)
as max_male_salary
from salaries s 
join employees e on
e.emp_no = s.emp_no
and gender = 'M'
group by s.emp_no)
select 
sum(case when c2.max_male_salary < c1.avg_salary then 1 else 0 end) as salary_count_below_avg
from employees e
join cte2 c2 on c2.emp_no = e.emp_no
join cte1 c1 ;

-- Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of
-- male employees whose highest salaries have been below the all-time average.
with cte1 as (
select avg(salary) as avg_salary from salaries ),
cte2 as (
select e.emp_no, max(s.salary)
as max_male_salary
from salaries s 
join employees e on
e.emp_no = s.emp_no
and gender = 'M'
group by s.emp_no)
select 
count(case when c2.max_male_salary < c1.avg_salary then c2.max_male_salary else null end) as salary_count_below_avg
from employees e
join cte2 c2 on c2.emp_no = e.emp_no
join cte1 c1 ;

-- Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the male
-- employees' highest salaries in a FROM clause, as opposed to in a join?

with cte1 as (
select avg(salary) as avg_salary from salaries ),
cte2 as (
select e.emp_no, max(s.salary)
as max_male_salary
from salaries s 
join employees e on
e.emp_no = s.emp_no
and gender = 'M'
group by s.emp_no)
select 
count(case when c2.max_male_salary < c1.avg_salary then c2.max_male_salary else null end) as salary_count_below_avg
from cte2 c2
join cte1 c1 ;

-- __(MySQL Temporary Tables in Action-Exercise)__

-- Exercise #1:
-- Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
Create Table male_max_salaries
select e.emp_no, max(s.salary)
from employees e
join salaries s on
e.emp_no = s.emp_no
and gender = 'M' 
group by e.emp_no ;

drop table if exists male_max_salaries ;

-- Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries
-- temporary table you created in the previous exercise.
select * from
male_max_salaries ;


-- __(Other Features of MySQL Temporary Tables-Exercise)__

-- Exercise #1:

-- Create a temporary table called dates containing the following three columns:

-- one displaying the current date and time,

-- another one displaying two months earlier than the current date and time, and a

-- third column displaying two years later than the current date and time.
Create Temporary Table Dates
select Now(),
Date_sub(Now(), Interval 2 month) as Two_months_earlier_from_current,
Date_sub(Now(), Interval -2 year) as Two_years_Later_from_current ;

drop table if exists dates ;
-- Exercise #2:

-- Write a query that, upon execution, allows you to check the result set contained in the dates temporary table
-- you created in the previous exercise.
select * from Dates d;

-- Exercise #3:

-- Create a query joining the result sets from the dates temporary table you created during the previous lecture
-- with a new Common Table Expression (CTE) containing the same columns. Let all columns in the result set appear
-- on the same row.
with cte as (select 
Now() as _current_date,
Date_sub(Now(), Interval 2 month) as cte_two_months_earlier,
Date_sub(Now(), Interval -2 year) as cte_two_years_later)
select * from dates d join cte c ;


-- Exercise #4:

-- Again, create a query joining the result sets from the dates temporary table you created during the previous
-- lecture with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets
-- vertically.
with cte as (select 
Now() as _current_date,
Date_sub(Now(), Interval 2 month) as cte_two_months_earlier,
Date_sub(Now(), Interval -2 year) as cte_two_years_later)
select * from dates d union all select * from cte c ;


-- Exercise #5:

-- Drop the male_max_salaries and dates temporary tables you recently created.
drop table if exists male_max_salaries, dates ;





