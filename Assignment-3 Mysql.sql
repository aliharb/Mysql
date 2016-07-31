-- Ali Harb
-- Assignment 3

-- create departments table  
CREATE TABLE IF NOT EXISTS departments(
dept_id varchar(10),
dept_title varchar(100),
PRIMARY KEY(dept_id)
);

INSERT INTO departments value('g1',"Informatiom Technology");
INSERT INTO departments value('g2',"Sales");
INSERT INTO departments value('g3',"Administartion");
INSERT INTO departments value('g4',"Operations");


select * from departments;

-- create employees table 
CREATE TABLE IF NOT EXISTS employees(
employee_id int NOT NULL,
dept_id varchar(10),
first_name varchar(25),
last_name varchar(25),
FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON UPDATE CASCADE ,
PRIMARY KEY (employee_id)
);


INSERT INTO employees value(123,'g1','Modesto',null);
INSERT INTO employees value(124,'g1','Ayine',null);
INSERT INTO employees value(125,'g2','Christopher',null);
INSERT INTO employees value(126,'g3','Saulat',null);
INSERT INTO employees value(127,'g2','Cheong','Woo');
INSERT INTO employees value(128,null,'Heidy',null);

select * from employees;

-- create facilities table
CREATE TABLE IF NOT EXISTS facilities(
room_id varchar(20),
PRIMARY KEY(room_id)
);

INSERT INTO facilities value("101");
INSERT INTO facilities value("102");
INSERT INTO facilities value("AA");
INSERT INTO facilities value("AB");

SELECT * FROM facilities;

-- create junction table 
CREATE TABLE IF NOT EXISTS Key_card(
room_id varchar(20),
dept_id varchar(20),
FOREIGN KEY(dept_id) REFERENCES departments(dept_id)  ON UPDATE CASCADE ,
FOREIGN KEY(room_id) REFERENCES facilities(room_id)  ON UPDATE CASCADE ,
PRIMARY KEY(room_id,dept_id)
);


INSERT INTO key_card value("101",'g1');
INSERT INTO key_card value("102",'g1');
INSERT INTO key_card value("102",'g2');
INSERT INTO key_card value("AA",'g2');

SELECT * FROM key_card;


-- Q1
SELECT employee_id, first_name, last_name, departments.dept_id, dept_title FROM employees
RIGHT JOIN departments
ON employees.dept_id=departments.dept_id 
UNION 
SELECT employee_id, first_name, last_name, departments.dept_id, dept_title FROM employees
LEFT JOIN departments
ON employees.dept_id=departments.dept_id;

-- Q2
SELECT facilities.room_id, key_card.dept_id FROM facilities 
LEFT JOIN key_card
ON key_card.room_id=facilities.room_id;

-- Q3
SELECT employee_id, first_name, last_name, employees.dept_id, key_card.room_id FROM employees  
RIGHT JOIN key_card
ON employees.dept_id=key_card.dept_id
ORDER BY first_name ASC,key_card.dept_id ASC,key_card.room_id ASC;



