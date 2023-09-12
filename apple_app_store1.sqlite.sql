CREATE TABLE applestore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL 

SELECT * FROM appleStore_description2

UNION ALL 

SELECT * FROM appleStore_description3

UNION ALL 

SELECT * FROM appleStore_description4

--total unique apps - id - in app store [ and check union worked,  comparing both files 


SELECT COUNT(DISTINCT id) AS UNIQUEAPPIDs
FROM applestore_description_combined

#7197

--missing values 

SELECT COUNT(*) AS MissingValues
FROM applestore_description_combined
WHERE track_name is null  
--0


--number of apps , per genre 

SELECT prime_genre, COUNT(*) AS NumApps
FROM AppleStore
GROUP BY prime_genre
ORDER BY NumApps DESC

--paid vs free app ratings

SELECT min(user_rating) AS MinRating,
	   max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating
FROM AppleStore


--Distribution of app prices AppleStore


--paid vs free app ratings

SELECT CASE
            WHEN price > 0 THEN 'paid'
            ELSE 'Free'
     END AS App_Type,
     avg(user_rating) AS Avg_Rating
FROM AppleStore
Group BY App_Type
--3.37 free
--3.72 paid


--Check , more supported languages apps , have higher ratings?AppleStore

SELECT CASE 
			WHEN lang_num < 10 THEN '<10 languages'
            WHEN lang_num BETWEEN 10 and 30 THEN '10-30 languages'
            ELSE '>30 languages'
        END AS language_bucket,
        avg(user_rating) AS Avg_Rating
FROM AppleStore
GROUP BY language_bucket
ORDER BY Avg_Rating DESC
-- 4.13 [ 10=30
-- 3.77 [ >30
-- 3.36 [ less 10

--genre with , low rating 

SELECT prime_genre,
	   avg(user_rating) AS Avg_Rating
FROM AppleStore
GROUP BY prime_genre
ORDER BY Avg_Rating ASC
LIMIT 10

--There is bad ratings , in this Category, good to make app here AppleStore


--correlation between , description and user rating AppleStore

SELECT CASE 
			WHEN length(b.app_desc) <500 THEN 'Short'
            WHEN length(b.app_desc) BETWEEN 500 AND 1000 THEN 'Medium'
            ELSE 'Long'
        END AS description_length_bucket,
        avg(a.user_rating) AS average_rating


FROM
	 AppleStore AS A
JOIN
	 applestore_description_combined AS b
ON
	 a.id = b.id

GROUP BY description_length_bucket
ORDER BY average_rating DESC


--


















 