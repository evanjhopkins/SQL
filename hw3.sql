-- Evan Hopkins
-- Postgres HW 3
-- 10/7/2013

-- (1)
SELECT agents.city
FROM agents
WHERE aid IN(
	SELECT orders.aid
	FROM orders
	WHERE orders.cid = 'c002'
);

 -- (2)
SELECT agents.city
FROM agents, orders
WHERE agents.aid = orders.aid
AND orders.cid = 'c002';

-- (3)
SELECT DISTINCT orders.pid
FROM orders
WHERE aid IN (
	SELECT orders.aid
	FROM orders
	WHERE cid IN (
		SELECT customers.cid
		FROM customers
		WHERE customers.city = 'Kyoto'
	)
 );

-- (4)
SELECT DISTINCT o2.pid
FROM orders o1, orders o2, customers, agents
WHERE o1.cid = customers.cid
AND agents.aid = o2.aid
AND customers.city = 'Kyoto';

-- (5)
SELECT customers.name
FROM customers
WHERE customers.cid NOT IN(
	SELECT DISTINCT orders.cid
	FROM orders
);

-- (6)
SELECT *
FROM customers
LEFT OUTER JOIN orders
	ON orders.cid = customers.cid
WHERE orders.ordno IS NULL;

-- (7)
SELECT DISTINCT customers.name, agents.name
FROM orders, customers, agents
WHERE orders.cid  = customers.cid
AND orders.aid = agents.aid
AND customers.city = agents.city;

-- (8)
SELECT customers.name, customers.name
FROM customers, agents
WHERE customers.city = agents.city;


-- (9)
SELECT customers.name, customers.city
FROM customers
WHERE customers.city IN(
	SELECT products.city
	FROM products
	GROUP BY city
	ORDER BY COUNT(*) ASC
	LIMIT 1);

-- (10)
SELECT customers.name, customers.city
FROM customers
WHERE customers.city IN(
	SELECT products.city
	FROM products
	GROUP BY city
	ORDER BY COUNT(*) DESC
	LIMIT 1);

-- (11) 
SELECT customers.name, customers.city
FROM customers
WHERE customers.city IN(
	SELECT products.city
	FROM products
	GROUP BY city
	HAVING COUNT(*) = (
		SELECT COUNT(*)
		FROM products
		GROUP BY city
		ORDER BY COUNT(*) DESC
		LIMIT 1)
);

-- (12)
SELECT products.name
FROM products
WHERE products.priceusd > (
	SELECT AVG(products.priceusd)
	FROM products
);

-- (13)
SELECT DISTINCT customers.name, orders.pid, orders.dollars
FROM customers, orders
WHERE orders.cid = customers.cid
ORDER BY orders.dollars DESC;

-- (14)
SELECT customers.name, COALESCE(SUM(orders.dollars),0) AS "Total $"
FROM customers 
LEFT OUTER JOIN orders 
	ON customers.cid = orders.cid
GROUP BY customers.cid
ORDER BY "Total $" DESC;

-- (15)
SELECT customers.name, agents.name, products.name
FROM customers, orders, products, agents
WHERE orders.pid = products.pid
AND orders.cid = customers.cid
AND orders.aid = agents.aid
AND agents.city = 'New York';

-- (16)
SELECT orders.ordno, orders.dollars, 
	(orders.qty * products.priceUSD * (100- customers.discount) * 0.01) 
	AS "Calculated Dollar"
FROM customers, products, orders
WHERE orders.pid = products.pid
AND orders.cid = customers.cid;

-- (17)
UPDATE orders
SET dollars = 696969
WHERE ordno = 1020;





