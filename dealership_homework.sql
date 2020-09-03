-- I have the queries forom the second part of the assignmet first. Everything else having to do with the creation of
-- the tables and the insertion of values is there (albeit less organized than I'd prefer). 

--Queries
--1
SELECT date_created, CONCAT(customer_attributes.first_name, ' ', customer_attributes.last_name)
FROM payment_attributes
INNER JOIN customer_attributes ON payment_attributes.account_number = customer_attributes.account_number
--2
SELECT CONCAT(first_name, ' ', last_name), credit_score
FROM customer_attributes
WHERE credit_score < 650
	
--3
UPDATE payment_attributes
SET payment_amount = payment_attributes.payment_amount - 75
WHERE account_number = 732749
	
--4
UPDATE payment_attributes
SET payment_amount = payment_attributes.payment_amount +100
WHERE account_number = 8008777

--5

SELECT unpaid_balance, payment_attributes.due_date
FROM financing
INNER JOIN payment_attributes ON financing.financing_number = payment_attributes.financing_number

--6 
CREATE VIEW balance_date AS 
SELECT due_date, financing_number
FROM payment_attributes
	
--7
SELECT order_created, CONCAT(customer_attributes.first_name, ' ', customer_attributes.last_name)
FROM maintenance
INNER JOIN car_attributes ON maintenance.car_id = car_attributes.car_id
INNER JOIN customer_attributes ON car_attributes.account_number = customer_attributes.account_number

--8
SELECT  CONCAT(customer_attributes.first_name, ' ', customer_attributes.last_name), order_created, car_attributes.make, car_attributes.model, car_attributes.years
FROM maintenance
INNER JOIN car_attributes ON maintenance.car_id = car_attributes.car_id
INNER JOIN customer_attributes ON car_attributes.account_number = customer_attributes.account_number

	
	
SELECT *
FROM payment_attributes
DELETE FROM payment_attributes
WHERE account_number = null
	

CREATE TABLE customer_attributes(
	account_number SERIAL PRIMARY KEY,
	first_name VarChar(50),
	last_name VarChar(50),
	address VarChar(100),
	phone_number Integer,
	credit_score Integer
)

CREATE TABLE payment_attributes(
	invoice_number Serial,
	payment_amount Numeric,
	account_number Integer,
	date_created Timestamp,
	late_fee Numeric,
	due_date Timestamp,
	financing_number Integer,
	FOREIGN KEY(account_number) REFERENCES customer_attributes(account_number)
	-- Needs foreign keey  financing number
)
ALTER TABLE payment_attributes
ADD FOREIGN KEY(financing_number) REFERENCES financing(financing_number)

CREATE TABLE financing(
	financing_number Serial PRIMARY KEY,
	car_id VarChar(50),
	financing_amount Numeric,
	fin_provider VarChar(50),
	rate Numeric,
	term Smallint,
	unpaid_balance Integer
)
ALTER TABLE financing
ADD FOREIGN KEY(car_id)REFERENCES car_attributes(car_id)
--needs foreign key car id from car attributes

CREATE TABLE car_attributes(
	car_id VarChar(50) PRIMARY KEY,
	make VarChar(50),
	model VarChar(50),
	years Smallint,
	full_ammount Numeric,
	account_number Integer,
	FOREIGN KEY(account_number) REFERENCES customer_attributes(account_number)
)

CREATE TABLE maintenance(
	workorder Serial PRIMARY KEY,
	car_id VarChar(50),
	order_created Timestamp,
	order_completed Timestamp,
	price Numeric,
	summary VarChar(255),
	employee_id Serial,
	FOREIGN KEY(car_id) REFERENCES car_attributes(car_id)
	
)

CREATE TABLE insurance_coverage(
	insurance_number Serial PRIMARY KEY,
	insurance_provider VarChar(50),
	car_id VarChar(50),
	FOREIGN KEY(car_id) REFERENCES car_attributes(car_id)	
)

CREATE TABLE payment_attributes(
	invoice_number Serial,
	payment_amount Numeric,
	account_number Integer,
	date_created Timestamp,
	late_fee Numeric,
	due_date Timestamp,
	financing_number Integer,
	FOREIGN KEY(account_number) REFERENCES customer_attributes(account_number)
	)
-- Needs foreign key  financing number
ALTER TABLE payment_attributes
ADD FOREIGN KEY(financing_number)REFERENCES financing(financing_number)

INSERT INTO payment_attributes(
	financing_number
)
VALUES(
	687645
),
(
	102938
),
(
	645321
),
(
	956328
),
(
	978564
),
(
	5635458
),
(
	687333
),
(
	687332
),
(
	297856
),
(
	278058
)


CREATE TABLE financing(
	financing_number Serial PRIMARY KEY,
	car_id VarChar(50),
	financing_amount Numeric,
	fin_provider VarChar(50),
	rate Numeric,
	term Smallint,
	unpaid_balance Integer

INSERT INTO financing(
	financing_number,
	car_id,
	financing_amount,
	fin_provider,
	rate,
	term,
	unpaid_balance

CREATE TABLE payment_attributes(
	invoice_number Serial,
	payment_amount Numeric,
	account_number Integer,
	date_created Timestamp,
	late_fee Numeric,
	due_date Timestamp,
	financing_number Integer,
	FOREIGN KEY(account_number) REFERENCES customer_attributes(account_number)
	-- Needs foreign keey  financing number
)
	
)
	
VALUES(
	297856,
	777, 
	22,877.00,
	'Chase_Bank',
	6.5,
	60,
	100
),
	(
	687645,
	37,990.00,
	'Chase Bank',
	6.2,
	36,
	100
	
	)
	
(
	239164,
	42,454.00,
	'Chevrolet Finance',
	5.5,
	60,
	109
),
	
(
	102938,
	39,665.00,
	'Lending Tree',
	6.7,
	36,
	353
),
	
(
	645321,
	30,222.00,
	'Navy Federal Credit Union',
	5.0,
	60,
	1500
),
	
(
	956328,
	28,765.00,
	'Chase Bank',
	4.9,
	36,
	2722
),
	
(
	978564,
	60,773.00,
	'BMW financing',
	7.5,
	36,
	456
),
	
(
	5635458,
	36,554.00,
	'Bank of the Northern Hemisphere',
	8.0,
	36,
	300
),
	
(
	687333,
	35,990.00,
	'Chase Bank',
	6.2,
	60,
	3022
),
	
(
	687332,
	37,990.00,
	'Royal Bank. of Scotland',
	6.2,
	36,
	3599
)



--financing_number for payment attributes


INSERT INTO payment_attributes(
	invoice_number,
	payment_amount,
	account_number,
	date_created,
	late_fee,
	due_date
	--financing_number
)

VALUES(
	35470,
	345.07,
	243547678,
	'2011-02-18',
	0.00,
	'2012-07-03'
),

(
	27489,
	233.07,
	5555345,
	'2011-02-18',
	0.00,
	'2012-07-03'
),

(
	9856892,
	122.07,
	67826,
	'2017-02-18',
	0.00,
	'2015-07-03'
),

(
	23457,
	623.07,
	732749,
	'2006-02-18',
	62.00,
	'2012-07-03'
),

(
	6452798,
	300.07,
	173846,
	'2007-02-18',
	35.00,
	'2014-07-03'
),

(
	123456,
	345.07,
	173846,
	'2013-01-18',
	0.00,
	'2015-04-03'
),

(
	908756,
	330.07,
	2394870,
	'2015-02-18',
	0.00,
	'2017-07-03'
),
(
	9865,
	278.07,
	8008777,
	'2006-02-18',
	100.00,
	'2010-07-03'
),
(
	928374,
	199.07,
	4867,
	'2008-02-18',
	0.00,
	'2012-07-03'
)







INSERT INTO customer_attributes(
	account_number,
	first_name,
	last_name,
	address,
	phone_number,
	credit_score

)

VALUES (

	 732749,
	'Malcolm',
	'Young',
	'666 Thunder Rd',
	890,
	800

),

 (
	173846,
	'Bon',
	'Scott',
	'5555 Perth Ave',
	8675,
	788
),
(
	797534,
	'Bob',
	'Weir',
	'123 Marin Rd',
	986,
	786
),
(
	2394870,
	'Jerry',
	'Garcia',
	'420 Shakedown St.',
	907,
	800
),
(
	8008777,
	'Arthur',
	'Dent',
	'888 Hyperspace Dr',
	5656,
	670
),

(
	4867,
	'Abed',
	'Troy',
	'33 Community Ave',
	444,
	699
)
INSERT INTO car_attributes(
	car_id,
	make,
	model,
	years,
	full_ammount,
	account_number
)
VALUES(
	2983,
	'Ford',
	'Thunderbird',
	2011,
	50000,
	243547678
),
(
	3954873,
	'BMW',
	'Isetta',
	1973,
	60000,
	5555345
),
(
	4456638,
	'AMC',
	'Pacer',
	2020,
	37000,
	67826
),
(
	555444333,
	'Chevrolet',
	'El Camino',
	2015,
	25000,
	732749
),
(
	38495763,
	'Pontiac',
	'Grand Prix',
	2009,
	45000,
	173846
),

(
	9087967,
	'Dodge',
	'Whirley Bird',
	2010,
	38000,
	797534
),
(
	3332,
	'VW',
	'Thing',
	1983,
	25000,
	2394870
),
(
	12345,
	'Saturn',
	'Grunion',
	2011,
	15000,
	8008777
),

(
	847566,
	'Jeep',
	'Hog',
	2017,
	30000,
	4867
)
INSERT INTO financing(
	financing_number,
	car_id,
	financing_amount,
	fin_provider,
	rate,
	term,
	unpaid_balance
)
VALUES(
	278058,
	2983,
	37990.00,
	'Chase Bank',
	6.2,
	36,
	27006
)

(
	297856,
	9012, 
	22877.00,
	'Chase_Bank',
	6.5,
	60,
	10000
)
(
	102938,
	4456638,
	39665.00,
	'Lending Tree',
	6.7,
	36,
	15000
),
	
(
	645321,
	555444333,
	30222.00,
	'Navy Federal Credit Union',
	5.0,
	60,
	15000
),
	
(
	956328,
	38495763,
	28765.00,
	'Chase Bank',
	4.9,
	36,
	27221
),
	
(
	978564,
	9087967,
	60773.00,
	'BMW financing',
	7.5,
	36,
	45645
),
	
(
	5635458,
	3332,
	36554.00,
	'Bank of the Northern Hemisphere',
	8.0,
	36,
	30000
),
	
(
	687333,
	12345,
	35990.00,
	'Chase Bank',
	6.2,
	60,
	30221
),
	
(
	687332,
	847566,
	37990.00,
	'Royal Bank. of Scotland',
	6.2,
	36,
	30998
)



CREATE TABLE maintenance(
workorder Serial PRIMARY KEY,
car_id VarChar(50),
order_created Timestamp,
order_completed Timestamp,
price Numeric,
summary VarChar(255),
employee_id Serial,
FOREIGN KEY(car_id) REFERENCES car_attributes(car_id)
	
INSERT INTO maintenance(
	workorder,
	car_id,
	order_created,
	order_completed,
	price,
	summary,
	employee_id
)
VALUES(
	3846,
	9012,
	
	'2020-03-17',
	'2020-03-20',
	322.00,
	'Four new tires',
	384630
),
(
	73456,
	2983,
	
	'2020-04-23',
	'2020-04-24',
	59.99,
	'15 point inspection and new oil plus filter',
	374896
),
(
	45674,
	3954873,
	
	'2020-08-10',
	'2020-08-15',
	1400,
	'bowling ball through windshield',
	2634845
),
(
	435766,
	4456638,
	
	'2020-07-01',
	'2020-07-03',
	125.00,
	'standard tune up repleaced windshield wipers',
	858087
),
(
	345673,
	555444333,
	
	'2020-06-23',
	'2020-07-15',
	3200,
	'slung a rod, bored 30 over',
	384630
	
),
(
	2375,
	38495763,
	
	'2020-09-01',
	'2020-09-01',
	108,
	'nail in side wall of tire, full replacement',
	374896
	
),
	
(
	63456,
	9087967,
	
	'2020-01-09',
	'2020-01-09',
	59.99,
	'standard oil change',
	2634845
	
),
(
	2234,
	3332,
	
	'2020-05-13',
	'2020-05-16',
	210,
	'customer damaged stereo while tyring to install speakers',
	858087
	
),
(
	84657,
	12345,
	
	'2020-06-14',
	'2020-06-17',
	450.00,
	'bumped a fire hydrant, pulled dent out',
	374896
	
),
(
	84356,
	847566,
	
	'2020-05-05',
	'2020-05-05',
	125,
	'standard tune up',
	2634845
	
)

INSERT INTO insurance_coverage(
	insurance_number,
	insurance_provider,
	car_id
)
VALUES(
	2376,
	'State Farm',
	9012
	
),
(
	3846,
	'Progressive',
	2983
	
),
(
	578,
	'Geico',
	3954873
	
),
(
	5843,
	'The General',
	4456638
	
),
(
	2343,
	'ALFA',
	555444333
	
),
(
	9998,
	'Farmers',
	38495763
	
),
(
	3544,
	'FLO',
	38495763
	
),
(
	1716,
	'Cave Man',
	9087967
	
),
(
	2345,
	'State Farm',
	3332
	
),
(
	98452,
	'State Farm',
	12345
	
),
(
	2365,
	'State Farm',
	847566
	
)
	
INSERT INTO payment_attributes(
	financing_number
	--FOREIGN KEY(financing_number)REFERENCES financing(financing_number)
)

VALUES(
	687645
),
(
	102938
),
(
	645321
),
(
	956328
),
(
	978564
),
(
	5635458
),
(
	687333
),
(
	687332
),
(
	297856
),
(
	278058
)
ALTER TABLE payment_attributes
	
	
	
	


	






