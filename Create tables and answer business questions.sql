--Create sales table
CREATE TABLE sales (
	orderId INT UNIQUE PRIMARY KEY,
  	orderDate DATETIME,
  	productid INT,
  	locationId INT,
  	managerId INT,
  	paymentId INT,
  	quanity INT,
  	total REAL,
	FOREIGN KEY (productId)
		REFERENCES products(productId),
	FOREIGN KEY (locationId)
		REFERENCES locations(locationId),
FOREIGN KEY (managerId)
		REFERENCES managers(managerId),
FOREIGN KEY (paymentId)
		REFERENCES payments(paymentId)
);
--Insert values in sales table
INSERT INTO sales VALUES 
	(1, '2022-08-02', 7, 6, 81, 1, 3, 16.5),
  (2, '2022-08-05', 6, 6, 81, 2, 1, 16.5),
  (3, '2022-08-06', 10, 10, 64, 3, 5, 10),
	(4, '2022-08-07', 1, 1, 92, 2, 2, 29.9),
	(5, '2022-08-08', 5, 4, 68, 1, 5, 80),
	(6, '2022-08-09', 9, 9, 25, 3, 2, 8),
	(7, '2022-08-11', 1, 11, 93, 3, 1, 14.95),
	(8, '2022-08-12', 5, 7, 66, 2, 3, 48),
	(9, '2022-08-13', 9, 6, 81, 1, 4, 16),
	(10, '2022-08-15', 8, 5, 57, 1, 4, 18),
	(11, '2022-08-16', 2, 4, 68, 1, 2, 33),
  (12, '2022-08-18', 1, 3, 94, 3, 2, 29.9),
  (13, '2022-08-19', 8, 11, 93, 2, 3, 13.5),
	(14, '2022-08-20', 5, 3, 94, 1, 1, 16),
	(15, '2022-08-21', 1, 2, 52, 3, 4, 59.8),
	(16, '2022-08-22', 5, 9, 25, 2, 4, 64),
	(17, '2022-08-23', 2, 4, 68, 1, 1, 16.5),
	(18, '2022-08-24', 8, 1, 92, 1, 4, 18),
	(19, '2022-08-25', 1, 3, 94, 3, 1, 14.95),
	(20, '2022-08-26', 5, 8, 37, 1, 4, 64),
	(21, '2022-08-27', 1, 11, 93, 1, 4, 59.8),
  (22, '2022-08-28', 10, 11, 93, 2, 1, 2),
  (23, '2022-08-29', 5, 4, 68, 3, 2, 32),
	(24, '2022-08-30', 7, 5, 57, 3, 5, 27.5),
	(25, '2022-08-31', 3, 12, 75, 1, 5, 97.5); 

--Create products table
CREATE TABLE products (
  productID INT UNIQUE PRIMARY KEY,
  productName TEXT,
  productPrice REAL
);

--Insert values in products table
INSERT INTO products VALUES 
	(1, 'Sesonal Tart', 14.95),
  (2, 'Buddha Bowl' , 16.5),
  (3, 'Fish Burger', 19.5),
	(4, 'Vegan Trio', 15.5),
	(5, 'Turkish Egg', 16),
	(6, 'Halloumi Stack', 16.5),
	(7, 'Iced Espresso', 5.5),
	(8, 'Strawberry Rose Soda', 4.5),
	(9, 'Cold Brew', 4),
	(10, 'Sparkling Water', 2);   

--Create locations table
CREATE TABLE locations (
	locationId INT UNIQUE PRIMARY KEY,
  city TEXT,
  managerId INT,
	FOREIGN KEY (managerId)
		REFERENCES managers(managerId)
);

--Insert values in locations table
INSERT INTO locations VALUES 
	(1, 'Cork', 92),
  (2, 'Dublin' , 52),
  (3, 'Waterford', 94),
	(4, 'Wicklow', 68),
	(5, 'Sligo', 57),
	(6, 'Galway', 81),
	(7, 'Dingle', 66),
	(8, 'Clonakilty', 37),
	(9, 'Killarney', 25),
	(10, 'Kilkenny', 64),
	(11, 'Cobh', 93),
	(12, 'Kinsale', 75)
