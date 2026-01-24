CREATE TABLE CUSTOMERS (
  Id int NOT NULL PRIMARY KEY,
  LastName VarChar(50) NOT NULL,
  FirstName VarChar(50) NOT NULL
);

CREATE TABLE GOODS (
  Id varchar(30) NOT NULL PRIMARY KEY,
  Flavor varchar(20) NOT NULL,
  Food varchar(30) NOT NULL,
  Price decimal(8, 2) NOT NULL
);

CREATE TABLE RECEIPTS (
  ReceiptNumber int NOT NULL PRIMARY KEY,
  Date varchar(20) NOT NULL,
  CustomerId int NOT NULL,
  FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(Id)
);

CREATE TABLE ITEMS (
  Receipt int NOT NULL,
  Ordinal int NOT NULL,
  Item varchar(30) NOT NULL,
  FOREIGN KEY (Receipt) REFERENCES RECEIPTS(ReceiptNumber),
  FOREIGN KEY (Item) REFERENCES GOODS(Id)
);