--Select all articles whose author's name is user3 (Do this exercise using variable also).
SELECT * FROM Articles 
INNER JOIN Users 
ON Articles.User_Id = Users.Id 
WHERE Users.Username = 'user3';

--Using Variable
SET @find = 
(
  SELECT Id
  FROM Users
  WHERE Username = 'user3'
  LIMIT 1
);
SELECT * FROM Articles 
WHERE Articles.User_Id = @find;

--For all the articles being selected above, select all the articles 
--and also the comments associated with those articles in a single query (Do this using subquery also)
SELECT * FROM Articles 
INNER JOIN Users 
ON Articles.User_Id = Users.Id 
LEFT JOIN Comments 
ON Comments.Article_Id = Articles.Id 
WHERE Users.Username = 'user3';

SELECT * FROM Articles  
LEFT JOIN Comments 
ON Comments.Article_Id = Articles.Id  
WHERE Articles.User_Id = 
( 
  SELECT Id FROM Users WHERE Username = 'user3'
);


--Write a query to select all articles which do not have any comments (Do using subquery also)
SELECT * FROM Articles   
LEFT JOIN Comments 
ON Comments.Article_Id = Articles.Id 
WHERE Comments.Id IS NULL;


SELECT * FROM Articles   
WHERE Id NOT IN 
(
  SELECT Article_Id FROM Comments
);

--Write a query to select article which has maximum comments.
--Check This Again #
SET @MaxCount := 
(
  SELECT COUNT(Comments.Id) as CommentCount
  FROM Articles 
  INNER JOIN Comments 
  ON Comments.Article_Id = Articles.Id  
  GROUP BY Articles.Id
  ORDER BY CommentCount DESC
  LIMIT 1
);

SELECT Articles.Id AS 'ArticleId', COUNT(Comments.Id) AS CommentsCount
FROM Articles 
INNER JOIN Comments 
ON Comments.Article_Id = Articles.Id  
GROUP BY Articles.Id
HAVING CommentsCount = @MaxCount;

--Write a query to select article which does not have more than one comment by the same user 
--( do this using left join and group by )
SELECT Articles.Id, Write_Up 
FROM Articles 
LEFT JOIN 
(
  SELECT Count(Id) AS Counts, Article_Id, User_Id  
  FROM Comments 
  GROUP BY Article_Id , User_Id
) AS tmp 
ON tmp.Article_Id = Articles.Id 
WHERE tmp.Counts < 2 OR tmp.Counts is NULL 
GROUP BY Articles.Id;

