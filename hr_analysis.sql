-- ============================================================
--  HR & EMPLOYEE ANALYSIS — MySQL Project
--  Analyst: Daniel Aboagye Asibu
--  Date: April 2026
--  Tool: MySQL Workbench
-- ============================================================

-- ── STEP 1: CREATE DATABASE ──
CREATE DATABASE IF NOT EXISTS hr_analysis;
USE hr_analysis;

-- ── STEP 2: CREATE TABLES ──

CREATE TABLE IF NOT EXISTS departments (
    department_id   INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    location        VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id     INT PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    gender          VARCHAR(10) NOT NULL,
    age             INT NOT NULL,
    email           VARCHAR(100),
    phone           VARCHAR(20),
    hire_date       DATE NOT NULL,
    job_title       VARCHAR(50) NOT NULL,
    department_id   INT,
    salary          DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE IF NOT EXISTS performance (
    performance_id  INT PRIMARY KEY AUTO_INCREMENT,
    employee_id     INT,
    review_year     INT NOT NULL,
    rating          VARCHAR(20) NOT NULL,
    score           INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE IF NOT EXISTS attendance (
    attendance_id   INT PRIMARY KEY AUTO_INCREMENT,
    employee_id     INT,
    year            INT NOT NULL,
    days_present    INT NOT NULL,
    days_absent     INT NOT NULL,
    days_leave      INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ── STEP 3: INSERT DATA ──

INSERT INTO departments (department_name, location) VALUES
('Human Resources',  'Accra'),
('Finance',          'Accra'),
('Sales',            'Kumasi'),
('IT',               'Accra'),
('Operations',       'Takoradi'),
('Marketing',        'Accra');

INSERT INTO employees (first_name, last_name, gender, age, email, phone, hire_date, job_title, department_id, salary, status) VALUES
('Kwame',    'Mensah',    'Male',   35, 'kwame.mensah@company.com',    '0241234501', '2018-03-15', 'HR Manager',         1, 8500.00,  'Active'),
('Abena',    'Asante',    'Female', 29, 'abena.asante@company.com',    '0241234502', '2020-06-01', 'HR Officer',         1, 5200.00,  'Active'),
('Kofi',     'Boateng',   'Male',   42, 'kofi.boateng@company.com',    '0241234503', '2015-01-10', 'Finance Manager',    2, 9800.00,  'Active'),
('Akosua',   'Darko',     'Female', 31, 'akosua.darko@company.com',    '0241234504', '2019-09-23', 'Accountant',         2, 6400.00,  'Active'),
('Yaw',      'Owusu',     'Male',   38, 'yaw.owusu@company.com',       '0241234505', '2017-04-18', 'Sales Manager',      3, 9200.00,  'Active'),
('Ama',      'Sarpong',   'Female', 27, 'ama.sarpong@company.com',     '0241234506', '2021-02-14', 'Sales Executive',    3, 4800.00,  'Active'),
('Kweku',    'Aidoo',     'Male',   33, 'kweku.aidoo@company.com',     '0241234507', '2018-11-05', 'Sales Executive',    3, 5100.00,  'Active'),
('Efua',     'Appiah',    'Female', 36, 'efua.appiah@company.com',     '0241234508', '2016-07-22', 'IT Manager',         4, 10200.00, 'Active'),
('Nana',     'Osei',      'Male',   30, 'nana.osei@company.com',       '0241234509', '2020-03-08', 'Software Developer', 4, 7600.00,  'Active'),
('Adwoa',    'Frimpong',  'Female', 28, 'adwoa.frimpong@company.com',  '0241234510', '2021-08-19', 'IT Support',         4, 4500.00,  'Active'),
('Kojo',     'Antwi',     'Male',   45, 'kojo.antwi@company.com',      '0241234511', '2013-05-30', 'Operations Manager', 5, 10500.00, 'Active'),
('Akua',     'Bonsu',     'Female', 32, 'akua.bonsu@company.com',      '0241234512', '2019-01-17', 'Operations Officer', 5, 5900.00,  'Active'),
('Fiifi',    'Quaye',     'Male',   26, 'fiifi.quaye@company.com',     '0241234513', '2022-04-11', 'Operations Officer', 5, 4700.00,  'Active'),
('Maame',    'Agyeman',   'Female', 34, 'maame.agyeman@company.com',   '0241234514', '2017-10-03', 'Marketing Manager',  6, 8900.00,  'Active'),
('Kwabena',  'Asiedu',    'Male',   29, 'kwabena.asiedu@company.com',  '0241234515', '2021-06-25', 'Marketing Officer',  6, 5300.00,  'Active'),
('Afia',     'Barimah',   'Female', 31, 'afia.barimah@company.com',    '0241234516', '2020-12-01', 'Marketing Officer',  6, 5100.00,  'Active'),
('Yoofi',    'Mensah',    'Male',   40, 'yoofi.mensah@company.com',    '0241234517', '2016-02-14', 'Senior Accountant',  2, 7800.00,  'Active'),
('Abiba',    'Tanko',     'Female', 27, 'abiba.tanko@company.com',     '0241234518', '2022-09-05', 'Sales Executive',    3, 4600.00,  'Active'),
('Kwesi',    'Nyarko',    'Male',   37, 'kwesi.nyarko@company.com',    '0241234519', '2015-08-20', 'Senior Developer',   4, 9100.00,  'Active'),
('Naana',    'Ansah',     'Female', 43, 'naana.ansah@company.com',     '0241234520', '2012-03-12', 'Operations Manager', 5, 10800.00, 'Resigned');

INSERT INTO performance (employee_id, review_year, rating, score) VALUES
(1,  2024, 'Excellent',    92),
(2,  2024, 'Good',         78),
(3,  2024, 'Excellent',    95),
(4,  2024, 'Good',         80),
(5,  2024, 'Excellent',    90),
(6,  2024, 'Average',      65),
(7,  2024, 'Good',         75),
(8,  2024, 'Excellent',    97),
(9,  2024, 'Good',         82),
(10, 2024, 'Average',      60),
(11, 2024, 'Excellent',    93),
(12, 2024, 'Good',         77),
(13, 2024, 'Average',      62),
(14, 2024, 'Excellent',    91),
(15, 2024, 'Good',         74),
(16, 2024, 'Good',         76),
(17, 2024, 'Excellent',    89),
(18, 2024, 'Average',      63),
(19, 2024, 'Excellent',    94),
(20, 2024, 'Good',         79);

INSERT INTO attendance (employee_id, year, days_present, days_absent, days_leave) VALUES
(1,  2024, 245, 3,  12),
(2,  2024, 238, 8,  14),
(3,  2024, 250, 1,  9),
(4,  2024, 242, 5,  13),
(5,  2024, 248, 2,  10),
(6,  2024, 230, 12, 18),
(7,  2024, 240, 6,  14),
(8,  2024, 252, 0,  8),
(9,  2024, 244, 4,  12),
(10, 2024, 225, 15, 20),
(11, 2024, 249, 1,  10),
(12, 2024, 241, 5,  14),
(13, 2024, 228, 14, 18),
(14, 2024, 246, 3,  11),
(15, 2024, 239, 7,  14),
(16, 2024, 237, 8,  15),
(17, 2024, 247, 2,  11),
(18, 2024, 226, 13, 21),
(19, 2024, 251, 1,  8),
(20, 2024, 200, 20, 40);

-- ============================================================
--  STEP 4: DATA ANALYSIS QUERIES
-- ============================================================

-- ── Q1: View all employees ──
SELECT * FROM employees;

-- ── Q2: Total number of employees ──
SELECT COUNT(*) AS total_employees
FROM employees;

-- ── Q3: Active vs Resigned employees ──
SELECT 
    status,
    COUNT(*) AS total
FROM employees
GROUP BY status;

-- ── Q4: Employees by Department ──
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_employees DESC;

-- ── Q5: Employees by Gender ──
SELECT 
    gender,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees), 1) AS percentage
FROM employees
GROUP BY gender;

-- ── Q6: Total salary bill by Department ──
SELECT 
    d.department_name,
    COUNT(e.employee_id)        AS employees,
    SUM(e.salary)               AS total_salary,
    ROUND(AVG(e.salary), 2)     AS avg_salary,
    MAX(e.salary)               AS highest_salary,
    MIN(e.salary)               AS lowest_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC;

-- ── Q7: Top 5 highest paid employees ──
SELECT 
    CONCAT(first_name, ' ', last_name) AS employee_name,
    job_title,
    d.department_name,
    salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY salary DESC
LIMIT 5;

-- ── Q8: Employees hired each year ──
SELECT 
    YEAR(hire_date)     AS hire_year,
    COUNT(*)            AS employees_hired
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

-- ── Q9: Performance ratings summary ──
SELECT 
    rating,
    COUNT(*)                                                        AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM performance), 1) AS percentage
