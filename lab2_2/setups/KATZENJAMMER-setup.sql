CREATE TABLE ALBUMS (
  AId int NOT NULL PRIMARY KEY UNIQUE,
  Title varchar(100) NOT NULL,
  Year int,
  Label varchar(100),
  Type varchar(50)
);

CREATE TABLE BAND (
  Id int NOT NULL PRIMARY KEY UNIQUE,
  FirstName varchar(40) NOT NULL,
  LastName varchar(40) NOT NULL
);

CREATE TABLE SONGS (
  SongId int NOT NULL PRIMARY KEY UNIQUE,
  Title varchar(50) NOT NULL
);

CREATE TABLE TRACKLISTS (
  AlbumId int NOT NULL,
  Position int NOT NULL,
  SongId int NOT NULL,
  FOREIGN KEY (AlbumId) REFERENCES ALBUMS(AId),
  FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  PRIMARY KEY (AlbumId, SongId, Position)
);

CREATE TABLE INSTRUMENTS (
  SongId int NOT NULL,
  BandmateId int NOT NULL,
  Instrument varchar(50),
  FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  FOREIGN KEY (BandmateId) REFERENCES BAND(Id),
  PRIMARY KEY (SongId, BandmateId, Instrument)
);

CREATE TABLE PERFORMANCE (
  SongId int NOT NULL,
  Bandmate int NOT NULL,
  StagePosition varchar(15),
  FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  FOREIGN KEY (Bandmate) REFERENCES BAND(Id),
  PRIMARY KEY (SongId, Bandmate, StagePosition)
);

CREATE TABLE VOCALS (
  SongId int NOT NULL,
  Bandmate int NOT NULL,
  Type varchar(10),
  FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  FOREIGN KEY (Bandmate) REFERENCES BAND(Id),
  PRIMARY KEY (SongId, Bandmate, Type)
);