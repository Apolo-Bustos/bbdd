
/* A */
select *
from departments;

/* B */
select *
from jobs;

/* C */
select *
from employees;

/* D */
select first_name, last_name, salary
from employees;

/* E */
select email, phone_number
from employees;

/* F */ 
select first_name, last_name, salary
from employees
where salary > 5000 
order by salary desc; 

/* G */
select first_name, last_name, department_id
from employees
where department_id = 80
order by first_name, last_name desc;

/* H */
select first_name, last_name, department_id, salary
from employees
where department_id = 80 
and salary > 5000
order by first_name, last_name desc;

/* I */
select department_name
from departments
order by department_name;

/* J */
select department_name, location_id
from departments
where location_id = 1700
order by department_name;

/* K */
select  job_title
from jobs
order by job_title;

/* L */
select job_title, min_salary
from jobs
where min_salary > 5000
order by min_salary;

/* M */
select first_name, last_name, department_id, salary
from employees
where department_id = 80 and salary > 2000
order by first_name, last_name; 

/* N */
select first_name, last_name, department_id, department_name
from employees e
inner join departments d
on employees.department_id = departments.department_name;

/* O */

select d.department_id,count(r.region_name)
from departments d
inner join locations l on d.location_id = l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id
group by r.region_name;


/* N left join */

/*select e.first_name
from employees e
left join departments d
on e.departmennt_id = d.department_id


/* ejemplo */ 

/* select count(*) department_name
from employees e
inner join department d
on e.department_id = d.department_id
group by department_name


/* empleados ID salario por encima del salario medio */

/*select e.employee_id, e.salary, j.max_salary
from employees e
inner join jobs j
on e.job_id = j.job_id
avg e.salary */

/*
select employee_id
from employees e
inner join jobs j
on e.job_id = j.job_id
and e.salary > ((max_salary + min_salary)/2)

inner join department d 
on e.department_id = d.department_id
*/

/* test1 */ 
select d.department_id, m.first_name as "manager", b.first_name as "jefe"
from departments d
inner join employees x on d.manager_id = x.manager_id
inner join employees m on x.employee_id = m.employee_id
inner join employees b on m.manager_id = b.employee_id ;


/* test2 */ 
select d.department_id, m.first_name as "manager", b.first_name as "jefe"
from departments d
inner join employees m on d.manager_id = m.employee_id
inner join employees b on m.manager_id = b.employee_id;

/* test3 */
/* consulta que de el empleado 
con la fecha de contratacion mas antiguo*/

select  e.first_name, j.start_date 
from employees e
inner join job_history j on e.employee_id = j.employee_id

;
/* test4 */
select job_id, employee_id, min(hire_date)
from employees 
group by job_id, employee_id having min(hire_date);





/* 5.5 GBD */

/* D */ 

select cust_first_name, order_id, order_total
from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_total = null or 0;

/* select */
select cust_first_name,
(select distinct order_id, order_id)
from customers c
inner join orders o on c.customer_id = o.customer_id
;

/* D */
select *
from customers c
inner join orders o on c.customer_id = o.customer_id;

/* O */

select o.order_id, o.order_total
from orders o
inner join order_items i on o.order_id = i.customer_id


;


/* resp */ /* sub select */
SELECT o.order_id, o.order_total, SUM(i.unit_price * i.quantity) total
FROM orders o, order_items i
WHERE i.order_id = o.order_id
GROUP BY o.order_id, o.order_total
HAVING o.order_total != total;

/*
clausula limit
*/

/*
sacar los 5 empleados mas antiguos
*/

/* test5 */
select e.job_id, e.employee_id, hire_date
from employees e
where hire_date < all
	(select hire_date
	from employees m
	where e.employee_id <> m.employee_id
	and e.job_id = m.job_id)
    limit 5;

select * 
from employees
order by hire_date
limit 5;

/*
años de antiguedad > 15 años | apellido ,nombre / años antiguedad / >15
*/
select concat(last_name,',',first_name) as employee,
year(hire_date) as antiguedad
from employees
where year(hire_date)<(year(now())-15)
order by antiguedad asc;

select concat(last_name,',',first_name) as employee,
year(hire_date) as antiguedad
from employees
where year(hire_date)<(year(now())-15)
order by antiguedad asc;

/* gpt 1 */
SELECT CONCAT(first_name, ',', last_name) AS empleado, hire_date AS antiguedad
FROM employees
WHERE hire_date <= DATE_SUB(CURDATE(), INTERVAL 15 YEAR)
order by hire_date asc;

/* gpt 2 */
SELECT CONCAT(first_name, ' ', last_name) AS empleado, 
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS antiguedad_en_anos
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 15
order by hire_date asc;

/* 5.5 */
/* B */
select concat(cust_first_name,',', cust_last_name) as fullname,
timestampdiff(year, date_of_birth, curdate()) as edad,
date_of_birth as FDN, gender
from customers
order by date_of_birth 
;

/* h */
select length(translated_description), translated_description
from product_descriptions
where length(translated_description)  > 500


;

/* locations / countries */
/* street address / country name */
select null as location_id
from locations
union
select country_name 
from countries
;

/* 5.5 */
/* C */ 
select concat(c.cust_first_name,' ',c.cust_last_name) as customer,
concat(em.first_name,' ',em.last_name) as manager
/*em.manager_id as manager2*/
from customers c
inner join employees e on c.account_mgr_id = e.manager_id
inner join employees em on e.manager_id = em.employee_id
;

/* Cr */
SELECT CONCAT(cust_first_name,' ', cust_last_name) cust_complete_name,
CONCAT(first_name,' ', last_name) mgr_comple_name
FROM employees, customers
WHERE employee_id = account_mgr_id;

/* D */ 
select concat(cust_first_name,' ',cust_last_name) as customer,
o.customer_id as orders
from customers c
left join orders o on c.customer_id = o.customer_id
where o.customer_id is null
;

/* gpt */ 
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

/* E */
select concat(c.cust_first_name,' ',c.cust_last_name) as customer,
count(c.customer_id) as orders
from customers c
inner join orders o on c.customer_id = o.customer_id
group by c.customer_id
having count(c.customer_id) > 4
order by  customer;








