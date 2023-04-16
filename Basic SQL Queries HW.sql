DROP DATABASE IF EXISTS ADVENTURE;

CREATE DATABASE ADVENTURE;

USE ADVENTURE;

CREATE TABLE Guide
(GuideNum CHAR(4) PRIMARY KEY,
LastName VARCHAR(15),
FirstName VARCHAR(15),
Address VARCHAR(25),
City VARCHAR(25),
State CHAR(2),
PostalCode CHAR(5),
PhoneNum CHAR(12),
HireDate DATE);

CREATE TABLE Trip
(TripID INT PRIMARY KEY,
TripName VARCHAR(75),
StartLocation VARCHAR(50),
State CHAR(2),
Distance DECIMAL(4,0),
MaxGrpSize DECIMAL(4,0),
Type VARCHAR(20),
Season VARCHAR(20) );

CREATE TABLE GuideQual
(TripID INT,
GuideNum CHAR(4),
PRIMARY KEY (TripID, GuideNum),
Constraint fk_TripGuide_trip FOREIGN KEY (TripID) 
     REFERENCES trip(tripID),
Constraint fk_TripGuide_guide FOREIGN KEY (GuideNum)
     REFERENCES Guide(GuideNum)
 );

CREATE TABLE Customer
(CustomerNum CHAR(4) PRIMARY KEY,
LastName VARCHAR(30) NOT NULL,
FirstName VARCHAR (30),
Address VARCHAR(35),
City CHAR(35),
State CHAR(2),
PostalCode CHAR(5),
Phone CHAR(12) );

CREATE TABLE Reservation
(ReservationID CHAR(7) PRIMARY KEY,
TripID INT,
TripDate DATE,
NumPersons DECIMAL(3,0),
TripPrice DECIMAL(6,2),
OtherFees DECIMAL(6,2),
CustomerNum CHAR(4),
GuideNum CHAR(4),
Constraint fk_reservation_trip FOREIGN KEY (TripID) 
 REFERENCES trip(tripID),
Constraint fk_reservation_customer FOREIGN KEY (CustomerNum) 
 REFERENCES Customer(CustomerNum),
Constraint fk_reservation_guide FOREIGN KEY (GuideNum) 
 REFERENCES Guide(GuideNum)
);

INSERT INTO Guide
VALUES
('AM01','Abrams','Miles','54 Quest Ave.','Williamsburg','MA','01096','617-555-6032','2012-6-3'),
('BR01','Boyers','Rita','140 Oakton Rd.','Jaffrey','NH','03452','603-555-2134','2012-3-4'),
('DH01','Devon','Harley','25 Old Ranch Rd.','Sunderland','MA','01375','781-555-7767','2012-1-8'),
('GZ01','Gregory','Zach','7 Moose Head Rd.','Dummer','NH','03588','603-555-8765','2012-11-4'),
('KS01','Kiley','Susan','943 Oakton Rd.','Jaffrey','NH','03452','603-555-1230','2013-4-8'),
('KS02','Kelly','Sam','9 Congaree Ave.','Fraconia','NH','03580','603-555-0003','2013-6-10'),
('MR01','Marston','Ray','24 Shenandoah Rd.','Springfield','MA','01101','781-555-2323','2015-9-14'),
('RH01','Rowan','Hal','12 Heather Rd.','Mount Desert','ME','04660','207-555-9009','2014-6-2'),
('SL01','Stevens','Lori','15 Riverton Rd.','Coventry','VT','05825','802-555-3339','2014-9-5'),
('UG01','Unser','Glory','342 Pineview St.','Danbury','CT','06810','203-555-8534','2015-2-2');

