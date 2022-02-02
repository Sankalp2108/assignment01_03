CREATE DATABASE ecommerce1;

CREATE TABLE salespeople
(
    Snum INT NOT NULL PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL UNIQUE,
    City VARCHAR(50),
    Comm INT
);

DESC salespeople;

INSERT INTO salespeople VALUES
(1001 ,"Peel" , "London" ,12),
(1002  ,"Serres" ,"Sanjose" ,13),
(1004 ,"Motika" ,"London" ,11),
(1007 ,"Rifkin" ,"Barcelona" ,15),
(1003 ,"Axelrod" ,"Newyork" ,10);

SELECT * FROM salespeople;


CREATE TABLE customers
(
    Cnum INT NOT NULL PRIMARY KEY,
    Cname VARCHAR(50),
    City VARCHAR(50) NOT NULL,
    Snum INT,
    FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
);

DESC customers;

INSERT INTO customers VALUES 
(2001  ,"Hoffman" ,"London" ,1001),
(2002  ,"Giovanni", "Rome", 1003),
(2003  ,"Liu" ,"Sanjose", 1002),
(2004  ,"Grass" ,"Berlin", 1002),
(2006 ,"Clemens", "London", 1001),
(2008 ,"Cisneros", "Sanjose", 1007),
(2007 ,"Pereira", "Rome", 1004);

SELECT * FROM customers;


CREATE TABLE orders
(
    Onum INT NOT NULL PRIMARY KEY,
    Amt FLOAT ,
    Odate DATE,
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
);

DESC orders;

INSERT INTO orders VALUES
(3001, 18.69, '1990-10-3' ,2008 ,1007),
(3003, 767.19 ,'1990-10-3', 2001 ,1001),
(3002 ,1900.10 ,'1990-10-3' ,2007 ,1004),
(3005 , 5160.45 ,'1990-10-3' ,2003, 1002),
(3006 , 1098.16, '1990-10-3' ,2008, 1007),
(3009 ,1713.23, '1990-10-4', 2002 ,1003),
(3007 , 75.75, '1990-10-4', 2004 ,1002),
(3008 , 4273.00, '1990-10-5', 2006, 1001),
(3010  ,1309.95, '1990-10-6', 2004, 1002),
(3011 , 9891.88 ,'1990-10-6', 2006, 1001);

SELECT * FROM orders;


-- Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT * FROM salespeople WHERE Sname LIKE "A%";



--  Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT  salespeople.Snum , salespeople.Sname , orders.Amt 
FROM salespeople
JOIN orders
ON salespeople.Snum = orders.Snum WHERE orders.Amt > 2000.0;


-- Count the number of Salesperson belonging to Newyork.

SELECT COUNT(Sname) FROM salespeople WHERE City = "Newyork";

-- Display the number of Salespeople belonging to London and belonging to Paris.

SELECT COUNT(Sname) FROM salespeople WHERE City="London" AND City="Paris";

-- Display the number of orders taken by each Salesperson and their date of orders.

SELECT salespeople.Snum ,  salespeople.Sname , orders.Odate , Count(orders.Odate)
FROM salespeople
JOIN orders
ON salespeople.Snum = orders.Snum 
GROUP BY orders.Odate;