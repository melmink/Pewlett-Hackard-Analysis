-- Deliverable 1: The Number of Retiring Employees by Title
-- Create a titles table for employees who are within retirement age range
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM retirement_info AS ri
INNER JOIN titles AS ti
	ON (ri.emp_no = ti.emp_no)
INNER JOIN employees AS e
	ON (ri.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ri.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title 
-- who are about to retire
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- Create a mentorship-eligibility table for current employees that 
-- are within retirement age range

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_elegibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;