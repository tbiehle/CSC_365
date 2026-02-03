CREATE TABLE ROOMS (
  RoomId varchar(3) NOT NULL PRIMARY KEY,
  roomName varchar(50),
  beds tinyint NOT NULL,
  bedType varchar(10) NOT NULL,
  maxOccupancy tinyint NOT NULL,
  basePrice decimal(6, 2),
  decor varchar(100)
);

CREATE TABLE RESERVATIONS (
  Code int NOT NULL PRIMARY KEY,
  Room varchar(3) NOT NULL,
  CheckIn DATE NOT NULL,
  CheckOut DATE,
  Rate Decimal(6, 2) NOT NULL,
  LastName varchar(20) NOT NULL,
  FirstName varchar(20) NOT NULL,
  Adults tinyint NOT NULL,
  Kids tinyint,
  FOREIGN KEY (Room) REFERENCES ROOMS(RoomId)
);