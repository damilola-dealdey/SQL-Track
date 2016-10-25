--What all cities did people respond from
SELECT DISTINCT City FROM Email;

--How many people responded from each city
SELECT City , COUNT(*) 
FROM Email 
GROUP BY City;

--Which city were the maximum respondents from?
select City 
FROM Email 
GROUP BY City 
ORDER BY count(*) DESC 
LIMIT 1;

--What all email domains did people respond from ?
SELECT DISTINCT SUBSTRING_INDEX(Email,'@',-1)
FROM Email;

--Which is the most popular email domain among the respondents ?
SELECT DISTINCT SUBSTRING_INDEX(Email,'@',-1) , COUNT(*) 
FROM Email 
GROUP BY SUBSTRING_INDEX(Email, '@', -1)
HAVING COUNT(*) = 
(
    SELECT COUNT(*) AS counts  
    FROM Email GROUP BY substring_index(Email, '@', -1)
    ORDER BY count(*) DESC
    LIMIT 1
);
