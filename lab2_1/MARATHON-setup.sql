CREATE TABLE MARATHON (
  Place int NOT NULL PRIMARY KEY,
  Time TIME NOT NULL,
  Pace varchar(20),
  GroupPlace int,
  `Group` varchar(10),
  Age tinyint NOT NULL,
  Sex varchar(10) NOT NULL,
  BIBNumber int NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Town varchar(50),
  State varchar(50)
);