FROM performance
GROUP BY rating
ORDER BY total DESC;

-- ── Q10: Top performing employees ──
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    p.rating,
    p.score
FROM performance p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE p.rating = 'Excellent'
ORDER BY p.score DESC;

-- ── Q11: Average performance score by Department ──
SELECT 
    d.department_name,
    ROUND(AVG(p.score), 1)  AS avg_score,
    MAX(p.score)            AS highest_score,
    MIN(p.score)            AS lowest_score
FROM performance p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_score DESC;

-- ── Q12: Attendance summary by employee ──
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    a.days_present,
    a.days_absent,
    a.days_leave,
    ROUND(a.days_present * 100.0 / (a.days_present + a.days_absent + a.days_leave), 1) AS attendance_rate
FROM attendance a
JOIN employees e ON a.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY attendance_rate DESC;

-- ── Q13: Employees with most absences ──
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    a.days_absent
FROM attendance a
JOIN employees e ON a.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY a.days_absent DESC
LIMIT 5;

-- ── Q14: Full employee report (JOIN all tables) ──
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.gender,
    e.age,
    e.job_title,
    d.department_name,
    e.salary,
    e.status,
    p.rating                AS performance_rating,
    p.score                 AS performance_score,
    a.days_present,
    a.days_absent,
    ROUND(a.days_present * 100.0 / (a.days_present + a.days_absent + a.days_leave), 1) AS attendance_pct
FROM employees e
JOIN departments d   ON e.department_id   = d.department_id
JOIN performance p   ON e.employee_id     = p.employee_id
JOIN attendance  a   ON e.employee_id     = a.employee_id
ORDER BY e.employee_id;

-- ── Q15: Average salary by gender ──
SELECT 
    gender,
    COUNT(*)                    AS total_employees,
    ROUND(AVG(salary), 2)       AS avg_salary,
    SUM(salary)                 AS total_salary
FROM employees
GROUP BY gender;

-- ============================================================
-- END OF HR ANALYSIS PROJECT
-- Analyst: Daniel Aboagye Asibu | April 2026
-- ============================================================
