# Pewlett-Hackard-Analysis

## Overview of the Analysis
### Employee Research
In this analysis I assisted Bobby, an up and coming HR Analyst at Pewlett-Hackard, who has been tasked with employee research. He currently is researching the answers to two questions:
    - Who will be retiring in the next few years?
    - How many positions will Pewlett-Hackard need to fill?
Pewlett-Hackard historically has used Excel and VBA, so all data is currently housed in six CSV files. They have decided for this project to use SQL. I have been tasked with helping Bobby build an employee database using SQL.

## Results
### Retiring Titles and Mentorship Eligibility
- Created a titles table for employees who were within the retirement age range.
- Created a unique titles table to remove duplicate rows.
- Retrieved the number of employees by their most recent job title who are about to retire.
- Created a mentorship-eligibility table for current employees that are within the retirement age range.

## Summary
#### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The analysis of the number of employees who are within the retirement age range indicates that there could be up to 41,380 roles that will need to be filled. 

# Insert CountTitles

#### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
There are two departments that potentially do not have enough retirement-ready employees to mentor the next generation of Pewlett-Hackard employees, Technique Leader and Assitant Engineer.

# Insert CountMETitles

#### Additional Query/Table 1
    - Count by Title of Mentorship Eligible employees
        - SELECT COUNT(emp_no), title
          INTO mentorship_titles
          FROM mentorship_elegibility
          GROUP BY title
          ORDER BY COUNT DESC;

#### Additional Query/Table 2
    - Current Salaries of potentially retiring employees
        - SELECT rt.emp_no,
            rt.first_name,
            rt.last_name,
            rt.title,
            s.salary
          INTO retiring_salaries
          FROM retirement_titles AS rt
          INNER JOIN salaries AS s
            ON (rt.emp_no = s.emp_no)
          ORDER BY rt.emp_no, s.salary DESC;