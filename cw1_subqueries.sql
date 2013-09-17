--Evan Hopkins
--CMPT 308
--9/17/2013

--1) All students in alpha order
SELECT fName FROM students ORDER BY fName;

--2) Names of students who have had Adams for any class
SELECT fName FROM students WHERE SID IN (
	SELECT SID FROM grades WHERE TID= (
		SELECT TID from teachers WHERE fName='Adams'
	)
);

--3) Names of teachers who have taught Biology
SELECT fName FROM teachers WHERE TID IN (
	SELECT TID FROM grades WHERE SUID IN (
		SELECT SUID FROM subjects WHERE name='Biology'
	)
);

--4) Names of teachers who do not teachers
SELECT fName FROM teachers WHERE TID NOT IN (
	SELECT TID FROM grades
);

--5) Names of students who have taken no classes
SELECT fName FROM students WHERE SID NOT IN (
	SELECT SID FROM grades
);

--4) Names of students in the same class, and the class name
