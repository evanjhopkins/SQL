--Evan Hopkins
--CMPT 308
--9/23/2013
--Queries HW 2

--1) Returns the city of every agents who has made an order with customer 'c002'
SELECT city
FROM agents
WHERE aid IN (
	SELECT aid
	FROM orders
	WHERE cid = 'c002'
);

--2) Returns the pid of products ordred through agents that have made an order in Kyoto
SELECT pid
FROM orders
WHERE aid IN (
	SELECT aid 
	FROM customers, orders
	WHERE (orders.cid = customers.cid)
	AND city = 'Kyoto'
);

--3) Returns the names and cids of customers that have never ordered through agent Brown (a03)
SELECT name, cid
FROM customers  	
WHERE cid NOT IN (
	SELECT DISTINCT cid
	FROM orders
	WHERE aid = 'a03'
);

--4) Returns the names and pids of customers who have ordered products p01 and p07
SELECT cid, name
FROM customers 
WHERE cid IN (
	SELECT DISTINCT cid 
	FROM orders 
	WHERE pid = 'p01' 
	OR pid = 'p07'
);

--5) Returns the pids of products ordered by customers that have every placed and order with a03
SELECT pid 
FROM orders 
WHERE cid IN (
	SELECT cid 
	FROM orders 
	WHERE aid = 'a03'
);

--6) Returns the names and discounts of customers who have placed orders through agents in Dallas or Duluth
SELECT name, discount 
FROM customers 
WHERE cid IN (
	SELECT cid 
	FROM orders 
	WHERE aid IN (
		SELECT aid 
		FROM agents 
		WHERE city = 'Dallas' 
		OR city = 'Duluth'
	)
);

--7) Returns customers who have the same discount of any customer in dallas or kyoto
SELECT *
FROM customers
WHERE discount IN (
	SELECT discount
	FROM customers
	WHERE city = 'Kyoto' 
	OR city = 'Dallas'
	)
AND city != 'Kyoto' 
AND city != 'Dallas';
		