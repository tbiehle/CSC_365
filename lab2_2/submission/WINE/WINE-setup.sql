CREATE TABLE GRAPES (
  ID int NOT NULL PRIMARY KEY,
  Grape varchar(40) NOT NULL UNIQUE,
  Color varchar(10)
);

CREATE TABLE APPELLATION (
  No int NOT NULL PRIMARY KEY,
  Appellation varchar(80) UNIQUE,
  County varchar(100),
  State varchar(40),
  Area varchar(100),
  IsAVA varchar(10)
);

CREATE TABLE WINE (
  No int NOT NULL PRIMARY KEY,
  Grape varchar(40),
  Winery varchar(255) NOT NULL,
  Appellation varchar(80),
  Name varchar(255),
  Year int,
  Price decimal(8, 2),
  Score int,
  Cases int,
  FOREIGN KEY (Grape) REFERENCES GRAPES(Grape),
  FOREIGN KEY (Appellation) REFERENCES APPELLATION(Appellation)
);