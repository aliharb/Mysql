-- drop the tables 
DROP TABLE viewers;
DROP TABLE videos;

-- create the video table with four feilds
CREATE TABLE videos (
     id int NOT NULL,
	 title varchar(30) NOT NULL,
     length float,
     url varchar(300),
     PRIMARY KEY (id)
);

-- insert contenet to the video table
INSERT INTO videos values(1,'Missing Data',4.43,'https://www.youtube.com/watch?v=KLugfNdGNFw');
INSERT INTO videos values(2,'Joining Table',5.39,'https://www.youtube.com/watch?v=79EBoVPUzkE&feature=youtu.be');
INSERT INTO videos values(3,'Aggregation',6.16,'https://www.youtube.com/watch?v=ZjuL-pfkUOA');
INSERT INTO videos values(4,'Sorting',3.5,'https://www.youtube.com/watch?v=rNwwdijxxKs');
INSERT INTO videos values(5,'create',2.6,'https://www.youtube.com/watch?v=rNwwdijxxKs');

-- create the viewers table with four feilds
CREATE TABLE viewers (
	 video_id int,
     users varchar(10) NOT NULL,
	 rate int DEFAULT NULL,
     review varchar(100),
     FOREIGN KEY (video_id) 
	 REFERENCES videos(id)
	 ON UPDATE CASCADE ON DELETE CASCADE
); 

-- insert the contents to viewers table
INSERT INTO viewers values(1,'zara',4,'good');
INSERT INTO viewers values(1,'anis',3,'like it');
INSERT INTO viewers values(2,'amina,',1,'unclear');
INSERT INTO viewers values(3,'mike',5,'best');
INSERT INTO viewers values(3,'yuwn',NULL,'no comment');
INSERT INTO viewers values(3,'sarah',5,'very useful');
INSERT INTO viewers values(4,'sarah',0,'worst video');

-- display the tables
SELECT * FROM videos;

SELECT * FROM viewers;

-- To display the vidoes that has been rated by users based on the video table contants
SELECT videos.title, viewers.users, viewers.review 
FROM videos  LEFT JOIN  viewers 
ON videos.id=viewers.video_id;

-- TO dispaly the video that has been rated by users based on the viwers table contents
SELECT videos.title, viewers.users, viewers.review 
FROM videos  RIGHT JOIN  viewers 
ON videos.id=viewers.video_id;

-- To display the common 
SELECT *
FROM videos  INNER JOIN  viewers 
ON videos.id=viewers.video_id;


-- To display the common 
SELECT videos.title, viewers.users, viewers.review 
FROM videos  INNER JOIN  viewers 
ON videos.id=viewers.video_id;

SELECT * FROM videos  
LEFT JOIN  viewers 
ON videos.id=viewers.video_id
union
SELECT * FROM videos  
RIGHT JOIN viewers 
ON videos.id=viewers.video_id;




