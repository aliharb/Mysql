
-- Final Project
-- 8/9/2016 


-- Part 1

/*
	Using MySQL Workbench, create a new database called BuildingEnergy. All of the work below should be
	completed in the BuildingEnergy database. The SQL script should be self-contained, such that if it runs again it
	will re-create the database.
*/

DROP DATABASE IF EXISTS BuildingEnergy;          -- Drop database 
CREATE DATABASE BuildingEnergy;                  -- Re-create database           
USE BuildingEnergy; 							 -- use the current database

-- Note: 
/*
if mysql didnt drop the tables, then uncomment the 
following script to drop the tables 
*/

/*
DROP TABLE IF EXISTS buildingEngType;
DROP TABLE IF EXISTS buildings;
DROP TABLE IF EXISTS energyType;
DROP TABLE IF EXISTS energyCategories;
*/

-- part 2 

-- create the the EnergyCategories table with category id for each categories
CREATE TABLE energyCategories 
(
  categoryId SMALLINT, 
  categories varchar(50),
  PRIMARY KEY(categoryId)
);

-- Populate the EnergyCategories table 
INSERT INTO energyCategories  value(1,'Fossil');
INSERT INTO energyCategories  value(2,'Renewable');


-- create the the  EnergyTypes table with category id for each energy type
CREATE TABLE energyType
(
  Etype varchar(30),
  categoryId SMALLINT,
  CONSTRAINT `$`  FOREIGN KEY(categoryId) REFERENCES energyCategories(categoryId) 
  ON UPDATE CASCADE ON DELETE RESTRICT,
  PRIMARY KEY(Etype)
  
);

-- Populate the Energy Type table
 INSERT INTO energyType value('Gas',1);
 INSERT INTO energyType value('Steam',1);
 INSERT INTO energyType value('Electricity',1);
 INSERT INTO energyType value('Fuel oil',1);
 INSERT INTO energyType value('Wind',2);
 INSERT INTO energyType value('Solar',2);
 
-- Part 3 

-- Write a JOIN statement that shows the energy categories and associated energy types that you entered
SELECT categories, Etype FROM energyCategories   
Left JOIN energytype
ON energyCategories.categoryId=energytype.categoryId
ORDER BY Etype;

-- Part 4

-- create a Buildings table that have building names 
CREATE TABLE buildings
(
  buildingName varchar(100),
  PRIMARY KEY(buildingName)
);

-- Populate the Buildings table
 INSERT INTO buildings value('Borough of Manhattan Community College');
 INSERT INTO buildings value('Chrysler Building');
 INSERT INTO buildings value('Empire State Building');



-- create the junction table between buildings and energy type
CREATE TABLE buildingEngType
(
  buildingName varchar(100),
  Etype varchar(20),
  CONSTRAINT `#` FOREIGN KEY(buildingName) REFERENCES buildings(buildingName)  ON UPDATE CASCADE ,
  CONSTRAINT `&` FOREIGN KEY(Etype) REFERENCES energyType(Etype)  ON UPDATE CASCADE ,
  PRIMARY KEY(buildingName,Etype)
);

-- populate the junction table 
 INSERT INTO buildingEngType value('Borough of Manhattan Community College','Electricity');
 INSERT INTO buildingEngType value('Borough of Manhattan Community College','Steam');
 INSERT INTO buildingEngType value('Borough of Manhattan Community College','Solar');
 INSERT INTO buildingEngType value('Empire State Building','Electricity');
 INSERT INTO buildingEngType value('Empire State Building','Gas');
 INSERT INTO buildingEngType value('Empire State Building','Steam');
 INSERT INTO buildingEngType value('Chrysler Building','Electricity');
 INSERT INTO buildingEngType value('Chrysler Building','Steam');

-- Part 5

-- Write a JOIN statement that shows the buildings and associated energy types for each building
SELECT buildings.buildingName,energytype.Etype FROM buildings 
INNER JOIN buildingEngType
ON buildings.buildingName=buildingEngType.buildingName
INNER JOIN energytype
ON energytype.Etype=buildingEngType.Etype
ORDER BY buildings.buildingName,energytype.Etype;

-- Part 6

-- Please add this information to the BuildingEnergy database, inserting rows as needed in various tables
-- Building: Bronx Lion House; Energy Types: Geothermal
-- Brooklyn Childrens Museum: Energy Types: Electricity, Geothermal

-- add the new type og energy to energy type table
 INSERT INTO energyType value('Geothermal',2);
 
 -- add the two new buildings to the buildings table
 INSERT INTO buildings value('Bronx Lion House');
 INSERT INTO buildings value('Brooklyn Childrens Museum');
 
-- add the energy types to the new buildings   
 INSERT INTO buildingEngType value('Bronx Lion House','Geothermal');
 INSERT INTO buildingEngType value('Brooklyn Childrens Museum','Electricity');
 INSERT INTO buildingEngType value('Brooklyn Childrens Museum','Geothermal');
 
-- Part 7
-- Write a SQL query that displays all of the buildings that use Renewable Energies.

SELECT buildings.buildingName,energytype.Etype, Categories FROM buildings 
INNER JOIN buildingEngType
ON buildings.buildingName=buildingEngType.buildingName
INNER JOIN energytype 
ON energytype.Etype=buildingEngType.Etype
INNER join energyCategories 
ON energyCategories.categoryId=energytype.categoryId
where energytype.Etype in
(
SELECT energytype.Etype FROM energyCategories   
Left JOIN energytype
ON energyCategories.categoryId=energytype.categoryId
WHERE energyCategories.categoryId != 1
);


SELECT buildings.buildingName, energytype.Etype, energycategories.Categories FROM energycategories
LEFT JOIN energytype
ON energycategories.categoryId=energytype.categoryId
RIGHT JOIN buildingEngType
ON  energytype.Etype=buildingEngType.Etype
LEFT JOIN buildings
ON buildings.buildingName=buildingEngType.buildingName
WHERE energyCategories.categoryId != 1;

-- Part 8
-- Write a SQL query that shows the frequency with which energy types are used in various buildings

SELECT energytype.Etype, Count(*) FROM buildings
LEFT JOIN buildingEngType
ON buildings.buildingName=buildingEngType.buildingName
LEFT JOIN energytype
ON energytype.Etype=buildingEngType.Etype
GROUP BY energytype.Etype
ORDER BY COUNT(*) DESC;

-- Part 9
-- Do one (or more if you want!) of the following. 9(c) and 9(d) are both challenging
-- you are especially encouraged to work on in a group if you tackle one or both of these exercises!

-- a) Create the appropriate foreign key constraints.
-- ans: I Added Contraints on the forein keys located at line 94,95,51 
-- b) Create an entity relationship (ER) diagram for the tables in the database. You can sketch this by hand and include a photo or scan if you wish.
-- The included in github
/*

 
















