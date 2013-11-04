--Evan Hopkins
--Normalization 2

DROP TABLE IF EXISTS directorInmovie;
DROP TABLE IF EXISTS actorsInmovie;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS person;

CREATE TABLE person (
	pid SERIAL,
	name VARCHAR(45),
	address VARCHAR(60),
	birthdate DATE,
	PRIMARY KEY (pid)
);

CREATE TABLE actor (
	aid INT REFERENCES person(pid),
	haircolor VARCHAR(45),
	eyecolor VARCHAR(45),
	inchheight INT,
	lbsweight INT,
	saganiversary DATE,
	PRIMARY KEY (aid)
);

CREATE TABLE director (
	did INT REFERENCES person(pid),
	filmschool VARCHAR(45),
	dganiversary DATE,
	PRIMARY KEY (did)
);

CREATE TABLE movie (
	mid SERIAL,
	title VARCHAR(45),
	year DATE,
	boxofcsalesdom INT,
	boxofcalesfor INT,
	dvdsales INT,
	PRIMARY KEY (mid)
);

CREATE TABLE actorsInmovie(
	aid INT REFERENCES actor(aid),
	mid INT REFERENCES movie,
	PRIMARY KEY (aid,mid)
);

CREATE TABLE directorInmovie(
	did INT REFERENCES director(did),
	mid INT REFERENCES movie,
	PRIMARY KEY (did,mid)
);

INSERT INTO person (name, address, birthdate) VALUES
	('Sean Connery', '5 lake road', '05/05/1975'),
	('Carrot Top', '22 carrot lane', '02/04/1989'),
	('Director that worked with connery', 'somewhere', '03/09/2009'),
	('other director', 'somewhere else', '04/16/1944');

INSERT INTO actor (aid, haircolor, eyecolor, inchheight, lbsweight, saganiversary) VALUES
	(1, 'red', 'black', 80, 150, '05/06/1982'),
	(2, 'black', 'blue', 72, 183, '01/03/1995');

INSERT INTO director (did, filmschool, dganiversary) VALUES
	(3, 'penn state', '06/07/1991'),
	(4, 'marist', '06/07/1995');

INSERT INTO movie (title, year, boxofcsalesdom, boxofcalesfor, dvdsales) VALUES
	('Bond 1', '06/07/1993', 12345, 123444, 1123),
	('Bond 2', '06/07/1996', 16545, 123444, 12383);

INSERT INTO actorsInmovie (aid, mid) VALUES
	(1, 1),
	(2, 2);

INSERT INTO directorInmovie (did, mid) VALUES
	(3, 1),
	(4, 2);

SELECT * FROM person;
SELECT * FROM actor;
SELECT * FROM director;
SELECT * FROM movie;

SELECT DISTINCT p.name as Director FROM
	person p,
	movie m,
	director d,
	directorInmovie dim
WHERE dim.did = d.did 
AND m.mid = dim.mid 
AND d.did = p.pid 
AND dim.mid 
IN (SELECT m.mid FROM
		person p,
		actor a,
		movie m,
		actorsInmovie aim 
	WHERE p.pid = a.aid 
	AND m.mid = aim.mid 
	AND a.aid = aim.aid 
	AND p.name = 'Sean Connery' 
	);