INSERT INTO Trip
VALUES
(1,'Arethusa Falls ','Harts Location','NH',5,10,'Hiking','Summer'),
(2,'Mt Ascutney - North Peak','Weathersfield','VT',5,6,'Hiking','Late Spring'),
(3,'Mt Ascutney - West Peak','Weathersfield','VT',6,10,'Hiking','Early Fall'),
(4,'Bradbury Mountain Ride','Lewiston-Auburn','ME',25,8,'Biking','Early Fall'),
(5,'Baldpate Mountain ','North Newry','ME',6,10,'Hiking','Late Spring'),
(6,'Blueberry Mountain','Batchelders Grant','ME',8,8,'Hiking','Early Fall'),
(7,'Bloomfield - Maidstone','Bloomfield','CT',10,6,'Paddling','Late Spring'),
(8,'Black Pond','Lincoln','NH',8,12,'Hiking','Summer'),
(9,'Big Rock Cave','Tamworth','NH',6,10,'Hiking','Summer'),
(10,'Mt. Cardigan - Firescrew','Orange','NH',7,8,'Hiking','Summer'),
(11,'Chocorua Lake Tour','Tamworth','NH',12,15,'Paddling','Summer'),
(12,'Cadillac Mountain Ride','Bar Harbor','ME',8,16,'Biking','Early Fall'),
(13,'Cadillac Mountain','Bar Harbor','ME',7,8,'Hiking','Late Spring'),
(14,'Cannon Mtn','Franconia','NH',6,6,'Hiking','Early Fall'),
(15,'Crawford Path Presidentials Hike','Crawford Notch','NH',16,4,'Hiking','Summer'),
(16,'Cherry Pond','Whitefield','NH',6,16,'Hiking','Spring'),
(17,'Huguenot Head Hike','Bar Harbor','ME',5,10,'Hiking','Early Fall'),
(18,'Low Bald Spot Hike','Pinkam Notch','NH',8,6,'Hiking','Early Fall'),
(19,'Masons Farm ','North Stratford','CT',12,7,'Paddling','Late Spring'),
(20,'Lake Mephremagog Tour','Newport','VT',8,15,'Paddling','Late Spring'),
(21,'Long Pond','Rutland','MA',8,12,'Hiking','Summer'),
(22,'Long Pond Tour','Greenville','ME',12,10,'Paddling','Summer'),
(23,'Lower Pond Tour','Poland','ME',8,15,'Paddling','Late Spring'),
(24,'Mt Adams ','Randolph','NH',9,6,'Hiking','Summer'),
(25,'Mount Battie Ride','Camden','ME',20,8,'Biking','Early Fall'),
(26,'Mount Cardigan Hike','Cardigan','NH',4,16,'Hiking','Late Fall'),
(27,'Mt. Chocorua','Albany','NH',6,10,'Hiking','Spring'),
(28,'Mount Garfield Hike','Woodstock','NH',5,10,'Hiking','Early Fall'),
(29,'Metacomet-Monadnock Trail Hike','Pelham','MA',10,12,'Hiking','Late Spring'),
(30,'McLennan Reservation Hike','Tyringham','MA',6,16,'Hiking','Summer'),
(31,'Missisquoi River - VT','Lowell','VT',12,10,'Paddling','Summer'),
(32,'Northern Forest Canoe Trail','Stark','NH',15,10,'Paddling','Summer'),
(33,'Park Loop Ride','Mount Desert Island','ME',27,8,'Biking','Late Spring'),
(34,'Pontook Reservoir Tour','Dummer','NH',15,14,'Paddling','Late Spring'),
(35,'Pisgah State Park Ride','Northborough','NH',12,10,'Biking','Summer'),
(36,'Pondicherry Trail Ride','White Mountains','NH',15,16,'Biking','Late Spring'),
(37,'Seal Beach Harbor','Bar Harbor','ME',5,16,'Hiking','Early Spring'),
(38,'Sawyer River Ride','Mount Carrigain','NH',10,18,'Biking','Early Fall'),
(39,'Welch and Dickey Mountains Hike','Thorton','NH',5,10,'Hiking','Summer'),
(40,'Wachusett Mountain','Princeton','MA',8,8,'Hiking','Early Spring'),
(41,'Westfield River Loop','Fort Fairfield','ME',20,10,'Biking','Late Spring');

