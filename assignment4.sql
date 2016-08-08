/*
Please create an organization chart for a real or imagined organization, implemented in a single SQL table.
Your deliverable script should:
1. Create the table. Each row should minimally include the person’s name, the person’s supervisor, and the
person’s job title. Using ID columns is encouraged.
2. Populate the table with a few sample rows.
3. Provide a single SELECT statement that displays the information in the table,showing who reports to whom
Goal: An organizational chart for the ROBOTech

Hierarchy for "absLevelNum" Column:
1. CEO
2. VP Human Resources, VP Development
3. Recruiting Manager, Director Product manager, SW Dev Manager, Director QA
4. recruiter, Product Manager, SW Engineer,QA Engineer


									  CEO
		     __________________________|_____________________________
			|                                                        | 
		  VP HR                                                VP development
            |                              __________________________|________________________
	Recruiting Manager                    |                          |                        |
	        |                      Director Product Manager    SW Dev Manager             Direction QA 
	   Recruiter                          |                          |                        |
								   Pruduct Manager				 SW enginner	          QA Engineer
*/
DROP TABLE IF EXISTS ROBOTech;

CREATE TABLE IF NOT EXISTS ROBOTech
(
 Location varchar(30),
 Branch varchar(30),
 FirstName varchar(30),
 LastName varchar(30),
 jobTitle varchar(30),
 LevelNum int,
 Supervisor varchar(30),
 AbsLevelNum int
);

INSERT INTO ROBOTech
VALUES
('Brooklyn','Headquater','karam','Adil','CEO',1, null, null),
('Brooklyn','Headquater','Nazha','Bashar','VP Human Resources',2, 'CEO', 1),
('Brooklyn','Headquater','sarah','kamlai','VP Development',2,'CEO', 1),
('Brooklyn','Headquater','jesica','namae','Recruiting Manager',3,'VP Human Resources',2),
('Brooklyn','Headquater','Jack','Fredy','Director Product Manager',3,'VP Development',2),
('Brooklyn','Headquater','Tom','Jhonson','SW Dev Manager',3,'VP Development',2),
('Brooklyn','Headquater','Andy','Cheng','Director QA',3,'VP Development',2),
('Brooklyn','Headquater','Jamal','Samy','Recruiting',4,'Recruiting Manager',3),
('Brooklyn','Headquater','Jack','Fredy','Product Manager',4,'Director Product Manager',3),
('Brooklyn','Headquater','Clark','Zales','SW Manager',4,'SW Dev Managert',3),
('Brooklyn','Headquater','Abraham','Maki','QA Engineer',4,'Director QA',3);



SELECT FirstName, LastName, jobTitle,Supervisor 
FROM ROBOTech
ORDER BY absLevelNum