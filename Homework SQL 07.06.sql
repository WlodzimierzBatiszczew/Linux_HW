use hr;

 select
 department_id,
 count(*) as employeescnt
from employees
group by department_id;  


 select 
 department_name t1,
 employeescnt t2
from departments t1 
inner join (
 select
 department_id,
 count(*) as employeescnt
from employees
group by department_id 
) t2 
on t1.department_id = t2.department_id;


select
 manager_id,
 count(*) as employeescnt
from employees
group by manager_id; 


SELECT 
t2.first_name AS manager_name,
t2.last_name AS manager_lastname, 
 COUNT(t1.employee_id) AS employeescnt
FROM employees t1
JOIN employees t2 
ON t1.manager_id = t2.employee_id
GROUP BY t2.first_name, t2.last_name;



     select 
 t2.department_id,
 t2.max_salary 
from employees t1 
inner join (
 select 
  department_id, 
  max(salary) as max_salary 
 from employees 
 where department_id is not null 
 group by department_id
) t2 
on t1.department_id = t2.department_id
and t1.salary = t2.max_salary;

     select 
 t1.first_name,
 t1.last_name 
from employees t1 
inner join (
 select 
  department_id, 
  max(salary) as max_salary 
 from employees 
 where department_id is not null 
 group by department_id
) t2 
on t1.department_id = t2.department_id
and t1.salary = t2.max_salary;

