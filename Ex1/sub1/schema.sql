CREATE TABLE Tastes (
  Name VARCHAR(20) NOT NULL,
  Filling VARCHAR(20) NOT NULL,
  PRIMARY KEY (Name, Filling)
);

CREATE TABLE Locations (
  LName VARCHAR(30) NOT NULL PRIMARY KEY,
  Phone VARCHAR(50) NOT NULL,
  Address VARCHAR(255) NOT NULL
);

CREATE TABLE Sandwiches (
  Location VARCHAR(30),
  Bread VARCHAR(50),
  Filling VARCHAR(20),
  Price DECIMAL,
  
  FOREIGN KEY fk_location(Location)
  REFERENCES Locations(LName)
  ON DELETE CASCADE
  ON UPDATE CASCADE  

  PRIMARY KEY (Location, Bread, Filling)
);

INSERT INTO Tastes
VALUES 
('Brown','Turkey'),('Brown','Beef').
('Brown','Ham'),('Jones','Cheese'),
('Green','Beef'),('Green','Turkey'),
('Green','Cheese');

INSERT INTO Locations
VALUES
('Lincoln','6834523','Lincoln Place'),
('O\'Neills\'','6742134','Pearse St'),
('Old Nag','7678132','Dame St'),
('Buttery','7023421','College St');

INSERT INTO Sandwiches
VALUES
('Lincoln','Rye','Ham',1.25),
('O\'Neill\'s','White','Cheese',1.20),
('O\'Neill\'s','Whole','Ham',1.25),
('Old Nag','Rye','Beef',1.35),
('Buttery','White','Cheese',1.00),
('O\'Neill\'s','White','Turkey',1.35),
('Buttery','White','Ham',1.10),
('Lincoln','Rye','Beef',1.35),
('Lincoln','White','Ham',1.30),
('Old Nag','Rye','Ham',1.40);