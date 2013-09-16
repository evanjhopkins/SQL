--Evan Hopkins
--CMPT 308
--9/15/2013

--1) Returns all information about all customers
SELECT * FROM customers;

--2) Returns the name and city of customers whose name is Smith
SELECT name, city FROM agents WHERE agents.name='Smith';

--3) Returns the PID, name, and quantity of all products that cost more than $1.25
SELECT pid, name, quantity FROM products WHERE priceusd>1.25;

--4) Returns the order number and AID of all orders
SELECT ordno, aid FROM orders;

--5) Returns the name and city of customers not from Dallas
SELECT name, city FROM customers WHERE city!='Dallas';

--6) Returns the name of agents from New York or Newark
SELECT name FROM agents where city='New York' or city='Newark';

--7) Returns the name of products not from New York or Newarks that cost $1.00 or less
SELECT name FROM products WHERE name!='New York' and name!='Newark' and priceusd<=1.00;

--8) Returns all informations about orders made in January or March
SELECT * FROM orders WHERE mon='jan' or mon='mar';

--9) Returns all information about orders made in Febuary that are less than $100
SELECT * FROM orders WHERE mon='feb' and dollars<100.00;

--10) Returns all information on orders made by the customer with CID C005
SELECT * FROM orders WHERE cid='C005';
