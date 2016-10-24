-1
SELECT Title 
FROM Titles 
WHERE Publisher = 'Macmillan';

-2
SELECT * FROM Branch 
WHERE Bcode In 
(
  SELECT Branch 
  FROM Holdings

  INNER JOIN Titles 
  ON Titles.Title = Holdings.Title 
  WHERE Titles.Author = 'Ann Brown' 
);

-3
SELECT BCode 
FROM Branch 

INNER JOIN Holdings 
ON Holdings.Branch = Branch.BCode

INNER JOIN Titles 
ON Holdings.Title = Titles.Title 

WHERE Titles.Author = 'Ann Brown' 
GROUP BY BCode;


-4
SELECT BCode, SUM(Holdings.Copies) 
FROM Branch 

INNER JOIN Holdings 
ON Holdings.Branch = Branch.BCode 

GROUP BY Bcode;