;

--Create managers table
CREATE TABLE managers (
	managerId INT UNIQUE PRIMARY KEY,
  firstName TEXT,
  lastName TEXT,
	birthDate DATETIME,
	hireDate DATETIME
);

--Insert values in managers table

INSERT INTO managers VALUES 
	(92, 'David', 'Brown', '1980-09-12', '2002-11-11'),
  (52, 'Tara', 'Delacruz', '1947-11-09', '2003-08-02'),
  (94, 'Donnell', 'Read', '1929-03-04', '2004-12-23'),
	(68, 'Issac', 'Corrigan', '1979-01-18', '2005-09-08'),
	(57, 'Kianna', 'Anderson', '1922-12-17', '2006-09-08'),
	(81, 'Connah', 'Whitehouse', '1935-06-16', '2008-04-18'),
	(66, 'Lola', 'Vickers', '1986-09-17', '2011-02-03'),
	(37, 'Drake', 'Le', '1942-02-18', '2015-05-02'),
	(25, 'Sonya', 'Morin', '1944-08-01', '2016-02-12'),
	(64, 'Emerson', 'Klein', '1933-03-08', '2018-02-02'),
	(93, 'Noa', 'Fitzpatrick', '1969-09-21', '2020-09-12'),
	(75, 'Caden', 'Dorsey', '1953-01-15', '2022-02-26')
;

--Create payments table
CREATE TABLE payments (
	paymentId INT UNIQUE PRIMARY KEY,
  paymentType TEXT
);

--Insert values in payments table
INSERT INTO payments VALUES 
	(1, 'Cash'),
	(2, 'Credit Card'),
	(3, 'Debit Card');

--Analyze Data
.mode markdown
.header on

--Q1: Which branch has the higest sales? How much? And who is the manager?
--A1: Wicklow, 161.5, Issac Corrigan.

SELECT 
  sales.locationId, 
  locations.city,
  managers.managerId,
  managers.firstName,
  managers.LastName,
  SUM(total) AS total_sales
FROM sales
JOIN locations
ON sales.locationId = locations.locationId
JOIN managers
ON sales.managerId = managers.managerId
GROUP BY 1
ORDER BY 6 DESC LIMIT 1;

--Q2: Which menus are the top 3 best seller?
--A2: Turkish Egg, Sesonal Tart, and Strawberry Rose Soda. 

SELECT 
  pro.productId AS product_id,
  pro.productName AS menu,
  pro.productPrice AS price,
  SUM(sal.quanity) AS quanity,
  sal.total AS amount
FROM sales AS sal
JOIN products AS pro
ON sal.productId = pro.productId
GROUP BY 2
ORDER BY 4 DESC LIMIT 3;

--Q3: Due to the Covid-19 guideline. Restaurant can accept 'Cash payment' only once a month otherwise additional fee will be charged. Please find if any managers violate the guideline?
--A3: Connah Whitehouse and Issac Corrigan.
SELECT
  orderId AS ID,
  COUNT(paymentType) AS paymentMethod,
  firstName AS m_firstName,
  lastName AS m_lastName
FROM (
  SELECT * 
  FROM sales 
  JOIN payments 
  ON payments.paymentId = sales.paymentId
  JOIN managers
  ON managers.managerId = sales.managerId
  WHERE paymentType = 'Cash'
) AS sub
GROUP BY 3
HAVING COUNT(paymentType) > 1;

--Q4: Find the total number of restaurants and group them by county.

WITH sub AS ( 
  SELECT 
  locationId,
  city,
  CASE
    WHEN city IN ('Cork', 'Clonakilty', 'Cobh', 'Kinsale') THEN 'Cork'
    WHEN city IN ('Dingle', 'Killarney') THEN 'Kerry'
    ELSE 'Other County'
  END AS county
FROM locations
)
  
SELECT
  county,
  COUNT(*) AS n_sub
FROM sub
GROUP BY 1
ORDER BY 2 DESC;