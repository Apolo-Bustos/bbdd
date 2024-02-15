
/* A */
select *
from employees
where hire_date < '2003-05-01';

/* B */
select first_name, last_name, e.department_id,d.department_id, department_name 
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

/* C */
select first_name, last_name, e.job_id, j.job_id, job_title
from employees e
join jobs j
on e.job_id = j.job_id;

/* D */
select e.first_name, e.last_name, e.employee_id, em.first_name, em.last_name, em.manager_id
from employees e
join employees em
on e.employee_id = em.manager_id;

/* E */

/* G */ /* Display job ID, job title, number of employees, sum of salary and
difference between highest salary and lowest salary of employees
grouped by job ID. */
/* job_id | job_title | coun z employee | sum z salary | max highest ~ lowest */

select job_id, job_title, count(*)
(sum(salary)), (max(salary)-min(salary)
from employees e
inner join jobs j
on e.job_id = j.job_id
group by j.job_id



/* F */


/* N */ /* Display the number of employees per region. */ /* mas de 36 empleados */

select count(e.employee_id),r.region_name
from employees e
inner join departments d
on e.department_id = d.department_id

inner join locations l
on d.location_id = l.location_id

inner join countries c
on l.country_id = c.country_id

inner join regions r
on c.region_id = r.region_id

group by region_name
having count(e.employee_id) > 36





