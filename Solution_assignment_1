/*---------------------------------------------------------------------- HR DATA --------------------------------------------------------------------------------------*/

/*----Question 1 ------*/
USE hr ;
SELECT first_name as "First Name", last_name as "Last Name" FROM employees ;

/*----Question 2 ------*/
SELECT distinct department_id from employees ;

/*----Question 3 ------*/
SELECT * FROM employees
order by first_name desc ;

/*----Question 4 ------*/
SELECT first_name, last_name, salary, (salary*(15/100)) as PF 
FROM employees ;

/*----Question 5 ------*/
SELECT employee_id, concat(first_name," ",last_name) as Name, salary
from employees
order by salary asc, employee_id asc ;

/*----Question 6 ------*/
SELECT sum(salary) from employees ;

/*----Question 7 ------*/
SELECT max(salary) as Maximum , min(salary) as Minimum  
from employees ;

/*----Question 8 ------*/
Select avg(salary), count(employee_id) from employees ;

/*----Question 9 ------*/
SELECT count(employee_id) FROM employees ;

/*----Question 10 ------*/
SELECT COUNT(DISTINCT job_id) 
FROM employees;

/*----Question 11 ------*/
SELECT upper(first_name) 
from employees ;

/*----Question 12 ------*/
SELECT left(first_name,3)
from employees ;

/*----Question 13 ------*/
SELECT first_name, trim(first_name) from employees ;

/*----Question 14 ------*/
SELECT concat(first_name,",",last_name), length(concat(first_name,",",last_name))
FROM employees ;

/*----Question 15 ------*/
SELECT * 
FROM employees 
WHERE  first_name REGEXP  '[0-9]';

/*----Question 16 ------*/
SELECT concat(first_name," ",last_name) AS Name, salary
FROM employees
WHERE salary <10000 OR salary >15000 ;

/*----Question 17 ------*/
SELECT concat(first_name," ",last_name),department_id
FROM employees
WHERE department_id = 30 OR department_id = 90
ORDER BY department_id ASC ;

/*----Question 18 ------*/
SELECT concat(first_name," ",last_name) AS Name, salary, department_id
FROM employees
WHERE (salary <10000 OR salary >15000) AND (department_id = 30 OR department_id = 90) ;

/*----Question 19 ------*/
SELECT concat(first_name," ",last_name) AS Name, hire_date
FROM employees
WHERE hire_date LIKE '1987%' ;

/*----Question 20 ------*/
SELECT first_name FROM employees 
WHERE first_name LIKE '%B%'
AND first_name LIKE '%c%' ;

/*----Question 21 ------*/
SELECT last_name, salary, job_id
FROM employees 
WHERE job_id LIKE 'IT_P%' OR job_id LIKE 'sh_cl%' 
AND salary NOT IN ('4500','10000','15000') ;

/*----Question 22 ------*/
SELECT last_name, length(last_name)
FROM employees
WHERE length(last_name) = 6 ;

/*----Question 23 ------*/
SELECT last_name,substring(last_name,3,1)
FROM employees 
WHERE substring(last_name,3,1) = 'e' ;

/*----Question 24 ------*/
SELECT  job_id, group_concat(employee_id)
FROM employees 
GROUP BY job_id ;

/*----Question 25 ------*/
UPDATE employees 
SET phone_number = REPLACE(phone_number, '124', '999') 
WHERE phone_number LIKE '%124%';

/*----Question 26 ------*/
SELECT * FROM employees
WHERE length(first_name) >= 8 ;

/*----Question 27 ------*/
UPDATE employees SET email = CONCAT(email, '@example.com');

/*----Question 28 ------*/
SELECT phone_number, RIGHT(phone_number,4)
FROM employees ;

/*----Question 29 ------*/
SELECT street_address, RIGHT(street_address,1)
FROM locations ;

/*----Question 30 ------*/
SELECT * FROM locations
WHERE LENGTH(street_address) = (SELECT  MIN(LENGTH(street_address)) 
FROM locations);


/*----Question 31 ------*/
SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1)
FROM jobs;

/*----Question 32 ------*/
SELECT first_name, last_name 
FROM employees
WHERE INSTR(last_name,'C') > 2;

/*----Question 33 ------*/
SELECT first_name AS Name, LENGTH(first_name) AS Length
FROM employees
WHERE first_name LIKE 'a%' 
OR first_name LIKE 'j%' 
OR first_name LIKE 'M%'
ORDER BY first_name ;

/*----Question 34 ------*/
SELECT first_name,
LPAD(salary, 10, '$') SALARY
FROM employees;

/*----Question 35 ------*/
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000)) 
'SALARY($)', salary
FROM employees
ORDER BY salary DESC;

/*----Question 36 ------*/
SELECT job_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%-%-07' OR hire_date LIKE '%-07-%'
ORDER BY hire_date ;

/*------------------------------------------------------------------ Northwind Data ------------------------------------------------------------------------------------*/

/*------------- Question 01 ------------*/
USE northwind ;

SELECT ProductName, QuantityPerUnit
FROM products ;

/*------------- Question 02 ------------*/
SELECT Productid, ProductName
FROM products
WHERE Discontinued = 0 ;

/*------------- Question 03 ------------*/
SELECT Productid, ProductName
FROM products
WHERE Discontinued = 1 ;

/*------------- Question 04 ------------*/
SELECT ProductName, Unitprice 
FROM products
ORDER BY Unitprice DESC ;

/*------------- Question 05 ------------*/
SELECT Productid, Productname, Unitprice
FROM products
WHERE (Discontinued = 0) AND (Unitprice < 20.0000)
ORDER BY Unitprice DESC ;

/*------------- Question 06 ------------*/
SELECT Productid, Productname, Unitprice
FROM Products
WHERE ((Unitprice)>15) AND ((Unitprice)<25) 
ORDER BY Unitprice ASC ;

/*------------- Question 07 ------------*/
SELECT Productname, Unitprice
FROM Products
WHERE ((Unitprice) >(SELECT avg(Unitprice)
FROM Products))
ORDER BY Unitprice DESC ; 

/*------------- Question 08 ------------*/
SELECT Productname, Unitprice
FROM Products
ORDER BY Unitprice DESC
LIMIT 10 ;

/*------------- Question 09 ------------*/
SELECT COUNT(Productname)
from products 
group by discontinued ;

/*------------- Question 10 ------------*/
SELECT Productname, Unitsinstock, Unitsonorder
FROM Products
WHERE (unitsinstock) < (unitsonorder) ;


