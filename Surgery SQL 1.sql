DROP DATABASE IF EXISTS surgery;
CREATE DATABASE surgery;
USE surgery;

DROP TABLE IF EXISTS Surgery_Day22;
CREATE TABLE Surgery_Day22(
	ID INT,
	FName VARCHAR(15),
	LName VARCHAR(15),
	HouseNo INT,
	Street VARCHAR(30),
	City VARCHAR(15),
	Budget INT,
	SurgeryID INT
);

INSERT INTO Surgery_Day22 (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (1,'Ben','Miflin',12,'Greek Street','Tamworth',10000,231);
INSERT INTO Surgery_Day22 (ID, FName, LName, Street, City, Budget, SurgeryID) VALUES (2,'Hans','Krebbs','Rothamsted Manor','Lichfield',24200,231);
INSERT INTO Surgery_Day22 (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (3,'Mary','Jones',12,'Rotten Row','Tamworth',1100,243);
INSERT INTO Surgery_Day22 (ID, FName, LName, Street, City, Budget, SurgeryID) VALUES (4,'Jane','Hughes','Rothamsted Manor','Lichfield',12100,231);
INSERT INTO Surgery_Day22 (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (5,'Bill','Pirie',23,'Final Way','Lichfield',16500,243);

SELECT * FROM Surgery_Day22;

-- place your answers below here

SELECT fName, lname from surgery_day22 WHERE city NOT 'Lichfield';
SELECT SurgeryID FROM surgery_day22 GROUP BY surgeryID;
SELECT City, SUM(budget) AS BudgetTotal FROM surgery_day22 WHERE city = 'Lichfield';
SELECT AVG(Budget) FROM surgery_day22 WHERE SurgeryID = 231;
SELECT AVG (budget) FROM surgery_day22 WHERE budget > 12780
SELECT SUM(budget) FROM surgery_day22 WHERE SurgeryID = '231' OR SurgeryID = '243';
SELECT fname, lname, budget FROM surgery_day22 WHERE budget > (SELECT AVG(budget) FROM surgery_day22 GROUP BY SurgeryID  HAVING SurgeryID = 243)
SELECT fname, lname, budget FROM surgery_day22 WHERE budget  > ANY (SELECT budget FROM surgery_day22 WHERE SurgeryID = 231)
SELECT fname, lname, budget FROM surgery_day22 WHERE budget  > (SELECT AVG(budget) FROM surgery_day22) ORDER BY fname
SELECT fname, lname, budget FROM surgery_day22 WHERE HouseNo IS NULL ORDER BY FNAME