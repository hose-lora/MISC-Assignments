DROP DATABASE IF EXISTS climatrix;
CREATE DATABASE climatrix;
USE climatrix;

CREATE TABLE consultant
	(ConsltNum CHAR(2),
    LastName CHAR(15),
    FirstName CHAR(15),
    Street CHAR(15),
    City CHAR(15),
    State CHAR(2),
    ZipCode CHAR(5),
    Hours DECIMAL(4,2),
    Rate DECIMAL(5,2),
    CONSTRAINT pk_consultant PRIMARY KEY (ConsltNum)
    );

DESC consultant;
    
    
   
CREATE TABLE client
	(ClientNum CHAR(3),
	ClientName VARCHAR(50),
	Street CHAR(20),
	City CHAR(15),
	State CHAR(2),
	ZipCode CHAR(5),
	Balance DECIMAL(8,2),
	CreditLimit DECIMAL(8,2),
	ConsltNum CHAR(2),
	CONSTRAINT pk_client PRIMARY KEY (ClientNum),
	CONSTRAINT fk_client_consultnum FOREIGN KEY (ConsltNum)
	REFERENCES consultant (ConsltNum)
	);
        
desc client;
        
CREATE TABLE workorder
	(OrderNum CHAR(5),
	OrderDate DATE,
	ClientNum CHAR(3),
	CONSTRAINT pk_workorder PRIMARY KEY (OrderNum),
	CONSTRAINT fk_workorddr_clientNum FOREIGN KEY (ClientNum)
	REFERENCES client (ClientNum)
	);
            
desc workorder;
            
drop table if exists task;
            
CREATE TABLE task
	(TaskID CHAR(4),
	Description CHAR(30),
	Category CHAR(3),
	Price DECIMAL(6,2),
	constraint pk_task PRIMARY KEY (TASKID)
	);
                
desc task;
                
                
CREATE TABLE orderdetail
	(OrderNum CHAR(5),
	TaskID CHAR(4),
	ScheduleDate DATE,
	QuotedPrice DECIMAL(6,2),
	PRIMARY KEY (OrderNum, TaskID),
	constraint fk_order_detail foreign key (OrderNum)
	REFERENCES workorder (OrderNum),
	constraint fk_orderd_detail foreign key (TaskID)
	REFERENCES task (TaskID)
	);
                
desc orderdetail;
              
              
INSERT INTO consultant (ConsltNum, LastName, FirstName, Street, City,	State, ZipCode,	Hours, Rate)
	VALUES
		(19, 'Turner', 'Christopher', '554 Brown Dr.' ,'Tri City', 'FL' , '32889' , '40', '22.5'),
		(22, 'Jordan', 'Patrick', '2287 Port Rd.', 'Easton','FL','33998','40','22.5'),
		(35, 'Allen', 'Sarah', '82 Elliott St.', 'Lizton','FL','34344','35','20'),
		(51, 'Shields', 'Tom', '373 Lincoln Ln.', 'Sunland','FL','39876','10','15');
                    
Select *
FROM Consultant;


INSERT INTO client(ClientNum,ClientName,Street,City,State,ZipCode,Balance,CreditLimit,ConsltNum)
		VALUES 
		('143','Hershey, Jarrod','135 E. Mill Street','Easton','FL','33998','1904.55','2500','19'),
		('299','Two Crafty Cousins','9787 NCR 350 West','Sunland','FL','39876','8354','10000','22'),
		('322','Prichards Pizza & Pasta','501 Air Parkway','Lizton','FL','34344','7335.55','10000','35'),
		('363','Salazar, Jason','56473 Cherry Tree Dr','Easton','FL','33998','900.75','2500','35'),
		('405','Fishermans Spot Shop','49 Elwood Ave.','Harpersburg','FL','31234','4113.4','7500','19'),
		('449','Seymour, Lindsey','4091 Brentwood Ln','Amo','FL','34466','557.7','5000','22'),
		('458','Bonnies Beautiful Boutique','9565 Ridge Rd.','Tri City','FL','32889','4053.8','7500','22'),
		('677','Yates, Nick','231 Day Rd.','Sunland','FL','39876','2523.8','2500','35'),
		('733','Howler, Laura','1368 E. 1000 S.','Lizton','FL','34344','3658.05','5000','22'),
		('75','Goduto, Sean','12 Saratoga Parkway','Tri City','FL','32889','2814.55','5000','19'),
		('826','Harpersburg Bank','65 Forrest Blvd.','Harpersburg','FL','31234','6824.55','10000','19'),
		('867','MarketPoint Sales','826 Host St.','Easton','FL','33998','3089','5000','19');

