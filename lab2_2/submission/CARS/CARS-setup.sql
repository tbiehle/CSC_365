CREATE TABLE CONTINENTS (
  ContId tinyint PRIMARY KEY NOT NULL,
  Continent varchar(20) 
);

CREATE TABLE COUNTRIES (
  CountryId int PRIMARY KEY NOT NULL,
  CountryName varchar(50) NOT NULL,
  Continent tinyint NOT NULL,
  FOREIGN KEY (Continent) REFERENCES CONTINENTS(ContId)
);

CREATE TABLE CAR_MAKERS (
  Id int PRIMARY KEY NOT NULL,
  Maker varchar(50) NOT NULL,
  FullName varchar(50) NOT NULL,
  Country int NOT NULL,
  FOREIGN KEY (Country) REFERENCES COUNTRIES(CountryId)
);

CREATE TABLE MODEL_LIST (
  ModelId int PRIMARY KEY NOT NULL,
  Maker int NOT NULL,
  Model varchar(50) UNIQUE NOT NULL,
  FOREIGN KEY (Maker) REFERENCES CAR_MAKERS(Id)
);

CREATE TABLE CAR_NAMES (
  MakeId int PRIMARY KEY NOT NULL,
  Model varchar(50) NOT NULL,
  MakeDescription varchar(100) NOT NULL,
  FOREIGN KEY (Model) REFERENCES MODEL_LIST(Model)
);

CREATE TABLE CAR_DATA (
  Id int PRIMARY KEY NOT NULL,
  MPG int,
  Cylinders tinyint,
  Edispl int,
  Horsepower int,
  Weight int,
  Accelerate decimal(4, 2),
  Year int,
  FOREIGN KEY (Id) REFERENCES CAR_NAMES(MakeId)
);
