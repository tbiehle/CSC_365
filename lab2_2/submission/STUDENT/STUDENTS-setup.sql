CREATE TABLE LIST (
  LastName varchar(30) NOT NULL,
  FirstName varchar(30) NOT NULL,
  Grade tinyint,
  Classroom tinyint,
  PRIMARY KEY (LastName, FirstName)
);

CREATE TABLE TEACHERS (
  LastName varchar(30) NOT NULL,
  FirstName varchar(30) NOT NULL,
  Classroom tinyint,
  PRIMARY KEY (LastName, FirstName)
);
