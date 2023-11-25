SQL


SELECT*
FROM dataset_1 LIMIT 10;


SELECT DISTINCT passanger
FROM dataset_1 LIMIT 10;


SELECT*
FROM dataset_1 
WHERE passanger = 'Alone';


SELECT*
FROM dataset_1 
WHERE passanger = 'Alone' AND weather = 'Sunny';

SELECT*
FROM dataset_1 
WHERE passanger = 'Alone' AND weather = 'Sunny' AND destination = 'Home';



SELECT*
FROM dataset_1 
WHERE passanger = 'Alone' OR destination = 'Home';

SELECT*
FROM dataset_1 
WHERE passanger = 'Alone' OR destination = 'Home';


SELECT*
FROM dataset_1 
WHERE passanger = 'Alone' OR time = '2PM';










































