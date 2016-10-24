CREATE TABLE Tastes (
  Name varchar(20) NOT NULL,
  Filling varchar(20) NOT NULL,
  PRIMARY KEY (Name, Filling)
);

CREATE TABLE Locations (
  LName varchar(30) NOT NULL PRIMARY KEY,
  Phone varchar(50) NOT NULL,
  Address varchar(255) NOT NULL
);

CREATE TABLE Sandwiches (
  Location varchar(30),
  Bread varchar(50),
  Filling varchar(20),
  Price decimal,
  
  FOREIGN KEY fk_location(Location)
  REFERENCES Locations(LName)
  ON DELETE CASCADE
  ON UPDATE CASCADE  

  PRIMARY KEY (Location, Bread, Filling)
);