INSERT INTO GuideQual
VALUES
(1,'GZ01'),
(1,'RH01'),
(2,'AM01'),
(2,'SL01'),
(2,'GZ01'),
(2,'KS01'),
(2,'KS02'),
(2,'UG01'),
(3,'SL01'),
(4,'BR01'),
(4,'GZ01'),
(5,'KS01'),
(5,'UG01'),
(6,'RH01'),
(8,'BR01'),
(9,'BR01'),
(10,'GZ01'),
(11,'DH01'),
(11,'KS01'),
(11,'UG01'),
(12,'BR01'),
(13,'RH01'),
(13,'SL01'),
(13,'UG01'),
(14,'KS02'),
(15,'AM01'),
(15,'BR01'),
(15,'DH01'),
(15,'GZ01'),
(15,'KS01'),
(15,'KS02'),
(15,'MR01'),
(15,'RH01'),
(15,'SL01'),
(15,'UG01'),
(16,'AM01'),
(16,'DH01'),
(16,'MR01'),
(16,'RH01'),
(16,'SL01'),
(16,'UG01'),
(17,'DH01'),
(17,'GZ01'),
(17,'KS01'),
(17,'KS02'),
(17,'RH01'),
(19,'DH01'),
(19,'GZ01'),
(19,'KS01'),
(19,'KS02'),
(19,'MR01'),
(19,'RH01'),
(19,'SL01'),
(20,'SL01'),
(21,'AM01'),
(22,'UG01'),
(23,'DH01'),
(23,'GZ01'),
(23,'KS01'),
(23,'KS02'),
(23,'MR01'),
(23,'RH01'),
(23,'SL01'),
(24,'BR01'),
(24,'AM01'),
(25,'BR01'),
(26,'GZ01'),
(28,'BR01'),
(29,'DH01'),
(30,'AM01'),
(31,'SL01'),
(32,'KS01'),
(33,'UG01'),
(34,'KS01'),
(35,'GZ01'),
(36,'KS02'),
(37,'RH01'),
(38,'KS02'),
(39,'BR01'),
(39,'MR01'),
(39,'RH01'),
(41,'AM01'),
(41,'BR01'),
(41,'DH01'),
(41,'GZ01'),
(41,'KS01'),
(41,'KS02'),
(41,'MR01'),
(41,'RH01'),
(41,'SL01'),
(41,'UG01');


INSERT INTO Customer
VALUES
('101','Northfold','Liam','9 Old Mill Rd.','Londonderry','NH','03053','603-555-7563'),
('102','Ocean','Arnold','2332 South St. Apt 3','Springfield','MA','01101','413-555-3212'),
('103','Kasuma','Sujata','132 Main St. #1','East Hartford','CT','06108','860-555-0703'),
('104','Goff','Ryan','164A South Bend Rd.','Lowell','MA','01854','781-555-8423'),
('105','McLean','Kyle','345 Lower Ave.','Wolcott','NY','14590','585-555-5321'),
('106','Morontoia','Joseph','156 Scholar St.','Johnston','RI','02919','401-555-4848'),
('107','Marchand','Quinn','76 Cross Rd.','Bath','NH','03740','603-555-0456'),
('108','Rulf','Uschi','32 Sheep Stop St.','Edinboro','PA','16412','814-555-5521'),
('109','Caron','Jean Luc','10 Greenfield St.','Rome','ME','04963','207-555-9643'),
('110','Bers','Martha','65 Granite St.','York','NY','14592','585-555-0111'),
('112','Jones','Laura','373 Highland Ave.','Somerville','MA','02143','857-555-6258'),
('115','Vaccari','Adam','1282 Ocean Walk','Ocean City','NJ','08226','609-555-5231'),
('116','Murakami','Iris','7 Cherry Blossom St.','Weymouth','MA','02188','617-555-6665'),
('119','Chau','Clement','18 Ark Ledge Ln.','Londonderry','VT','05148','802-555-3096'),
('120','Gernowski','Sadie','24 Stump Rd.','Athens','ME','04912','207-555-4507'),
('121','Bretton-Borak','Siam','10 Old Main St.','Cambridge','VT','05444','802-555-3443'),
('122','Hefferson','Orlagh','132 South St. Apt 27','Manchester','NH','03101','603-555-3476'),
('123','Barnett','Larry','25 Stag Rd.','Fairfield','CT','06824','860-555-9876'),
('124','Busa','Karen','12 Foster St.','South Windsor','CT','06074','857-555-5532'),
('125','Peterson','Becca','51 Fredrick St.','Albion','NY','14411','585-555-0900'),
('126','Brown','Brianne','154 Central St.','Vernon','CT','06066','860-555-3234');


