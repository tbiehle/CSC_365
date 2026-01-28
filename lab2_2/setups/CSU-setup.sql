CREATE TABLE CAMPUSES (
  Id int PRIMARY KEY NOT NULL,
  Campus varchar(100) NOT NULL,
  Location varchar(100),
  County varchar(100),
  Year int
);

CREATE TABLE CSU_FEES(
  Campus int PRIMARY KEY NOT NULL,
  Year int,
  CampusFee int NOT NULL,
  FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)
);

CREATE TABLE DEGREES (
  Year int PRIMARY KEY NOT NULL,
  Campus int NOT NULL,
  Degrees int NOT NULL,
  FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)
);

CREATE TABLE DISCIPLINE_ENROLLMENTS(
  Campus int NOT NULL,
  Discipline int NOT NULL,
  Year int NOT NULL,
  Undergraduate int NOT NULL,
  Graduate int NOT NULL,
  PRIMARY KEY (Campus, Discipline),
  FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id),
  FOREIGN KEY (Discipline) REFERENCES DISCIPLINES(Id)
);

CREATE TABLE DISCIPLINES(
  Id int PRIMARY KEY NOT NULL,
  Name varchar(50) NOT NULL
);

CREATE TABLE ENROLLMENTS(
  Campus int NOT NULL,
  Year int NOT NULL,
  TotalEnrollment_AY int NOT NULL,
  FTE_AY int NOT NULL,
  PRIMARY KEY (Campus, Year),
  FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)
);

CREATE TABLE FACULTY(
  Campus int NOT NULL PRIMARY KEY,
  Year int NOT NULL,
  Faculty Decimal(10, 2)
);