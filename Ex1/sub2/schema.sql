CREATE TABLE Branch (
  BCode VARCHAR(3) NOT NULL PRIMARY KEY,
  Librarian VARCHAR(20) NOT NULL,
  Address VARCHAR(20) NOT NULL
);

CREATE TABLE Titles (
  Title VARCHAR(20) NOT NULL PRIMARY KEY,
  Author VARCHAR(20) NOT NULL,
  Publisher VARCHAR(20) NOT NULL
);

CREATE TABLE Holdings (
  Branch VARCHAR(3),
  Title VARCHAR(20),
  Copies INT,
  
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

INSERT INTO Branch
VALUES
('B1','John Smith','2 angel Road'),
('B2','Mary Jones','34 Pearse st.'),
('B3','Francis Owens','George X');

INSERT INTO Titles
VALUES
('Susannah','Ann Brown','Macmillan'),
('How to Fish','Amy Fly','Stop Press'),
('A history of Dublin','David Little','Wiley'),
('Computers','Blaise Pascal','Applewoods'),
('The Wife','Ann Brown','Macmillan');

INSERT INTO Holdings
VALUES
('B1','Susannah',),
('B1','How to Fish',),
('B1','A history of Dublin',),
('B2','How to Fish',),
('B2','Computers',),
('B2','The Wife',),
('B3','A history of Dublin',),
('B3','Computers',),
('B3','Susannah',),
('B3','The Wife',);