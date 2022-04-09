
-- Challenge Deliverable 1

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
	   
SELECT * FROM unique_titles;

SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY (ut.title)
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2
-- Ceate a mentorship-eligibility table that holds the current employees 
-- who were born between January 1, 1965 and December 31, 1965

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty;

-- Extra Table 1
SELECT COUNT (me.title), me.title
INTO mentorship_titles
FROM mentorship_eligibilty as me
GROUP BY (me.title)
ORDER BY count DESC;

SELECT * FROM mentorship_titles;

--Extra Table 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty_expanded
FROM employees as e
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1960-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Extra Table 3
SELECT COUNT (mee.title), mee.title
INTO mentorship_titles_expanded
FROM mentorship_eligibilty_expanded as mee
GROUP BY (mee.title)
ORDER BY count DESC;

SELECT * FROM mentorship_titles_expanded;
	   