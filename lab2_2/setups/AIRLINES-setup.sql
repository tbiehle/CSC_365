CREATE TABLE AIRLINES(
  Id int PRIMARY KEY NOT NULL,
  Airline varchar(50) NOT NULL,
  Abbreviation varchar(20) NOT NULL,
  Country varchar(50)
);

CREATE TABLE AIRPORT(
  City varchar(50) NOT NULL,
  AirportCode varchar(10) PRIMARY KEY NOT NULL,
  AirportName varchar(100) NOT NULL,
  Country varchar(50) NOT NULL,
  CountryAbbrev varchar(20)
);

CREATE TABLE FLIGHTS(
  Airline int NOT NULL,
  FlightNo int NOT NULL,
  SourceAirport varchar(10) NOT NULL,
  DestAirport varchar(10) NOT NULL,
  PRIMARY KEY (Airline, FlightNo),
  FOREIGN KEY (Airline) REFERENCES AIRLINES(Id),
  FOREIGN KEY (SourceAirport) REFERENCES AIRPORT(AirportCode),
  FOREIGN KEY (DestAirport) REFERENCES AIRPORT(AirportCode)
);