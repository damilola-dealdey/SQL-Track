--1
SELECT * FROM Locations 
WHERE LName In 
(
  SELECT Location 
  FROM Sandwiches 
  WHERE Filling = 'Cheese'
);

--2
SELECT Location 
FROM Sandwiches 
WHERE Filling = 'Cheese';

--3
SELECT Location, COUNT(*) 
FROM Sandwiches 
LEFT JOIN Tastes 
ON Sandwiches.Filling = Tastes.Filling 
GROUP BY Sandwiches.Location; 