INSERT INTO reservation
VALUES
('1600001',40,'2018-3-26',2,55.00,0.00,'101','AM01'),
('1600002',21,'2018-6-8',2,95.00,0.00,'101','BR01'),
('1600003',28,'2018-9-12',1,35.00,0.00,'103','BR01'),
('1600004',26,'2018-10-16',4,45.00,15.00,'104','UG01'),
('1600005',39,'2018-6-25',5,55.00,0.00,'105','SL01'),
('1600006',32,'2018-6-18',1,80.00,20.00,'106','UG01'),
('1600007',22,'2018-7-9',8,75.00,10.00,'107','UG01'),
('1600008',28,'2018-9-12',2,35.00,0.00,'108','GZ01'),
('1600009',38,'2018-9-11',2,90.00,40.00,'109','GZ01'),
('1600010',2,'2018-5-14',3,25.00,0.00,'102','GZ01'),
('1600011',3,'2018-9-15',3,25.00,0.00,'102','GZ01'),
('1600012',1,'2018-6-12',4,15.00,0.00,'115','MR01'),
('1600013',8,'2018-7-9',1,20.00,5.00,'116','MR01'),
('1600014',12,'2018-10-1',2,40.00,5.00,'119','RH01'),
('1600015',10,'2018-7-23',1,20.00,0.00,'120','KS01'),
('1600016',11,'2018-7-23',6,75.00,15.00,'121','KS02'),
('1600017',39,'2018-6-18',3,20.00,5.00,'122','KS02'),
('1600018',38,'2018-9-18',4,85.00,15.00,'126','KS01'),
('1600019',25,'2018-8-29',2,110.00,25.00,'124','KS01'),
('1600020',28,'2018-8-27',2,35.00,10.00,'124','DH01'),
('1600021',32,'2018-6-11',3,90.00,20.00,'112','DH01'),
('1600022',21,'2018-6-8',1,95.00,25.00,'119','AM01'),
('1600024',38,'2018-9-11',1,70.00,30.00,'121','AM01'),
('1600025',38,'2018-9-11',2,70.00,45.00,'125','AM01'),
('1600026',12,'2018-10-1',2,40.00,0.00,'126','UG01'),
('1600029',4,'2018-9-19',4,105.00,25.00,'120','UG01'),
('1600030',15,'2018-7-25',6,60.00,15.00,'104','UG01');

/* This assignment is based on a fictitious tourist company Adventure Inc. that
offers different tours in New England area.
The database includes five tables, including guide, trip, guidqual, customer and
reservation. Guide table includes information about each tour guide who will lead
the trip for the customer,
trip table include the information about various trips offered by this company.
Guidqual table show which guide is qualified to lead which trip.
Please be aware that not all guides are qualified for each trip. Trip is led by a
qualified guide, sometime, the company may assign a trip to an unqualified guide.
Customer table includes information about customers. Reservation table includes the
reservation made by each customer for various trips. */
/* MySQL Assignment 2: Basic SQL Queries
Complete the following 10 queries based on Adventure database
To create Adventure database, please run the attached script
CreateAdventureDatabase.sql.
I also attached ERD for Adventure for your reference.
Please submit the completed script file with SQL query and result at the end
of each question. You only need to include the first 10 rows if your result has
more than 10 rows.
You may export the result into a csv file, and open csv file, copy and paste
the result into your solution file.
below is a sample question with the sql query and the result at the end:
Sample question: display the first 10 reservations in the reservation table.
USE adventure;
SELECT
*
FROM
reservation
LIMIT 10;
Result:
ReservationID TripID TripDate NumPersons TripPrice OtherFees
CustomerNum
1600001 40 3/26/2018 2 55 0 101
1600002 21 6/8/2018 2 95 0 101
1600003 28 9/12/2018 1 35 0 103
1600004 26 10/16/2018 4 45 15 104
1600005 39 6/25/2018 5 55 0 105
1600006 32 6/18/2018 1 80 20 106
1600007 22 7/9/2018 8 75 10 107
1600008 28 9/12/2018 2 35 0 108
1600009 38 9/11/2018 2 90 40 109
1600010 2 5/14/2018 3 25 0 102
*/
-- 1. display guide number, last name, first name, and hire date. Order the result by last name.
SELECT guidenum, lastname, firstname, hiredate
FROM guide
ORDER BY lastname
Limit 10;

