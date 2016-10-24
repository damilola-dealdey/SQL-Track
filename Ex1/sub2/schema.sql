CREATE TABLE Branch (
  BCode varchar(3) NOT NULL PRIMARY KEY,
  Librarian varchar(20) NOT NULL,
  Address varchar(20) NOT NULL
);

CREATE TABLE Titles (
  Title varchar(20) NOT NULL PRIMARY KEY,
  Author varchar(20) NOT NULL,
  Publisher varchar(20) NOT NULL
);

CREATE TABLE Holdings (
  Branch varchar(3),
  Title varchar(20),
  Copies int,
  
  FOREIGN KEY fk_branch(Branch)
  REFERENCES Branch(BCode)
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  FOREIGN KEY fk_title(Title)
  REFERENCES Titles(Title)
  ON DELETE CASCADE
  ON UPDATE CASCADE,  

  PRIMARY KEY (Branch, Title)
);