-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
	FROM public.employees  inner join  public.salaries
on  employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, sex, hire_date
	FROM public.employees where 
	date_part('year', hire_date)=1986;

-- 3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, dept_name, employees.emp_no, last_name, first_name 
	FROM public.departments  inner join  public.dept_manager
	on  departments.dept_no = dept_manager.dept_no
	inner join public.employees on 
	public.dept_manager.emp_no =employees.emp_no
	and empl
;
-- 4.List the department of each employee with the following information: employee number,
--last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
	FROM public.employees  inner join  public.dept_employees
	on  employees.emp_no = dept_employees.emp_no
	inner join public.departments on 
	public.dept_employees.dept_no = departments.dept_no
;
-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
	FROM public.employees where 
	first_name = 'Hercules'
	and last_name like 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no,last_name,first_name, departments.dept_name 
	from public.employees left join public.dept_employees
	on employees.emp_no = dept_employees.emp_no
	left join public.departments
	on dept_employees.dept_no = departments.dept_no
	where departments.dept_name = 'Sales'; 

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
select employees.emp_no,last_name,first_name, departments.dept_name 
	from public.employees left join public.dept_employees
	on employees.emp_no = dept_employees.emp_no
	left join public.departments
	on dept_employees.dept_no = departments.dept_no
	where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
as "frequency_of_last_names"
from employees
group by last_name
order by "frequency_of_last_names" desc;
