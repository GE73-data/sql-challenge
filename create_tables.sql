--Create table for departments
create table departments(
	dept_no varchar primary key not null,
	dept_name varchar not null
);

select * from departments;

--Create table for dept employees
create table dept_employees(
	emp_no int,
	dept_no varchar not null, 
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

select * from dept_employees;

--Create table for dept manager
create table dept_manager(
	dept_no varchar not null,
	emp_no int,
	foreign key (dept_no)references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

select * from dept_manager;

--Create table for employees
create table employees(
	emp_no int,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
);

select * from dept_manager;

--Create table for salaries
create table salaries(
	emp_no int not null,
	salary int,
	foreign key (emp_no) references employees(emp_no)
);

select * from salaries;

--Create table for titles
create table titles(
	title_id varchar not null,
	title varchar not null
);

select * from titles