INSERT INTO workorder(OrderNum,OrderDate,ClientNum)
	Values
		('67101', DATE_FORMAT(STR_TO_DATE('9/06/2018', '%c/%d/%Y'), '%Y-%m-%d'),'733'),
		('67313', DATE_FORMAT(STR_TO_DATE('9/7/2018', '%c/%d/%Y'), '%Y-%m-%d'),'458'),
		('67424', DATE_FORMAT(STR_TO_DATE('9/10/2018', '%c/%d/%Y'), '%Y-%m-%d'),'322'),
		('67838', DATE_FORMAT(STR_TO_DATE('9/10/2018', '%c/%d/%Y'), '%Y-%m-%d'),'867'),
		('67949', DATE_FORMAT(STR_TO_DATE('9/10/2018', '%c/%d/%Y'), '%Y-%m-%d'),'322'),
		('68252', DATE_FORMAT(STR_TO_DATE('9/12/2018', '%c/%d/%Y'), '%Y-%m-%d'),'363'),
		('68868', DATE_FORMAT(STR_TO_DATE('9/14/2018', '%c/%d/%Y'), '%Y-%m-%d'),'867'),
		('68979', DATE_FORMAT(STR_TO_DATE('9/17/2018', '%c/%d/%Y'), '%Y-%m-%d'),'826');

INSERT INTO TASK(TaskID,Description,Category,Price)
	VALUES
		('AC65','Accessories','ACC','80'),
		('DA11','Data recovery major','DRM','175'),
		('DI85','Data recovery minor','DRM','50'),
		('HA63','Hardware major','HAM','225'),
		('HI31','Hardware minor','HAM','165'),
		('LA81','Local area networking (LAN)','LAN','104'),
		('MO49','Mobility','MOB','65'),
		('OT99','Other work','OTH','99.99'),
		('PI54','Printing issues','PRI','50'),
		('SA44','Software major','SOM','200'),
		('SI77','Software minor','SOM','144'),
		('SI91','Security install/repair','SIR','126'),
		('UP38','Upgrades','UPG','185'),
		('VR39','Virus removal','VIR','90'),
		('WA33','Wide area networking (WAN)','WAN','130'),
		('WC19','Web connectivity','WEC','75');


INSERT INTO OrderDetail(OrderNum,TaskID,ScheduleDate,QuotedPrice)
	Values
		('67101','SI77', DATE_FORMAT(STR_TO_DATE('9/10/2018', '%c/%d/%Y'), '%Y-%m-%d'),'144'),
		('67313','LA81', DATE_FORMAT(STR_TO_DATE('9/12/2018', '%c/%d/%Y'), '%Y-%m-%d'),'104'),
		('67424','MO49', DATE_FORMAT(STR_TO_DATE('9/14/2018', '%c/%d/%Y'),'%Y-%m-%d'),'65'),
		('67424','UP38', DATE_FORMAT(STR_TO_DATE('9/14/2018', '%c/%d/%Y'),'%Y-%m-%d'),'185'),
		('67838','LA81', DATE_FORMAT(STR_TO_DATE('9/14/2018', '%c/%d/%Y'),'%Y-%m-%d'),'104'),
		('67949','PI54', DATE_FORMAT(STR_TO_DATE('9/21/2018', '%c/%d/%Y'),'%Y-%m-%d'),'50'),
		('67949','VR39', DATE_FORMAT(STR_TO_DATE('9/21/2018', '%c/%d/%Y'),'%Y-%m-%d'),'88'),
		('67949','WA33', DATE_FORMAT(STR_TO_DATE('9/21/2018', '%c/%d/%Y'),'%Y-%m-%d'),'126'),
		('68252','DI85', DATE_FORMAT(STR_TO_DATE('9/24/2018', '%c/%d/%Y'),'%Y-%m-%d'),'50'),
		('68868','SA44', DATE_FORMAT(STR_TO_DATE('9/24/2018', '%c/%d/%Y'),'%Y-%m-%d'),'200'),
		('68979','AC65', DATE_FORMAT(STR_TO_DATE('9/27/2018', '%c/%d/%Y'),'%Y-%m-%d'),'77'),
		('68979','DA11', DATE_FORMAT(STR_TO_DATE('9/27/2018', '%c/%d/%Y'),'%Y-%m-%d'),'970');
        
        SELECT * 
        FROM workorder;