/*
# guidenum, lastname, firstname, hiredate
AM01, Abrams, Miles, 2012-06-03
BR01, Boyers, Rita, 2012-03-04
DH01, Devon, Harley, 2012-01-08
GZ01, Gregory, Zach, 2012-11-04
KS02, Kelly, Sam, 2013-06-10
KS01, Kiley, Susan, 2013-04-08
MR01, Marston, Ray, 2015-09-14
RH01, Rowan, Hal, 2014-06-02
SL01, Stevens, Lori, 2014-09-05
UG01, Unser, Glory, 2015-02-02

*/

-- 2. Display guide number, last name, and first name for all guides
-- who live in the state of MA and are hired after 2012.

SELECT guidenum, lastname, firstname, state
FROM guide
WHERE state = 'MA';
/*
# guidenum, lastname, firstname, state
AM01, Abrams, Miles, MA
DH01, Devon, Harley, MA
MR01, Marston, Ray, MA
*/

-- 3. display reservation ID, trip ID, trip name, trip date, and total cost for all reservation.
-- total cost is calculated as numPersons*tripPrice+otherFees. Order the result by total cost in desecending order.

SELECT r.reservationid, r.tripid, t.tripname, r.tripdate, r.numpersons*r.tripprice + r.otherfees AS total_cost
FROM reservation r
LEFT JOIN trip t
ON r.tripid = t.tripid
ORDER BY total_cost desc
LIMIT 10;

/*
# reservationid, tripid, tripname, tripdate, total_cost
1600007, 22, Long Pond Tour, 2018-07-09, 610.00
1600016, 11, Chocorua Lake Tour, 2018-07-23, 465.00
1600029, 4, Bradbury Mountain Ride, 2018-09-19, 445.00
1600030, 15, Crawford Path Presidentials Hike, 2018-07-25, 375.00
1600018, 38, Sawyer River Ride, 2018-09-18, 355.00
1600021, 32, Northern Forest Canoe Trail, 2018-06-11, 290.00
1600005, 39, Welch and Dickey Mountains Hike, 2018-06-25, 275.00
1600019, 25, Mount Battie Ride, 2018-08-29, 245.00
1600009, 38, Sawyer River Ride, 2018-09-11, 220.00
1600004, 26, Mount Cardigan Hike, 2018-10-16, 195.00
*/
-- 4. display guide number, guide full name (including first name and last name), guide full address (including address, city, state and postalcode)
SELECT guidenum, concat(firstname, " ", lastname) AS full_name, concat(address, ", ", city, ", ", state, " ", postalcode) as full_address
FROM guide
Limit 10;

/*
# guidenum, full_name, full_address
AM01, Miles Abrams, 54 Quest Ave., Williamsburg, MA 01096
BR01, Rita Boyers, 140 Oakton Rd., Jaffrey, NH 03452
DH01, Harley Devon, 25 Old Ranch Rd., Sunderland, MA 01375
GZ01, Zach Gregory, 7 Moose Head Rd., Dummer, NH 03588
KS01, Susan Kiley, 943 Oakton Rd., Jaffrey, NH 03452
KS02, Sam Kelly, 9 Congaree Ave., Fraconia, NH 03580
MR01, Ray Marston, 24 Shenandoah Rd., Springfield, MA 01101
RH01, Hal Rowan, 12 Heather Rd., Mount Desert, ME 04660
SL01, Lori Stevens, 15 Riverton Rd., Coventry, VT 05825
UG01, Glory Unser, 342 Pineview St., Danbury, CT 06810

*/

-- 5. display guide number, guide full name, gudie hire date in the format of Monday, September 04 2014.
SELECT guidenum, concat(firstname, " ", lastname) AS full_name, date_format(hiredate, '%W, %M %d %Y') AS hire_date
FROM guide
LIMIT 10;

