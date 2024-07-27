USE titan;

-- 1. Show the ten first ten rows of the dataset. 
SELECT *
FROM titanic_dataset
LIMIT 10

-- Alternatively, to find the last ten row of the dataset
 SELECT *
 FROM titanic_dataset
 ORDER BY PassengerId DESC
 LIMIT 10
 
-- 2. Find the number of passenger who survived. 
SELECT COUNT(*) AS persenger_survived
FROM titanic_dataset
WHERE Survived = 1

-- 3. Find the average age of all passenger. 
SELECT AVG(Age) AS Average_age
FROM titanic_dataset

-- 4. Find the nunber of passenger in each class. 

SELECT COUNT(*)  AS Class_1
FROM titanic_dataset
WHERE Pclass = 1

SELECT COUNT(*)  AS Class_2
FROM titanic_dataset
WHERE Pclass = 2

SELECT COUNT(*)  AS Class_3
FROM titanic_dataset
WHERE Pclass = 3

-- However, doing this will give the number of each class separetely. Alternativey and best, it is written as 

SELECT Pclass, count(*) AS no_of_passenger
FROM titanic_dataset
GROUP BY Pclass 

-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
 SELECT *
 FROM titanic_dataset
 ORDER BY Pclass DESC
 LIMIT 10
 
 -- 6. Find the number of passengers  in each class sorted by class in ascending order
 SELECT Pclass, COUNT(*) AS no_of_passenger,
 FROM titanic_dataset
 GROUP BY Pclass
 ORDER BY Pclass ASC
 
 
 -- 7. find the average fare paid by passenger in each class
 SELECT Pclass, COUNT(*) AS no_of_passenger, avg(fare) AS average_fare_per_class
 FROM titanic_dataset
 GROUP BY Pclass
 ORDER BY Pclass ASC
 
 
 -- 8. find the name of the passenger with the highest fare
SELECT name, Fare
FROM titanic_dataset
WHERE Fare = (
				SELECT max(Fare)
				FROM titanic_dataset)
                

-- 9. Find the name of the passenger who had the highest age among the survivors 

SELECT name, Age
FROM titanic_dataset
WHERE Age = (
				SELECT max(Age)
				FROM titanic_dataset
                WHERE Survived = 1)
                
-- 10. Find the number of passenger who paid more than the average fare.

SELECT 
	passengerId,
    Name,
    Fare
FROM titanic_dataset
WHERE Fare > (
				SELECT AVG(Fare)
				FROM titanic_dataset)


-- 11. Find the name of the passenger who had the most parents or children on board.

SELECT 
	Name
FROM titanic_dataset
WHERE Parch = (
				SELECT MAX(Parch)
                FROM titanic_dataset )
                
-- 12. find the number of male and female passengers who survived. And order the result in by sex in ascending order
SELECT *
FROM titanic_dataset

SELECT Sex, count(*) AS num_survived
FROM titanic_dataset
WHERE Survived = 1
GROUP BY Sex
ORDER BY Sex ASC



-- 13. find the name, age and fare of the oldest passenger who survived.
SELECT 
	Name,
    Age,
    Fare
FROM titanic_dataset
WHERE Age = (

			SELECT MAX(Age) AS oldest_age
			FROM titanic_dataset
			WHERE Survived = 1 )
            
-- 14. find the name and age of the youngest female passenger who survived in third class

SELECT 
	Name,
    Age
FROM titanic_dataset
WHERE Age = (

						SELECT MIN(Age)
						FROM titanic_dataset
						WHERE Sex = 'Female' AND Survived = 1 AND Pclass = 3 )
                        
-- 15. find the number of male and female passenger 

SELECT Sex, count(*) AS no_of_passenger
FROM titanic_dataset
GROUP BY Sex

-- 16. Select all passenger who travelled in a cabin that was not shared by other passenger

SELECT *
FROM titanic_dataset
WHERE cabin NOT IN (

					SELECT cabin
					FROM titanic_dataset
					GROUP BY cabin HAVING COUNT(*) > 1 )


