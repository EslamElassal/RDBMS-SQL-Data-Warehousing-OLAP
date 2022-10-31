/*---The TimeID points to the Timeline dimension table with the attributes 
   (TimeID, Date, Month_text, e.g. october, Quarter_text, e.g., Qtr 3, Year).*/
create table TIMELINE (
 TimeID int primary key,
 TDate varchar(20),
 N_Month int,
 Month_text varchar(20),
 N_Qtr int,
 Qtr varchar(20),
 TYear int
)
---------------------------------------------------------------------------------
INSERT INTO TIMELINE VALUES (43023, '15-OCT-2017', 10, 'October', 3, 'Qtr3', 2017);
INSERT INTO TIMELINE VALUES (43033, '25-OCT-2017', 10, 'October', 3, 'Qtr3', 2017);
INSERT INTO TIMELINE VALUES (43089, '20-DEC-2017', 12, 'December', 3, 'Qtr3', 2017);
INSERT INTO TIMELINE VALUES (43184, '25-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TIMELINE VALUES (43186, '27-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TIMELINE VALUES (43190, '31-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TIMELINE VALUES (43193, '03-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TIMELINE VALUES (43198, '08-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TIMELINE VALUES (43213, '23-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TIMELINE VALUES (43227, '07-MAY-2018', 5, 'May', 2, 'Qtr2', 2018);
INSERT INTO TIMELINE VALUES (43241, '21-MAY-2018', 5, 'May', 2, 'Qtr2', 2018);
INSERT INTO TIMELINE VALUES (43256, '05-JUN-2018', 6, 'June', 2, 'Qtr2', 2018);
-----------------------------------------------------------------------------------

Select * from TIMELINE
-----------------------------------------------------------------------------------

/*The customerID points to the Customer dimension table with the attributes 
(CustomerID, CustomerName, Email, PhoneAreaCode, City, State and ZIP).*/

create table CUSTOMER 
(
  CustomerID int primary key,
  CustomerName varchar(50),
  Email varchar(50),
  PhoneAreaCode varchar(20),
  City varchar(50),
  State varchar(50),
  ZIP varchar(50)
)

------------------------------------------------------------------
INSERT INTO CUSTOMER VALUES (1, 'Jacobs, Nancy', 'somewhere.com', '817', 'Fort Worth', 'TX', '76110');
INSERT INTO CUSTOMER VALUES (2, 'Jacobs, Chantel', 'somewhere.com', '817', 'Fort Worth', 'TX', '76112');
INSERT INTO CUSTOMER VALUES (3, 'Able, Ralph', 'somewhere.com', '210', 'San Antonio', 'TX', '78214');
INSERT INTO CUSTOMER VALUES (4, 'Baker, Susan', 'elsewhere.com', '210', 'San Antonio', 'TX', '78216');
INSERT INTO CUSTOMER VALUES (5, 'Eagleton, Sam', 'elsewhere.com', '210', 'San Antonio', 'TX', '78218');
INSERT INTO CUSTOMER VALUES (6, 'Foxtrot, Kathy', 'somewhere.com', '972', 'Dallas', 'TX', '75220');
INSERT INTO CUSTOMER VALUES (7, 'George, Sally', 'somewhere.com', '972', 'Dallas', 'TX', '75223');
INSERT INTO CUSTOMER VALUES (8, 'Hullett, Shawn', 'elsewhere.com', '972', 'Dallas', 'TX', '75224');
INSERT INTO CUSTOMER VALUES (9, 'Pearson, Bobbi', 'elsewhere.com', '512', 'Austin', 'TX', '78710');
INSERT INTO CUSTOMER VALUES (10, 'Ranger, Terry', 'somewhere.com', '512', 'Austin', 'TX', '78712');
INSERT INTO CUSTOMER VALUES (11, 'Tyler, Jenny', 'somewhere.com', '972', 'Dallas', 'TX', '75225');
INSERT INTO CUSTOMER VALUES (12, 'Wayne, Joan', 'elsewhere.com', '817', 'Fort Worth', 'TX', '76115');
------------------------------------------------------------------

select * from CUSTOMER
---------------------------------

/*The ProductNumber points to the Product dimension table with the attributes
 (ProductNumber, ProductType and ProductName).*/

create table PRODUCT
(
   ProductNumber varchar(50) primary key,
   ProductType varchar(50),
   ProductName varchar(max)
)

---------------------------------------------------------
INSERT INTO PRODUCT VALUES ('BK001', 'Book', 'Kitchen Remodeling Basics For Everyone');
INSERT INTO PRODUCT VALUES ('BK002', 'Book', 'Advanced Kitchen Remodeling For Everyone');
INSERT INTO PRODUCT VALUES ('BK003', 'Book', 'Kitchen Remodeling Dallas Style For Everyone');
INSERT INTO PRODUCT VALUES ('VB001', 'Video Companion', 'Kitchen Remodeling Basics');
INSERT INTO PRODUCT VALUES ('VB002', 'Video Companion', 'Advanced Kitchen Remodeling I');
INSERT INTO PRODUCT VALUES ('VB003', 'Video Companion', 'Kitchen Remodeling Dallas Style');
INSERT INTO PRODUCT VALUES ('VK001', 'Video', 'Kitchen Remodeling Basics');
INSERT INTO PRODUCT VALUES ('VK002', 'Video', 'Advanced Kitchen Remodeling');
INSERT INTO PRODUCT VALUES ('VK003', 'Video', 'Kitchen Remodeling Dallas Style');
INSERT INTO PRODUCT VALUES ('VK004', 'Video', 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16');
---------------------------------------------------------

select * from PRODUCT
------------------------------------------------

/*
  The Quantity attribute is the number of seminar ordered, the UnitPrice is the cost and the Total is what the customer paid.
  Sales (TimeID, CustomerID, ProductNumber, Quantity, UnitPrice, Total)
*/

create table PRODUCT_SALES
(
  TimeID int,
  CustomerID int,
  ProductNumber varchar(50),
  Quantity int,
  UnitPrice float,
  Total float,
  constraint PK_PRODUCT_SALES primary key (TimeID, CustomerID, ProductNumber),
  constraint FK_PRODUCT_SALES_TIMELINE foreign key (TimeID) references TIMELINE(TimeID),
  constraint FK_PRODUCT_SALES_CUSTOMER foreign key (CustomerID) references CUSTOMER(CustomerID),
  constraint FK_PRODUCT_SALES_PRODUCT foreign key (ProductNumber) references PRODUCT(ProductNumber),
)

INSERT INTO PRODUCT_SALES VALUES (43023, 3, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43023, 3, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43033, 4, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43033, 4, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43033, 4, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43089, 7, 'VK004', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43184, 4, 'BK002', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43184, 4, 'VK002', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43184, 4, 'VK004', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 6, 'BK002', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 6, 'VB003', 1, 9.99, 9.99);
INSERT INTO PRODUCT_SALES VALUES (43186, 6, 'VK002', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 6, 'VK003', 1, 19.95, 19.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 6, 'VK004', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 7, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 7, 'BK002', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 7, 'VK003', 1, 19.95, 19.95);
INSERT INTO PRODUCT_SALES VALUES (43186, 7, 'VK004', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43190, 9, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43190, 9, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43190, 9, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43193, 11, 'VB003', 2, 9.99, 19.98);
INSERT INTO PRODUCT_SALES VALUES (43193, 11, 'VK003', 2, 19.95, 39.90);
INSERT INTO PRODUCT_SALES VALUES (43193, 11, 'VK004', 2, 24.95, 49.90);
INSERT INTO PRODUCT_SALES VALUES (43198, 1, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43198, 1, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43198, 1, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43198, 5, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43198, 5, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43198, 5, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43213, 3, 'BK001', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43227, 9, 'VB002', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43227, 9, 'VK002', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43241, 8, 'VB003', 1, 9.99, 9.99);
INSERT INTO PRODUCT_SALES VALUES (43241, 8, 'VK003', 1, 19.95, 19.95);
INSERT INTO PRODUCT_SALES VALUES (43241, 8, 'VK004', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 3, 'BK002', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 3, 'VB001', 1, 7.99, 7.99);
INSERT INTO PRODUCT_SALES VALUES (43256, 3, 'VB002', 2, 7.99, 15.98);
INSERT INTO PRODUCT_SALES VALUES (43256, 3, 'VK001', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 3, 'VK002', 2, 14.95, 29.90);
INSERT INTO PRODUCT_SALES VALUES (43256, 11, 'VB002', 2, 7.99, 15.98);
INSERT INTO PRODUCT_SALES VALUES (43256, 11, 'VK002', 2, 14.95, 29.90);
INSERT INTO PRODUCT_SALES VALUES (43256, 12, 'BK002', 1, 24.95, 24.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 12, 'VB003', 1, 9.99, 9.99);
INSERT INTO PRODUCT_SALES VALUES (43256, 12, 'VK002', 1, 14.95, 14.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 12, 'VK003', 1, 19.95, 19.95);
INSERT INTO PRODUCT_SALES VALUES (43256, 12, 'VK004', 1, 24.95, 24.95);

--------------------------------------------------------------------------------
select * from PRODUCT_SALES