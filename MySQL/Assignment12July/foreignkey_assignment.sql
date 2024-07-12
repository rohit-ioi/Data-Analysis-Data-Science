create database salesdb;
use salesdb;

create table productlines(
productLine varchar(50) primary key,
textDescription VARCHAR(4000),
htmlDescription MEDIUMTEXT,
image MEDIUMBLOB
);

create table products(
productCode VARCHAR(15) PRIMARY KEY,
productName VARCHAR(70) NOT NULL,
productLine VARCHAR(50),
productScale VARCHAR(10) NOT NULL,
productVendor VARCHAR(50) NOT NULL,
productDescription TEXT NOT NULL,
quantityInStock SMALLINT NOT NULL,
buyPrice DECIMAL(10, 2) NOT NULL,
MSRP DECIMAL(10, 2) NOT NULL,

CONSTRAINT fk_category
    FOREIGN KEY (productLine) 
        REFERENCES productlines(productLine)
        ON UPDATE SET NULL
        ON DELETE SET NULL 
);



create table employees(
employeeNumber int primary key,
lastname varchar(50) not null,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
jobTitle VARCHAR(50) NOT NULL,
reportsTo INT,
officeCode varchar(10),
CONSTRAINT Hello FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber),
CONSTRAINT Hii Foreign key (officeCode) REFERENCES offices(officeCode)
);


create table offices(
officeCode VARCHAR(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL
);


create table customers(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
creditLimit DECIMAL(10, 2),
salesRepEmployeeNumber int,
CONSTRAINT Hiiii FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(reportsTo)
);

alter table customers
add constraint FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber);

ALTER TABLE  customers
DROP  FOREIGN KEY Hiiii;



select * from customers;
create table orders(
orderNumber INT PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE,
status VARCHAR(15) NOT NULL,
comments TEXT,
customerNumber int,
CONSTRAINT bye FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber),
CONSTRAINT kye FOREIGN KEY (orderNumber) REFERENCES orderdetails(orderNumber)
);
select * from orders;
                
ALTER TABLE orders
ADD CONSTRAINT order_to_customer
FOREIGN KEY (customerNumber)
REFERENCES customers (customerNumber);


create table payments(
checkNumber VARCHAR(50) ,
customerNumber int,
primary key(checkNumber ,customerNumber), 
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
CONSTRAINT sye FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);


create table orderdetails(
orderNumber int,
productCode varchar(15),
primary key(orderNumber ,productCode),
quantityOrdered int not null,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL,
CONSTRAINT dye FOREIGN KEY (productCode) REFERENCES products(productCode)
);

insert into productlines(productLine,textDescription)
values
('Classic Cars', 'Cars from the 1950s and 1960s'),
('Motorcycles', 'A range of motorcycles');



insert into products
values
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever.', 7933, 48.81, 95.70);

insert into products
values
('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 'Turnable front wheels; steering function.', 7305, 34.00, 67.20),
('S12_1099', '1958 Setra Bus', 'Motorcycles', '1:18', 'Highway 66 Mini Classics', 'Detailed interior and exterior.', 6982, 29.50, 49.30),
('S18_3232', '1961 Chevrolet Impala', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'Opening doors, hood, and trunk.', 4582, 32.95, 79.50),
('S24_1628', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:12', 'Studio M Art Models', 'Working suspension, detailed engine.', 9124, 68.99, 103.00),
('S32_1374', '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', '1:10', 'Min Lin Diecast', 'Features detailed parts.', 6642, 31.75, 43.60);







-- #####################################################################


insert into offices
values
('1', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA'),
('2', 'New York', '+1 212 555 1234', '200 Broadway', 'Floor 10', 'NY', 'USA', '10007', 'NA'),
('3', 'Los Angeles', '+1 323 123 4567', '300 Sunset Blvd', 'Suite 500', 'CA', 'USA', '90028', 'NA');


select * from offices;

-- #####################################################################


insert into employees
values
	(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', 'President', NULL,'1'),
    (1003, 'Brown', 'Jim', 'x5801', 'jbrown@classicmodelcars.com','Vice President' , NULL,'1' ),
	(1004, 'Smith', 'Susan', 'x5802', 'ssmith@classicmodelcars.com','Sales Manager' , NULL,'1' ),
	(1005, 'Johnson', 'Michael', 'x5803', 'mjohnson@classicmodelcars.com', 'Marketing Manager', NULL, '1'),
	(1006, 'Williams', 'Karen', 'x5804', 'kwilliams@classicmodelcars.com', 'Finance Manager', NULL,'1' ),
	(1007, 'Jones', 'David', 'x5805', 'djones@classicmodelcars.com','IT Manager', NULL, '1' ),
	(1008, 'Taylor', 'Patricia', 'x5806', 'ptaylor@classicmodelcars.com', 'HR Manager' , NULL,'1');
    
select * from employees;

-- #####################################################################-- 
select * from customers;
insert into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,city,country,postalCode,creditLimit,salesRepEmployeeNumber)
values
(104, 'Signal Gift Stores', 'King', 'Jean', '33.55.6545', '8489 Strong St.', 'Paris', 'France', 1337, 120000.00,1003),
(105, 'Australian Collectors, Co.', 'Nelson', 'Susan', '22.55.6767', '636 St Kilda Road', 'Melbourne', 'Australia', 1370, 95000.00,1004),
(106, 'La Rochelle Gifts', 'Andrews', 'Peter', '67.55.2222', '67, rue des Cinquante Otages', 'La Rochelle', 'France', 1370, 90000.00,1005),
(107, 'Osaka Souvenirs Co.', 'Yamamoto', 'Hiro', '45.66.7788', '24, kyobashi', 'Osaka', 'Japan', 1621,120000.00, 1006);


-- ############################################################

insert into orders
values
(10101, '2003-02-12', '2003-02-19', '2003-02-15', 'Shipped',"", 104),
(10102, '2003-03-03', '2003-03-10', '2003-03-07', 'Shipped',"", 105),
(10103, '2003-04-15', '2003-04-22', '2003-04-18', 'Shipped', "",106),
(10104, '2003-05-23', '2003-05-30', '2003-05-27', 'Shipped', "",107);


select * from orders;

-- ############################################################

insert into orderdetails
values
(10101, 'S10_1949', 50, 67.20, 2),
(10102, 'S12_1099', 22, 49.30, 1),
(10103, 'S18_3232', 15, 79.50, 3),
(10104, 'S24_1628', 10, 103.00, 2);


insert into payments
values
( 'HQ445566',104, '2005-01-23', 7200.50),
('HQ554477', 105, '2006-03-15', 8390.25),
('HQ663388', 106, '2007-07-30', 9123.80);