/*
# guidenum, full_name, hire_date
AM01, Miles Abrams, Sunday, June 03 2012
BR01, Rita Boyers, Sunday, March 04 2012
DH01, Harley Devon, Sunday, January 08 2012
GZ01, Zach Gregory, Sunday, November 04 2012
KS01, Susan Kiley, Monday, April 08 2013
KS02, Sam Kelly, Monday, June 10 2013
MR01, Ray Marston, Monday, September 14 2015
RH01, Hal Rowan, Monday, June 02 2014
SL01, Lori Stevens, Friday, September 05 2014
UG01, Glory Unser, Monday, February 02 2015

*/

-- 6. display reservation id, trip id, trip date, and number of persons for all reservations
-- that have between 1 and 5 persons and is in third quarter (July-September). Order by trip date.
SELECT reservationid, tripid, tripdate, numpersons, tripdate
FROM reservation
WHERE numpersons BETWEEN 1 AND 5 AND month(tripdate) in (7,8,9)
ORDER BY tripdate
LIMIT 10;

/*
# reservationid, tripid, tripdate, numpersons, tripdate
1600013, 8, 2018-07-09, 1, 2018-07-09
1600015, 10, 2018-07-23, 1, 2018-07-23
1600020, 28, 2018-08-27, 2, 2018-08-27
1600019, 25, 2018-08-29, 2, 2018-08-29
1600009, 38, 2018-09-11, 2, 2018-09-11
1600024, 38, 2018-09-11, 1, 2018-09-11
1600025, 38, 2018-09-11, 2, 2018-09-11
1600003, 28, 2018-09-12, 1, 2018-09-12
1600008, 28, 2018-09-12, 2, 2018-09-12
1600011, 3, 2018-09-15, 3, 2018-09-15

*/

-- 7. display tripID, tripName, distance, type, season for all trips with tripName includes pond
SELECT tripid, tripname, distance, type, season
FROM trip
WHERE tripname regexp 'pond';

/*
# tripid, tripname, distance, type, season
8, Black Pond, 8, Hiking, Summer
16, Cherry Pond, 6, Hiking, Spring
21, Long Pond, 8, Hiking, Summer
22, Long Pond Tour, 12, Paddling, Summer
23, Lower Pond Tour, 8, Paddling, Late Spring
36, Pondicherry Trail Ride, 15, Biking, Late Spring

*/

-- 8. display tripID, trip name, distance, type, season for all trips with tripName
-- includes either pond or mountain

SELECT tripid, tripname, distance, type, season
FROM trip
WHERE tripname regexp 'pond|mountain'
LIMIT 10;

/*
# tripid, tripname, distance, type, season
4, Bradbury Mountain Ride, 25, Biking, Early Fall
5, Baldpate Mountain , 6, Hiking, Late Spring
6, Blueberry Mountain, 8, Hiking, Early Fall
8, Black Pond, 8, Hiking, Summer
12, Cadillac Mountain Ride, 8, Biking, Early Fall
13, Cadillac Mountain, 7, Hiking, Late Spring
16, Cherry Pond, 6, Hiking, Spring
21, Long Pond, 8, Hiking, Summer
22, Long Pond Tour, 12, Paddling, Summer
23, Lower Pond Tour, 8, Paddling, Late Spring
*/

-- 9. Display reservation ID, trip ID, trip date, customer last name and customer first name
-- for all reservations made by customer in MA during the summer (June-August), order by reservation ID

SELECT r.reservationid, r.tripid, r.tripdate, c.lastname, c.firstname
FROM reservation r
LEFT join customer c
on r.customernum = c.customernum
WHERE state = 'MA' AND month(tripdate) in (6,7,8)
ORDER BY reservationid;

/*
# reservationid, tripid, tripdate, lastname, firstname
1600013, 8, 2018-07-09, Murakami, Iris
1600021, 32, 2018-06-11, Jones, Laura
1600030, 15, 2018-07-25, Goff, Ryan
*/

-- 10. develop a query of your own and display the result. Your query cannot be an existing one and need to include a where condition.
SELECT COUNT(DISTINCT Customernum) AS state_count, State
FROM customer
WHERE state IN ('RI', 'MA', 'CT')
GROUP BY state
ORDER BY state_count DESC;

/*
# state_count, State
4, CT
4, MA
1, RI
*/
