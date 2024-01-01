use employees;
show tables;

select * from departments;

select * from dept_emp;

select * from employees;

select * from salaries;

select * from titles;





-- Select the information from the “dept_no” column of the “departments” table(select)


-- Select all data from the “departments” table.(from)


-- Select all people from the “employees” table whose first name is “Elvis”.(where)


-- Retrieve a list with all female employees whose first name is Kellie.(and)


-- Retrieve a list with all employees whose first name is either Kellie or Aruna.(Or)


-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.(and,or)


-- Use the IN operator to select all individuals from the “employees” table, 
-- whose first name is either “Denis”, or “Elvis”.


-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.


-- select the data about all individuals, whose first name starts with “Mark”; 
-- specify that the name can be succeeded by any sequence of characters


-- Retrieve a list with all employees who have been hired in the year 2000


-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.


-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.


-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”.


-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.



-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.


-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.


-- Select the names of all departments whose department number value is not null.




-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.





-- Extract a list with all employees’ salaries higher than $150,000 per annum.




-- Obtain a list with all different “hire dates” from the “employees” table.




-- How many annual contracts with a value higher than or equal to $100,000 have been registered
-- in the salaries table?




-- How many managers do we have in the “employees” database?
-- Use the star symbol (*) in your code to solve this exercise.




-- Select all data from the “employees” table, ordering it by “hire date” in descending order.





-- Write a query that obtains two columns. The first column must contain annual salaries
-- higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, 
-- must show the number of employees contracted to that salary. Lastly, sort the output by the first column.





-- Select all employees whose average salary is higher than $120,000 per annum.



-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.



-- Select the first 100 rows from the ‘dept_emp’ table. 



-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.



-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?



-- 1. Which is the lowest employee number in the database?



-- 2. Which is the highest employee number in the database?



-- What is the average annual salary paid to employees who started after the 1st of January 1997?alter





-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997
-- to a precision of cents.





-- Extract a list containing information about all managers’ employee number, first and last name, 
-- department number, and hire date. 





-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees 
-- whose last name is Markovitch. See if the output contains a manager with that name.  







-- Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’,
-- ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

-- Extract a list containing information about all managers’ employee number, first and last name, department number,
-- and hire date. Use the old type of join syntax to obtain the result.






-- new




-- prevent error code


-- Select the first and last name, the hire date, and the job title of all employees whose first name is
-- “Margareta” and have the last name “Markovitch”.






-- cross join example






-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table
-- and department number 9.







-- Return a list with the first 10 employees with all the departments they can be assigned to.








-- Select all managers’ first and last name, hire date, job title, start date, and department name.









-- How many male and how many female managers do we have in the ‘employees’ database?








-- Extract the information about all department managers who were hired between the 1st of January 1990 and the
-- 1st of January 1995.







                    
-- Select the entire information for all employees whose job title is “Assistant Engineer”. 






                

-- Create a view that will extract the average salary of all managers registered in the database.
-- Round this value to the nearest cent.








-- Stored Procedures












-- Create a procedure that will provide the average salary of all employees.











-- stored procedures with an input parameter







-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, 
-- and returns their employee number.








-- Similar to the exercises done in the lecture, obtain a result set containing the employee number,
-- first name, and last name of all employees with a number higher than 109990.
-- Create a fourth column in the query, indicating whether this employee is also a manager,
-- according to the data provided in the dept_manager table, or a regular employee. 









-- Extract a dataset containing the following information about the managers: employee number,
-- first name, and last name. Add two columns at the end – one showing the difference between 
-- the maximum and minimum salary of that employee, and another one saying whether this salary raise
-- was higher than $30,000 or NOT. (If possible, provide more than one solution.)









-- Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
-- called “current_employee” saying “Is still employed” if the employee is still working in the company, or
-- “Not an employee anymore” if they aren’t.
-- Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.








-- SQL Window Functions
-- 1. Row_number
-- Write a query that upon execution, assigns a row number to all managers we have information for in the "employees"
-- database (regardless of their department).
-- Let the numbering disregard the department the managers have worked in. Also, let it start from the value of
-- 1. Assign that value to the manager with the lowest employee number.






-- Write a query that upon execution, assigns a sequential number for each employee number registered in the
-- "employees" table. Partition the data by the employee's first name and order it by their last name in
-- ascending order (for each partition).





-- Obtain a result set containing the salary values each manager has signed a contract for.
-- To obtain the data, refer to the "employees" database.
-- Use window functions to add the following two columns to the final output:

-- a column containing the row number of each row from the obtained dataset, starting from 1.
-- a column containing the sequential row numbers associated to the rows for each manager,
-- where their highest salary has been given a number equal to the number of rows in the given partition,
-- and their lowest - the number 1.
-- Finally, while presenting the output, make sure that the data has been ordered by the values in the
-- first of the row number columns, and then by the salary values for each partition in ascending order.







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








-- Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output,
-- use a subquery containing a window function, as well as a window specification introduced with the help of the
-- WINDOW keyword.

-- Also, to obtain the desired result set, refer only to data from the “salaries” table.










-- Again, find out the lowest salary value each employee has ever signed a contract for. Once again,
-- to obtain the desired output, use a subquery containing a window function. This time, however,
-- introduce the window specification in the field list of the given subquery.

-- To obtain the desired result set, refer only to data from the “salaries” table.










-- Once again, find out the lowest salary value each employee has ever signed a contract for. This time,
-- to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.

-- To obtain the desired result set, refer only to data from the “salaries” table.










-- Once more, find out the lowest salary value each employee has ever signed a contract for. To obtain
-- the desired output, use a subquery containing a window function, as well as a window specification
-- introduced with the help of the WINDOW keyword. Moreover, obtain the output without using a
-- GROUP BY clause in the outer query.

-- To obtain the desired result set, refer only to data from the “salaries” table.











-- Find out the second-lowest salary value each employee has ever signed a contract for.
-- To obtain the desired output, use a subquery containing a window function, as well as a window
-- specification introduced with the help of the WINDOW keyword. Moreover,
-- obtain the desired result set without using a GROUP BY clause in the outer query.

-- To obtain the desired result set, refer only to data from the “salaries” table.









-- Write a query containing a window function to obtain all salary values that employee number 10560 has
-- ever signed a contract for.

-- Order and display the obtained salary values from highest to lowest.







-- Write a query that upon execution, displays the number of salary contracts that each manager has
-- ever signed while working in the company.








-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560
-- has ever signed a contract for. Use a window function to rank all salary values from highest to lowest
-- in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent
-- rows are allowed.







-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has
-- ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that
-- equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.







-- Write a query that ranks the salary values in descending order of all contracts signed by employees numbered
-- between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank.
-- Also, allow gaps in the ranks obtained for their subsequent rows.

-- Use a join on the “employees” and “salaries” tables to obtain the desired result.













-- Write a query that ranks the salary values in descending order of the following contracts from the "employees"
-- database:
-- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.

-- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the 
-- company for the first time.

-- In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks
-- obtained for their subsequent rows.

-- Use a join on the “employees” and “salaries” tables to obtain the desired result.

















-- Write a query that can extract the following information from the "employees" database:

-- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600
-- inclusive

-- a column showing the previous salary from the given ordered list

-- a column showing the subsequent salary from the given ordered list

-- a column displaying the difference between the current salary of a certain employee and their previous salary

-- a column displaying the difference between the next salary of a certain employee and their current salary

-- Limit the output to salary values higher than $80,000 only.

-- Also, to obtain a meaningful result, partition the data by employee number

















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















-- Create a query that upon execution returns a result set containing the employee numbers, contract salary values,
-- start, and end dates of the first ever contracts that each employee signed for the company.

-- To obtain the desired output, refer to the data stored in the "salaries" table.














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







-- (__COMMON__TABLE__EXPRESSION__)

-- Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many
-- male employees have never signed a contract with a salary value higher than or equal to the all-time company
-- salary average.













-- Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of a query to
-- find out how many male employees have never signed a contract with a salary value higher than or equal to the
-- all-time company salary average.













-- Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have
-- never signed a contract with a salary value higher than or equal to the all-time company salary average
-- (i.e. to obtain the same result as in the previous exercise).















-- Use a cross join in a query to find out how many male employees have never signed a contract with a salary value
-- higher than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous
-- exercise).















-- (MULTIPLE__SUBCLAUSE)

-- Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number
-- of male employees whose highest salaries have been below the all-time average.

















-- Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of
-- male employees whose highest salaries have been below the all-time average.















-- Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the male
-- employees' highest salaries in a FROM clause, as opposed to in a join?














-- __(MySQL Temporary Tables in Action-Exercise)__

-- Exercise #1:
-- Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.






-- Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries
-- temporary table you created in the previous exercise.





-- __(Other Features of MySQL Temporary Tables-Exercise)__

-- Exercise #1:

-- Create a temporary table called dates containing the following three columns:

-- one displaying the current date and time,

-- another one displaying two months earlier than the current date and time, and a

-- third column displaying two years later than the current date and time.






-- Exercise #2:

-- Write a query that, upon execution, allows you to check the result set contained in the dates temporary table
-- you created in the previous exercise.


-- Exercise #3:

-- Create a query joining the result sets from the dates temporary table you created during the previous lecture
-- with a new Common Table Expression (CTE) containing the same columns. Let all columns in the result set appear
-- on the same row.








-- Exercise #4:

-- Again, create a query joining the result sets from the dates temporary table you created during the previous
-- lecture with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets
-- vertically.







-- Exercise #5:

-- Drop the male_max_salaries and dates temporary tables you recently created.






